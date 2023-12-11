//
//  MoviePosterView.swift
//  MyMovieApp
//
//  Created by Neto Moura on 09/12/23.
//

import SwiftUI

struct MoviePosterView: View {
    var movie: MovieListItem
    @State private var movieImage: UIImage?
    @StateObject private var viewModel = MovieDetailViewModel()

    var body: some View {
           if let image = movieImage {
               Image(uiImage: image)
                   .resizable()
                   .aspectRatio(contentMode: .fit)
                   .frame(width: 80, height: 100)
           } else {
               Image(systemName: "photo")
                   .resizable()
                   .aspectRatio(contentMode: .fit)
                   .frame(width: 80, height: 100)
                   .onAppear {
                       viewModel.loadImage(for: movie) { image in
                           DispatchQueue.main.async {
                               self.movieImage = image
                           }
                       }
                   }
           }
        
    }
}