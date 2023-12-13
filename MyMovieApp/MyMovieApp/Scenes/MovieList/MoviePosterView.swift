//
//  MoviePosterView.swift
//  MyMovieApp
//
//  Created by Neto Moura on 09/12/23.
//

import SwiftUI
import MovieService

struct MoviePosterView: View {
    var movie: MovieListItem
    @State private var movieImage: UIImage?
    @StateObject private var viewModel = MovieDetailViewModel()

    var body: some View {
        // Exibe a imagem do cartaz do filme se estiver disponível
        if let image = viewModel.movieImage {
               Image(uiImage: image)
                   .resizable()
                   .aspectRatio(contentMode: .fit)
                   .frame(width: 80, height: 100)
           } else {
               // Exibe uma imagem padrão se a imagem do filme não estiver disponível
               Image(systemName: "photo")
                   .resizable()
                   .aspectRatio(contentMode: .fit)
                   .frame(width: 80, height: 100)
                   .onAppear {
                       // Carrega a imagem do filme quando a view aparece
                       viewModel.loadMovieImage(for: movie)
                   }
           }
        
    }
}
