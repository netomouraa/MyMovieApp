//
//  MovieListViewModelTests.swift
//  MyMovieAppTests
//
//  Created by Neto Moura on 11/12/23.
//

import XCTest
import MovieService

@testable import MyMovieApp

class MovieListViewModelTests: XCTestCase {

    var viewModel: MovieListViewModel!
    var mockMovieService: MockMovieService!

    override func setUpWithError() throws {
        mockMovieService = MockMovieService(result: .success(MockData.movies))
        viewModel = MovieListViewModel(movieService: mockMovieService)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        mockMovieService = nil
    }

    func testGetMoviesSuccess() {
        mockMovieService.movies = .success(MockData.movies)

        viewModel.getMovies()

        XCTAssertNotNil(viewModel.movieListModel)
    }

    func testGetMoviesFailure() {
        mockMovieService.movies = .failure(NSError(domain: "Test", code: 123, userInfo: nil))

        viewModel.getMovies()

        XCTAssertNil(viewModel.movieListModel)
    }

    func testSearchMoviesSuccess() {
        mockMovieService.movies = .success(MockData.movies)

        viewModel.searchMovies(query: "Test Query") {
            XCTAssertNotNil(self.viewModel.movieListModel)
        }
    }

    func testSearchMoviesFailure() {
        mockMovieService.movies = .failure(NSError(domain: "Test", code: 123, userInfo: nil))

        viewModel.searchMovies(query: "Test Query") {
            XCTAssertNil(self.viewModel.movieListModel)
        }
    }

}
