//
//  MovieListItemView.swift
//  MyMovieApp
//
//  Created by Neto Moura on 09/12/23.
//

import SwiftUI
import MovieService

struct MovieListItemView: View {
    let movie: MovieListItem

    var body: some View {
        HStack {
            MoviePosterView(movie: movie)
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                Text(movie.overview)
                    .lineLimit(4)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}
