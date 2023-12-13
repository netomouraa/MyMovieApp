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
    @State private var didAppear = false
    private let errorMessage = "Ocorreu um erro ao buscar os filmes."
    
    var body: some View {
        NavigationView {
            VStack {
                // Barra de pesquisa para buscar filmes
                SearchBar(text: $searchText, onSearch: {
                    viewModel.isSearching = true
                    self.viewModel.searchMovies(query: searchText)
                })
                
                if let movies = viewModel.movieListModel?.results {
                    if movies.isEmpty {
                        // Exibe uma mensagem de erro se a lista de filmes estiver vazia
                        ErrorView(errorMessage: errorMessage) {
                            viewModel.refreshMovies()
                            searchText = "" // Limpa o campo de pesquisa
                        }
                    } else {
                        // Lista de filmes com navegação para a tela de detalhes
                        List(movies, id: \.id) { movie in
                            NavigationLink(destination: MovieDetailView(movie: movie)) {
                                MovieListItemView(movie: movie)
                            }
                        }
                        .refreshable {
                            viewModel.refreshMovies()
                            searchText = "" // Limpa o campo de pesquisa
                        }
                    }
                } else if viewModel.isEmptyError {
                    // Exibe uma mensagem se ocorrer um erro na requisição da lista de filmes
                    ErrorView(errorMessage: errorMessage) {
                        viewModel.refreshMovies()
                        searchText = "" // Limpa o campo de pesquisa
                    }
                }
                Spacer()
            }
            .onAppear {
                // Obtém a lista de filmes ao aparecer pela primeira vez
                if !didAppear {
                    viewModel.getMovies()
                    didAppear = true
                }
            }
            .overlay(
                Group {
                    // Exibe um indicador de carregamento se a busca estiver em andamento
                    if viewModel.isSearching {
                        ProgressView()
                    }
                }
            )
            .navigationTitle("Filmes") // Título da barra de navegação
        }
    }
}

//#Preview {
//    MovieListView()
//}
