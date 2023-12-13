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
            MoviePosterView(movie: movie)             // Exibe o cartaz do filme
            VStack(alignment: .leading) {
                Text(movie.title) // Título do filme
                    .font(.headline)
                Text(movie.overview) // Descrição do filme com limite de linhas e cor cinza
                    .lineLimit(4)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}
