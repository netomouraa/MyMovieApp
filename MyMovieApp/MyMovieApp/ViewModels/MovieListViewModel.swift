//
//  MovieListViewModel.swift
//  MyMovieApp
//
//  Created by Neto Moura on 09/12/23.
//

import SwiftUI

//// MovieListViewModel.swift
//class MovieListViewModel: ObservableObject {
//    @Published var movieListModel: MovieListModel?
//    @Published var errorMessage: String?
//
//    private let movieListUseCase: MovieServiceProtocol
//
//    init(movieListUseCase: MovieServiceProtocol = MovieService()) {
//        self.movieListUseCase = movieListUseCase
//    }
//
//    func getMovies() {
//        movieListUseCase.getMovies { result in
//            switch result {
//            case .success(let movieListModel):
//                DispatchQueue.main.async {
//                    self.movieListModel = movieListModel
//                    self.errorMessage = nil
//                }
//            case .failure(let error):
//                DispatchQueue.main.async {
//                    self.movieListModel = nil
//                    self.errorMessage = error.localizedDescription
//                }
//            }
//        }
//    }
//
//    func searchMovies(query: String) {
//        movieListUseCase.searchMovies(query: query) { result in
//            switch result {
//            case .success(let movieListModel):
//                DispatchQueue.main.async {
//                    self.movieListModel = movieListModel
//                    self.errorMessage = nil
//                }
//            case .failure(let error):
//                DispatchQueue.main.async {
//                    self.movieListModel = nil
//                    self.errorMessage = error.localizedDescription
//                }
//            case .none:
//                break
//            }
//        }
//    }
//
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
//
//}


class MovieListViewModel: ObservableObject {
    @Published var movieListModel: MovieListModel?
    private let movieService: MovieServiceProtocol

    init(movieService: MovieServiceProtocol = MovieService()) {
        self.movieService = movieService
    }
    
    func getMovies() {
        movieService.getMovies { result in
            switch result {
            case .success(let movies):
                self.movieListModel = movies
            case .failure(let error):
                print("Erro ao obter filmes: \(error)")
            }
        }
    }
    
    func searchMovies(query: String, completion: @escaping () -> Void) {
        movieService.searchMovies(query: query) { result in
            switch result {
            case .success(let movies):
                self.movieListModel = movies
            case .failure(let error):
                print("Erro ao buscar filmes: \(error)")
            case .none:
                break
            }
            completion()
        }
    }
    

        func loadImage(for movie: MovieListItem, completion: @escaping (UIImage?) -> Void) {
            if let path = movie.posterPath, let url = URL(string: "https://image.tmdb.org/t/p/w500/\(path)") {
                // Tenta carregar a imagem do cache
                if let data = URLCache.shared.cachedResponse(for: URLRequest(url: url))?.data,
                   let image = UIImage(data: data) {
                    completion(image)
                } else {
                    // Se a imagem não estiver em cache, faz o download
                    URLSession.shared.dataTask(with: url) { data, _, _ in
                        if let data = data, let image = UIImage(data: data) {
                            // Armazena a imagem em cache
                            let response = URLResponse(url: url, mimeType: "image/jpeg", expectedContentLength: data.count, textEncodingName: nil)
                            let cachedResponse = CachedURLResponse(response: response, data: data)
                            URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: url))
                            completion(image)
                        } else {
                            completion(nil)
                        }
                    }.resume()
                }
            }
        }
    
}
