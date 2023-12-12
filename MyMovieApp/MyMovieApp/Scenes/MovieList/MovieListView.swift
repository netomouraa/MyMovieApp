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
    private let errorMessage = "Ocorreu um erro ao buscar os filmes."
    
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
                    if movies.isEmpty {
                        ErrorView(errorMessage: errorMessage) {
                            viewModel.refreshMovies()
                            searchText = ""
                        }
                    } else {
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
                } else if viewModel.isEmptyError {
                    ErrorView(errorMessage: errorMessage) {
                        viewModel.refreshMovies()
                        searchText = ""
                    }
                }
                Spacer()
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
        }
    }
}

//#Preview {
//    MovieListView()
//}
