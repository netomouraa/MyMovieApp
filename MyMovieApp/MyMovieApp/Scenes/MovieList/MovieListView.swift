//
//  MovieListView.swift
//  MyMovieApp
//
//  Created by Neto Moura on 09/12/23.
//

import SwiftUI
import MovieService

struct MovieListView: View {
    @StateObject private var viewModel = MovieListViewModel()
    @State private var searchText = ""
    @State private var isSearching = false
    @State private var didAppear = false
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, onSearch: {
                    isSearching = true
                    viewModel.searchMovies(query: searchText) {
                        isSearching = false
                    }
                })
                
                if let movies = viewModel.movieListModel?.results {
                    List(movies, id: \.id) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                            MovieListItemView(movie: movie)
                        }
                    }
                    .refreshable {
                        viewModel.refreshMovies()
                        searchText = ""
                    }
                }
            }
            .onAppear {
                if !didAppear {
                    viewModel.getMovies()
                    didAppear = true
                }
            }
            .overlay(
                Group {
                    if isSearching {
                        ProgressView()
                    }
                }
            )
            .navigationTitle("Filmes")
            .navigationBarItems(trailing:
            Button(action: {
                viewModel.refreshMovies()
                searchText = ""
            }) {
                Image(systemName: "arrow.clockwise.circle")
                    .imageScale(.large)
                    .padding()
            }
            )
        }
    }
}

//#Preview {
//    MovieListView()
//}
