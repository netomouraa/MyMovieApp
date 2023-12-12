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
        mockMovieService = MockMovieService(result: .success(MockData.movies))
        viewModel = MovieDetailViewModel(movieService: mockMovieService)
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
        mockMovieService = nil
    }
    
    func testLoadImage() {
        let expectation = XCTestExpectation(description: "Load Image")
        
        if let movie = MockData.movies.results.first {
            mockMovieService.loadImage(for: movie)
                .sink { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        XCTFail("Erro inesperado: \(error)")
                    }
                    expectation.fulfill()
                } receiveValue: { image in
                    // Verifique se a resposta é válida
                    XCTAssertNotNil(image)
                }
                .store(in: &cancellables)
            
            wait(for: [expectation], timeout: 5.0)
        }
    }
    
}
