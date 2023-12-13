//
//  SearchBar.swift
//  MyMovieApp
//
//  Created by Neto Moura on 10/12/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String    // Binding para o texto de pesquisa
    var onSearch: () -> Void    // Closure para realizar a ação de pesquisa
    
    var body: some View {
        HStack {
            // Campo de texto para entrada de pesquisa
            TextField("Pesquisar filmes", text: $text, onCommit: {
                // Realiza a pesquisa quando o botão "return" é pressionado
                if !text.isEmpty {
                    onSearch()
                }
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal)
            .overlay(
                HStack {
                    Spacer()
                    // Botão para limpar o texto de pesquisa e esconder o teclado
                    Button(action: {
                        text = ""
                        hideKeyboard()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                            .padding(.trailing, 20)
                    }
                }
            )

            // Botão para iniciar a pesquisa
            Button(action: {
                if !text.isEmpty {
                    onSearch()
                    hideKeyboard()
                }
            }) {
                Text("Pesquisar")
            }
            .padding(.trailing)
        }
    }
    
    // Método para esconder o teclado
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
