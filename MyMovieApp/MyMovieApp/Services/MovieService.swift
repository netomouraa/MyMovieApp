//
//  MovieService.swift
//  MyMovieApp
//
//  Created by Neto Moura on 09/12/23.
//

import Foundation
import UIKit

protocol MovieServiceProtocol {
    func getMovies(completion: @escaping (Result<MovieListModel, Error>) -> Void)
    func searchMovies(query: String, completion: @escaping (Result<MovieListModel, Error>?) -> Void)
//    func loadImage(for movie: MovieListItem, completion: @escaping (UIImage?) -> Void)
}

class MovieService: MovieServiceProtocol {
    let apiKey = "e0704089dab5a4884ecf67ab2aef73dd"
//    private let imageBaseURL = "https://image.tmdb.org/t/p/w500/"
    
    func getMovies(completion: @escaping (Result<MovieListModel, Error>) -> Void) {
        
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)"
        
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(NSError(domain: "Dados vazios", code: 0, userInfo: nil)))
                    return
                }
                
                do {
                    let movies = try JSONDecoder().decode(MovieListModel.self, from: data)
                    DispatchQueue.main.async {
                        //                        self.movieListModel = movies
                        completion(.success(movies))
                    }
                } catch {
                    completion(.failure(error))
                }
            }.resume()
        }
    }
    
    func searchMovies(query: String, completion: @escaping (Result<MovieListModel, Error>?) -> Void) {
        guard !query.isEmpty else {
            return
        }
        
        let urlString = "https://api.themoviedb.org/3/search/movie?api_key=\(apiKey)&query=\(query)"
        
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, _, error in
                if let data = data {
                    do {
                        let result = try JSONDecoder().decode(MovieListModel.self, from: data)
                        DispatchQueue.main.async {
                            completion(.success(result))
                        }
                    } catch {
                        print("Erro ao decodificar JSON: \(error)")
                    }
                } else if let error = error {
                    print("Erro na requisição: \(error)")
                }
            }.resume()
        }
    }
    
//    func loadImage(for movie: MovieListItem, completion: @escaping (UIImage?) -> Void) {
//        guard let posterPath = movie.posterPath,
//              let imageURL = URL(string: imageBaseURL + posterPath) else {
//            let error = NSError(domain: "Erro ao construir URL da imagem", code: 0, userInfo: nil)
//            completion(nil)
//            return
//        }
//        
//        if let data = URLCache.shared.cachedResponse(for: URLRequest(url: imageURL))?.data,
//           let image = UIImage(data: data) {
//            completion(image)
//        } else {
//            // Se a imagem não estiver em cache, faz o download
//            URLSession.shared.dataTask(with: imageURL) { data, _, _ in
//                if let data = data, let image = UIImage(data: data) {
//                    // Armazena a imagem em cache
//                    let response = URLResponse(url: imageURL, mimeType: "image/jpeg", expectedContentLength: data.count, textEncodingName: nil)
//                    let cachedResponse = CachedURLResponse(response: response, data: data)
//                    URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: imageURL))
//                    completion(image)
//                } else {
//                    completion(nil)
//                }
//            }.resume()
//        }
//        
//    }
    
}

