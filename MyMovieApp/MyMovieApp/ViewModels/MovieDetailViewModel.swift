//
//  MovieDetailViewModel.swift
//  MyMovieApp
//
//  Created by Neto Moura on 10/12/23.
//

//import SwiftUI
//
//class MovieDetailViewModel: ObservableObject {
//    @Published var image: UIImage?
//    var movie: MovieListItem
//    private let movieService: MovieServiceProtocol
//
//    init(movie: MovieListItem, movieService: MovieServiceProtocol = MovieService()) {
//        self.movieService = movieService
//        self.movie = movie
//    }
//    
//    // Método para chamar a função loadImage
//    func loadImage() {
//        movieService.loadImage(for: movie) { [weak self] image in
//            DispatchQueue.main.async {
//                self?.image = image
//            }
//        }
//    }
//}
