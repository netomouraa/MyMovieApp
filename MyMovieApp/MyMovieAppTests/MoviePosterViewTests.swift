////
////  MoviePosterViewTests.swift
////  MyMovieAppTests
////
////  Created by Neto Moura on 11/12/23.
////
//
//import XCTest
//@testable import MyMovieApp
//
//class MoviePosterViewTests: XCTestCase {
//
//    func testLoadImageSuccess() {
//        // Arrange
//        let movie = MockData.movies[0]
//        let viewModel = MovieListViewModel(movieService: MockMovieService(result: .success(MockData.movies)))
//        let moviePosterView = MoviePosterView(movie: movie, viewModel: viewModel)
//        let expectation = XCTestExpectation(description: "Espera pela conclusão do teste")
//
//        // Act
//        moviePosterView.loadImage()
//
//        // Assert
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//            XCTAssertNotNil(moviePosterView.movieImage)
//            expectation.fulfill()
//        }
//
//        wait(for: [expectation], timeout: 5.0)
//    }
//
//}
