//
//  MovieListViewModel.swift
//  MyMovieApp
//
//  Created by Neto Moura on 09/12/23.
//

import SwiftUI
import MovieService

class MovieListViewModel: ObservableObject {
    @Published var movieListModel: MovieListModel?
    @Published var isEmptyError = false
    private let movieService: MovieServiceProtocol
    
    init(movieService: MovieServiceProtocol = MovieService()) {
        self.movieService = movieService
    }
    
    func getMovies() {
        movieService.getMovies { result in
            switch result {
            case .success(let movies):
                self.movieListModel = movies
                self.isEmptyError = movies.results.isEmpty
            case .failure(let error):
                self.isEmptyError = true
                print("Erro ao obter filmes: \(error)")
            }
        }
    }
    
    func refreshMovies() {
        getMovies()
    }

    func searchMovies(query: String, completion: @escaping () -> Void) {
        movieService.searchMovies(query: query) { result in
            switch result {
            case .success(let movies):
                self.movieListModel = movies
                self.isEmptyError = movies.results.isEmpty
            case .failure(let error):
                self.isEmptyError = true
                print("Erro ao buscar filmes: \(error)")
            case .none:
                break
            }
            completion()
        }
    }
    
}
