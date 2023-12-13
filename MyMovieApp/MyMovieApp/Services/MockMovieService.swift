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
    // Estrutura de dados de exemplo para filmes
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
        //Objeto MovieListModel de exemplo para simular a resposta da API
        let movieList = MovieListModel(page: 1, results: [MovieListItem(id: 1, title: "Filme 1", overview: "Descrição 1", releaseDate: "2023-01-01", posterPath: nil, voteAverage: 8.0)], totalPages: 1, totalResults: 1)

        // Converte o resultado para um Publisher usando Combine
        return Result.Publisher(.success(movieList)).eraseToAnyPublisher()
    }
    
    func searchMovies(query: String) -> AnyPublisher<MovieListModel, Error> {
        // Exemplo de implementação do Mock para searchMovies usando Combine
        return Future<MovieListModel, Error> { promise in
            // Verifica o valor da consulta para fornecer respostas diferentes
            if query.lowercased() == "avengers" {
                // Retorna uma lista de filmes dos Vingadores como exemplo positivo
                let avengersMovie = MovieListModel(page: 1, results: [
                    MovieListItem(id: 1, title: "Avengers: Endgame", overview: "The epic conclusion to the Infinity Saga.", releaseDate: "2019-04-26", posterPath: "/q719jXXEzOoYaps6babgKnONONX.jpg", voteAverage: 8.4)
                ], totalPages: 1, totalResults: 1)
                promise(.success(avengersMovie))
            } else if query.lowercased() == "noresults" {
                // Simular um caso em que nenhum resultado é encontrado
                promise(.success(MovieListModel(page: 1, results: [], totalPages: 0, totalResults: 0)))
            } else {
                // Simular um caso em que ocorre um erro
                let error = NSError(domain: "MockMovieService", code: 1, userInfo: [NSLocalizedDescriptionKey: "Erro ao buscar filmes"])
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func loadImage(for movie: MovieListItem) -> AnyPublisher<UIImage?, Error> {
        return Future<UIImage?, Error> { promise in
            // Verifica se há um pôster e carrega a imagem
            if let posterPath = movie.posterPath,
               let image = UIImage(named: posterPath) {
                promise(.success(image))
            } else {
                // Retorna nulo se não houver uma imagem
                promise(.success(nil))
            }
        }
        .eraseToAnyPublisher()
    }
    
}
