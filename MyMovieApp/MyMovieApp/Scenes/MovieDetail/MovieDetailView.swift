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
                if let image = viewModel.movieImage {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .frame(height: 400)
                        .padding(.bottom, 100)
                    
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .padding(.bottom, 100)
                        .onAppear {
                            viewModel.loadImage(for: movie)
                        }
                }
                
                Text(movie.title)
                    .font(.largeTitle)
                    .padding()
                
                Text(movie.overview)
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .padding()
                
            }
        }
    }
}
