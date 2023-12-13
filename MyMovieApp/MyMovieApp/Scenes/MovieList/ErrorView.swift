//
//  ErrorView.swift
//  MyMovieApp
//
//  Created by Neto Moura on 12/12/23.
//

import SwiftUI

struct ErrorView: View {
    let errorMessage: String    // Mensagem de erro a ser exibida
    let onRetry: () -> Void     // Ação a ser executada ao tentar novamente
    
    var body: some View {
        VStack {
            // Exibe a mensagem de erro em vermelho
            Text(errorMessage)
                .foregroundColor(.red)
                .padding()
            
            // Botão para tentar novamente, mostrando um ícone de seta circular
            Button(action: {
                onRetry()
            }) {
                Image(systemName: "arrow.clockwise.circle")
                    .imageScale(.large)
                    .padding()
            }
        }
    }
}
