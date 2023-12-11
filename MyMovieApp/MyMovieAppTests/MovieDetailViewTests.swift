////
////  MovieDetailViewTests.swift
////  MyMovieAppTests
////
////  Created by Neto Moura on 11/12/23.
////
//
//import XCTest
//@testable import MyMovieApp
//
//class MovieDetailViewTests: XCTestCase {
//
//    func testLoadImageSuccess() {
//        // Arrange
//        let movie = MockData.movies[0]
//        let viewModel = MovieListViewModel(movieService: MockMovieService(result: .success(MockData.movies)))
//        let movieDetailView = MovieDetailView(movie: movie, viewModel: viewModel)
//        let expectation = XCTestExpectation(description: "Espera pela conclusão do teste")
//
//        // Act
//        movieDetailView.loadImage()
//
//        // Assert
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//            XCTAssertNotNil(movieDetailView.movieImage)
//            expectation.fulfill()
//        }
//
//        wait(for: [expectation], timeout: 5.0)
//    }
//
//}
