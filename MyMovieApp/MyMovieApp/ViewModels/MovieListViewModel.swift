//
//  MovieListViewModel.swift
//  MyMovieApp
//
//  Created by Neto Moura on 09/12/23.
//

import SwiftUI
import Combine
import MovieService

class MovieListViewModel: ObservableObject {
    @Published var movieListModel: MovieListModel?
    @Published var isEmptyError = false
    @State var isSearching = false
    private let movieService: MovieServiceProtocol
    private var cancellables: Set<AnyCancellable> = []

    init(movieService: MovieServiceProtocol = MovieService()) {
        self.movieService = movieService
    }
    
    func getMovies() {
        movieService.getMovies()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Erro ao obter filmes: \(error)")
                }
            }, receiveValue: { movies in
                self.movieListModel = movies
            })
            .store(in: &cancellables)
        
    }
    
    func refreshMovies() {
        getMovies()
    }
    
    func searchMovies(query: String) {
        if query.isEmpty {
            getMovies()
        } else {
            movieService.searchMovies(query: query)
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print("Erro ao buscar filmes: \(error)")
                        self.isEmptyError = true
                    }
                }, receiveValue: { [weak self] movies in
                    self?.movieListModel = movies
                    self?.isEmptyError = movies.results.isEmpty
                    self?.isSearching = false
                })
                .store(in: &cancellables)
        }
    }
    
}
