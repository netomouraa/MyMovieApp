//
//  MovieListViewModelTests.swift
//  MyMovieAppTests
//
//  Created by Neto Moura on 11/12/23.
//

import XCTest
import Combine
import MovieService

@testable import MyMovieApp

class MovieListViewModelTests: XCTestCase {

    var viewModel: MovieListViewModel!
    var mockMovieService: MockMovieService!
    var cancellables: Set<AnyCancellable> = []

    override func setUpWithError() throws {
        // Configuração inicial para instâncias necessárias antes dos testes
        mockMovieService = MockMovieService(result: .success(MockData.movies))
        viewModel = MovieListViewModel(movieService: mockMovieService)
    }

    override func tearDownWithError() throws {
        // Limpeza após os testes, removendo as instâncias criadas
        viewModel = nil
        mockMovieService = nil
    }

    func testGetMovies() {
        // Expectativa para verificar se os filmes são carregados com sucesso
         let expectation = XCTestExpectation(description: "Movies should be loaded")
         
        // Observador para verificar se a propriedade movieListModel foi atualizada
         viewModel.$movieListModel
             .sink { movies in
                 XCTAssertNotNil(movies, "Movies should not be nil")
                 expectation.fulfill()
             }
             .store(in: &cancellables)
         
        // Chama o método getMovies() na ViewModel
         viewModel.getMovies()
         
        // Aguarda a expectativa ser cumprida
         wait(for: [expectation], timeout: 5.0)
    }

    func tesSearchMovies() {
        // Expectativa para verificar se a busca por filmes é bem-sucedida
        let expectation = XCTestExpectation(description: "Search Movies")

        // Query de exemplo para a busca
        let query = "Avengers"

        // Chama o método searchMovies na instância mockMovieService
        mockMovieService.searchMovies(query: query)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    // Se houver um erro, o teste falhará
                    XCTFail("Erro inesperado: \(error)")
                }
                expectation.fulfill()
            } receiveValue: { movieList in
                // Verifica se a lista de filmes não está vazia após a busca
                XCTAssertNotNil(movieList)
                XCTAssertFalse(movieList.results.isEmpty)
            }
            .store(in: &cancellables)

        // Aguarda a expectativa ser cumprida
        wait(for: [expectation], timeout: 5.0)
    }

}
