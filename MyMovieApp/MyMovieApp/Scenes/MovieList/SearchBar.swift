//
//  SearchBar.swift
//  MyMovieApp
//
//  Created by Neto Moura on 10/12/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var onSearch: () -> Void
    
    var body: some View {
        HStack {
            TextField("Pesquisar filmes", text: $text, onCommit: {
                if !text.isEmpty {
                    onSearch()
                }
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal)
            
            Button(action: {
                if !text.isEmpty {
                    onSearch()
                }
            }) {
                Text("Pesquisar")
            }
            .padding(.trailing)
        }
    }
}
