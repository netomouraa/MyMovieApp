////
////  MovieListViewModelTests.swift
////  MyMovieAppTests
////
////  Created by Neto Moura on 11/12/23.
////
//
//import XCTest
//import MovieService
//
//@testable import MyMovieApp
//
//class MovieListViewModelTests: XCTestCase {
//
//    func testGetMoviesSuccess() {
//        // Arrange
//        let viewModel = MovieListViewModel(movieService: MockMovieService(result: .success(MockData.movies)))
//        let expectation = XCTestExpectation(description: "Espera pela conclusão do teste")
//
//        // Act
//        viewModel.getMovies()
//
//        // Assert
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//            XCTAssertNotNil(viewModel.movieListModel)
//            XCTAssertFalse(viewModel.movieListModel?.results.isEmpty ?? true)
//            expectation.fulfill()
//        }
//
//        wait(for: [expectation], timeout: 5.0)
//    }
//
//    func testGetMoviesFailure() {
//        // Arrange
//        let viewModel = MovieListViewModel(movieService: MockMovieService(result: .failure(MockError.someError)))
//        let expectation = XCTestExpectation(description: "Espera pela conclusão do teste")
//
//        // Act
//        viewModel.getMovies()
//
//        // Assert
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//            XCTAssertNil(viewModel.movieListModel)
//            expectation.fulfill()
//        }
//
//        wait(for: [expectation], timeout: 5.0)
//    }
//
//    func testRefreshMovies() {
//        // Arrange
//        let viewModel = MovieListViewModel(movieService: MockMovieService(result: .success(MockData.movies)))
//        let expectation = XCTestExpectation(description: "Espera pela conclusão do teste")
//
//        // Act
//        viewModel.refreshMovies()
//
//        // Assert
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//            XCTAssertNotNil(viewModel.movieListModel)
//            XCTAssertFalse(viewModel.movieListModel?.results.isEmpty ?? true)
//            expectation.fulfill()
//        }
//
//        wait(for: [expectation], timeout: 5.0)
//    }
//
//    func testSearchMoviesSuccess() {
//        // Arrange
//        let viewModel = MovieListViewModel(movieService: MockMovieService(result: .success(MockData.movies)))
//        let expectation = XCTestExpectation(description: "Espera pela conclusão do teste")
//
//        // Act
//        viewModel.searchMovies(query: "ExampleQuery") {
//            // Assert
//            XCTAssertNotNil(viewModel.movieListModel)
//            XCTAssertFalse(viewModel.movieListModel?.results.isEmpty ?? true)
//            expectation.fulfill()
//        }
//
//        wait(for: [expectation], timeout: 5.0)
//    }
//
//    func testSearchMoviesFailure() {
//        // Arrange
//        let viewModel = MovieListViewModel(movieService: MockMovieService(result: .failure(MockError.someError)))
//        let expectation = XCTestExpectation(description: "Espera pela conclusão do teste")
//
//        // Act
//        viewModel.searchMovies(query: "ExampleQuery") {
//            // Assert
//            XCTAssertNil(viewModel.movieListModel)
//            expectation.fulfill()
//        }
//
//        wait(for: [expectation], timeout: 5.0)
//    }
//}
