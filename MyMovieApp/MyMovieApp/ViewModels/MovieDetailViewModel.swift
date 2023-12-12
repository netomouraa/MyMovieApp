//
//  MovieDetailViewModel.swift
//  MyMovieApp
//
//  Created by Neto Moura on 10/12/23.
//

import SwiftUI
import Combine
import MovieService

class MovieDetailViewModel: ObservableObject {

    @Published var movieImage: UIImage?
    private var cancellables: Set<AnyCancellable> = []
    private let movieService: MovieServiceProtocol
    
    init(movieService: MovieServiceProtocol = MovieService()) {
        self.movieService = movieService
    }
    
    func loadMovieImage(for movie: MovieListItem) {
        movieService.loadImage(for: movie)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Erro ao carregar imagem: \(error)")
                }
            } receiveValue: { image in
                self.movieImage = image
            }
            .store(in: &cancellables)
    }

}
