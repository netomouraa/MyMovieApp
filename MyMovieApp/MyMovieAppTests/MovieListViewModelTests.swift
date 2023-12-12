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
        mockMovieService = MockMovieService(result: .success(MockData.movies))
        viewModel = MovieListViewModel(movieService: mockMovieService)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        mockMovieService = nil
    }

    func testGetMovies() {
         let expectation = XCTestExpectation(description: "Movies should be loaded")
         
         viewModel.$movieListModel
             .sink { movies in
                 XCTAssertNotNil(movies, "Movies should not be nil")
                 expectation.fulfill()
             }
             .store(in: &cancellables)
         
         viewModel.getMovies()
         
         wait(for: [expectation], timeout: 5.0)
    }

    func tesSearchMovies() {
        let expectation = XCTestExpectation(description: "Search Movies")

        let query = "Avengers"

        mockMovieService.searchMovies(query: query)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    XCTFail("Erro inesperado: \(error)")
                }
                expectation.fulfill()
            } receiveValue: { movieList in
                XCTAssertNotNil(movieList)
                XCTAssertFalse(movieList.results.isEmpty)
            }
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 5.0)
    }

}
