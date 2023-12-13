//
//  MovieDetailView.swift
//  MyMovieApp
//
//  Created by Neto Moura on 09/12/23.
//

import SwiftUI
import MovieService

struct MovieDetailView: View {
    var movie: MovieListItem
    @State private var movieImage: UIImage?
    @StateObject private var viewModel = MovieDetailViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                // Exibe a imagem do filme se estiver disponível
                if let image = viewModel.movieImage {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .frame(height: 400)
                        .padding(.bottom, 100)
                    
                } else {
                    // Exibe uma imagem padrão se a imagem do filme não estiver disponível
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .padding(.bottom, 100)
                        .onAppear {
                            // Carrega a imagem do filme quando a view aparece
                            viewModel.loadMovieImage(for: movie)
                        }
                }
                // Exibe o título do filme
                Text(movie.title)
                    .font(.largeTitle)
                    .padding()
                
                // Exibe a descrição do filme
                Text(movie.overview)
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .padding()
                
            }
        }
    }
}
