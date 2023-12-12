//
//  MockMovieService.swift
//  MyMovieApp
//
//  Created by Neto Moura on 11/12/23.
//

import Foundation
import MovieService

struct MockData {
    static let movies: MovieListModel = MovieListModel(page: 1,
                                                       results: [MovieListItem(id: 1,
                                                                               title: "Filme Teste",
                                                                               overview: "overview",
                                                                               releaseDate: "",
                                                                               posterPath: "photo",
                                                                               voteAverage: 0.0)],
                                                       totalPages: 1,
                                                       totalResults: 1)
}

enum MockError: Error {
    case someError
}

class MockMovieService: MovieServiceProtocol {
   
    var movies: Result<MovieListModel, Error>
    var loadImageCalled = false
    var loadImageMovie: MovieListItem?

    init(result: Result<MovieListModel, Error>) {
        self.movies = result
    }

    func getMovies(completion: @escaping (Result<MovieListModel, Error>) -> Void) {
            completion(movies)
    }

    func searchMovies(query: String, completion: @escaping (Result<MovieListModel, Error>?) -> Void) {
            completion(movies)
    }
    
    func loadImage(for movie: MovieListItem, completion: @escaping (UIImage?) -> Void) {
        loadImageCalled = true
        loadImageMovie = movie
        let testImage = UIImage(named: "photo")
        completion(testImage)
    }
    
}
