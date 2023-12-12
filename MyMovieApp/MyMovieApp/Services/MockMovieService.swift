//
//  MockMovieService.swift
//  MyMovieApp
//
//  Created by Neto Moura on 11/12/23.
//

import Foundation
import MovieService
import Combine

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

    func getMovies() -> AnyPublisher<MovieListModel, Error> {
        let movieList = MovieListModel(page: 1, results: [MovieListItem(id: 1, title: "Filme 1", overview: "Descrição 1", releaseDate: "2023-01-01", posterPath: nil, voteAverage: 8.0)], totalPages: 1, totalResults: 1)

        return Result.Publisher(.success(movieList)).eraseToAnyPublisher()
    }
    
    func searchMovies(query: String) -> AnyPublisher<MovieListModel, Error> {
        return Future<MovieListModel, Error> { promise in
            if query.lowercased() == "avengers" {
                let avengersMovie = MovieListModel(page: 1, results: [
                    MovieListItem(id: 1, title: "Avengers: Endgame", overview: "The epic conclusion to the Infinity Saga.", releaseDate: "2019-04-26", posterPath: "/q719jXXEzOoYaps6babgKnONONX.jpg", voteAverage: 8.4)
                ], totalPages: 1, totalResults: 1)
                promise(.success(avengersMovie))
            } else if query.lowercased() == "noresults" {
                promise(.success(MovieListModel(page: 1, results: [], totalPages: 0, totalResults: 0)))
            } else {
                let error = NSError(domain: "MockMovieService", code: 1, userInfo: [NSLocalizedDescriptionKey: "Erro ao buscar filmes"])
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func loadImage(for movie: MovieListItem) -> AnyPublisher<UIImage?, Error> {
        return Future<UIImage?, Error> { promise in
            if let posterPath = movie.posterPath,
               let image = UIImage(named: posterPath) {
                promise(.success(image))
            } else {
                promise(.success(nil))
            }
        }
        .eraseToAnyPublisher()
    }
    
}
