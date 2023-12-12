//
//  MovieDetailViewTests.swift
//  MyMovieAppTests
//
//  Created by Neto Moura on 11/12/23.
//

import XCTest
@testable import MyMovieApp

class MovieDetailViewTests: XCTestCase {
    
    var viewModel: MovieDetailViewModel!
    var mockMovieService: MockMovieService!
    let movie = MockData.movies
    let mockError = MockError.someError

    override func setUpWithError() throws {
        mockMovieService = MockMovieService(result: .success(MockData.movies))
        viewModel = MovieDetailViewModel(movieService: mockMovieService)
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
        mockMovieService = nil
    }
    
    func testLoadImageSuccess() {
        
        viewModel.loadImage(for: movie.results.first!)
        
        XCTAssertTrue(mockMovieService.loadImageCalled)
        XCTAssertEqual(mockMovieService.loadImageMovie?.title, "Filme Teste")
//        XCTAssertNotNil(viewModel.movieImage)
    }
    
    func testLoadImageFailure() {
        let mockMovieServiceError = MockMovieService(result: .failure(mockError))

        let viewModel = MovieDetailViewModel(movieService: mockMovieServiceError)
        viewModel.loadImage(for: movie.results.first!)

//        XCTAssertTrue(mockMovieService.loadImageCalled)
//        XCTAssertEqual(mockMovieService.loadImageMovie?.title, "Filme Teste")
//        XCTAssertNil(viewModel.movieImage)
    }
    
}
