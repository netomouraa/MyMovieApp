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

//    func loadImage(for movie: MovieListItem, completion: @escaping (UIImage?) -> Void) {
//        if let path = movie.posterPath, let url = URL(string: "https://image.tmdb.org/t/p/w500/\(path)") {
//            // Tenta carregar a imagem do cache
//            if let data = URLCache.shared.cachedResponse(for: URLRequest(url: url))?.data,
//               let image = UIImage(data: data) {
//                completion(image)
//            } else {
//                // Se a imagem não estiver em cache, faz o download
//                URLSession.shared.dataTask(with: url) { data, _, _ in
//                    if let data = data, let image = UIImage(data: data) {
//                        // Armazena a imagem em cache
//                        let response = URLResponse(url: url, mimeType: "image/jpeg", expectedContentLength: data.count, textEncodingName: nil)
//                        let cachedResponse = CachedURLResponse(response: response, data: data)
//                        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: url))
//                        completion(image)
//                    } else {
//                        completion(nil)
//                    }
//                }.resume()
//            }
//        }
//    }
}
