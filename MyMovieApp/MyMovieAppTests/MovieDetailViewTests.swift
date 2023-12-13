//
//  MovieDetailViewTests.swift
//  MyMovieAppTests
//
//  Created by Neto Moura on 11/12/23.
//

import XCTest
import Combine
@testable import MyMovieApp

class MovieDetailViewTests: XCTestCase {
    
    var viewModel: MovieDetailViewModel!
    var mockMovieService: MockMovieService!
    let movie = MockData.movies
    let mockError = MockError.someError
    var cancellables: Set<AnyCancellable> = []
    
    override func setUpWithError() throws {
        // Configuração inicial para instâncias necessárias antes dos testes
        mockMovieService = MockMovieService(result: .success(MockData.movies))
        viewModel = MovieDetailViewModel(movieService: mockMovieService)
    }
    
    override func tearDownWithError() throws {
        // Limpeza após os testes, removendo as instâncias criadas
        viewModel = nil
        mockMovieService = nil
    }
    
    func testLoadImage() {
        // Expectativa para verificar se a imagem é carregada com sucesso
        let expectation = XCTestExpectation(description: "Load Image")
        
        if let movie = MockData.movies.results.first {
            // Chama o método loadImage na ViewModel
            mockMovieService.loadImage(for: movie)
                .sink { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        // Se houver um erro, o teste falhará
                        XCTFail("Erro inesperado: \(error)")
                    }
                    expectation.fulfill()
                } receiveValue: { image in
                    // Verifica se a resposta é válida (não nula)
                    XCTAssertNotNil(image)
                }
                .store(in: &cancellables)
            
            // Aguarda a expectativa ser cumprida
            wait(for: [expectation], timeout: 5.0)
        }
    }
    
}
