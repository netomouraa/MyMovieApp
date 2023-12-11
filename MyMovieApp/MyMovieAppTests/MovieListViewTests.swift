////
////  MovieListViewTests.swift
////  MyMovieAppTests
////
////  Created by Neto Moura on 11/12/23.
////
//
//import XCTest
//@testable import MyMovieApp
//
//class MovieListViewTests: XCTestCase {
//
//    func testSearchMoviesSuccess() {
//        // Arrange
//        let viewModel = MovieListViewModel(movieService: MockMovieService(result: .success(MockData.movies)))
//        let movieListView = MovieListView(viewModel: viewModel)
//        let expectation = XCTestExpectation(description: "Espera pela conclusão do teste")
//
//        // Act
//        movieListView.searchMovies(query: "ExampleQuery")
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
//    func testRefreshMoviesSuccess() {
//        // Arrange
//        let viewModel = MovieListViewModel(movieService: MockMovieService(result: .success(MockData.movies)))
//        let movieListView = MovieListView(viewModel: viewModel)
//        let expectation = XCTestExpectation(description: "Espera pela conclusão do teste")
//
//        // Act
//        movieListView.refreshMovies()
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
//}
