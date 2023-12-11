//
//  MyMovieAppTests.swift
//  MyMovieAppTests
//
//  Created by Neto Moura on 09/12/23.
//

import XCTest
@testable import MyMovieApp

final class MyMovieAppTests: XCTestCase {

    var sut: MovieViewModel!
       var mockMovieUseCase: MockMovieUseCase!
       
       override func setUp() {
           super.setUp()
           mockMovieUseCase = MockMovieUseCase()
           sut = MovieViewModel(movieUseCase: mockMovieUseCase)
       }
       
       override func tearDown() {
           mockMovieUseCase = nil
           sut = nil
           super.tearDown()
       }

       func testGetMovies_Success() {
           // Arrange
           let expectedMovies = [Movie(title: "Movie 1", overview: "Overview 1", posterPath: nil)]
           mockMovieUseCase.moviesResult = .success(expectedMovies)

           // Act
           sut.getMovies()

           // Assert
           XCTAssertEqual(sut.movies, expectedMovies)
       }

       func testGetMovies_Failure() {
           // Arrange
           let expectedError = NSError(domain: "Test", code: 123, userInfo: nil)
           mockMovieUseCase.moviesResult = .failure(expectedError)

           // Act
           sut.getMovies()

           // Assert
           XCTAssertEqual(sut.movies, []) // Certifica-se de que a lista de filmes está vazia em caso de falha
           XCTAssertEqual(sut.error, expectedError.localizedDescription)
       }

       func testFilterMovies() {
           // Arrange
           let movies = [
               Movie(title: "Star Wars", overview: "A long time ago in a galaxy far, far away...", posterPath: nil),
               Movie(title: "Inception", overview: "A thief who enters the dreams of others to steal their secrets.", posterPath: nil),
               Movie(title: "Toy Story", overview: "A story of toys coming to life when humans are not around.", posterPath: nil)
           ]

           // Act
           sut.movies = movies
           sut.filterMovies(with: "Star")

           // Assert
           XCTAssertEqual(sut.filteredMovies.count, 1)
           XCTAssertEqual(sut.filteredMovies.first?.title, "Star Wars")
       }

}
