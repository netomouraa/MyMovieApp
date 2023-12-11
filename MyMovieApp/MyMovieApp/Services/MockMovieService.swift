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
                                                                               title: "title",
                                                                               overview: "overview",
                                                                               releaseDate: "",
                                                                               posterPath: "",
                                                                               voteAverage: 0.0)],
                                                       totalPages: 1,
                                                       totalResults: 1)
}

enum MockError: Error {
    case someError
}

class MockMovieService: MovieServiceProtocol {
   
    let result: Result<MovieListModel, Error>

    init(result: Result<MovieListModel, Error>) {
        self.result = result
    }

    func getMovies(completion: @escaping (Result<MovieListModel, Error>) -> Void) {
        completion(result)
    }

    func searchMovies(query: String, completion: @escaping (Result<MovieListModel, Error>?) -> Void) {
       
    }
    
    func loadImage(for movie: MovieListItem, completion: @escaping (UIImage?) -> Void) {
        
    }
    
}
