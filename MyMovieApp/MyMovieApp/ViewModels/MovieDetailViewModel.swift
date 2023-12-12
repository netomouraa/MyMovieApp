//
//  MovieDetailViewModel.swift
//  MyMovieApp
//
//  Created by Neto Moura on 10/12/23.
//

import SwiftUI
import MovieService

class MovieDetailViewModel: ObservableObject {

    @Published var movieImage: UIImage?

    private let movieService: MovieServiceProtocol
    
    init(movieService: MovieServiceProtocol = MovieService()) {
        self.movieService = movieService
    }

    func loadImage(for movie: MovieListItem) {
        movieService.loadImage(for: movie) { [weak self] image in
            DispatchQueue.main.async {
                self?.movieImage = image
            }
        }
    }
}
