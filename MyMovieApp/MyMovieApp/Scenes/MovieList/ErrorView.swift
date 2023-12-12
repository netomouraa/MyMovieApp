//
//  ErrorView.swift
//  MyMovieApp
//
//  Created by Neto Moura on 12/12/23.
//

import SwiftUI

struct ErrorView: View {
    let errorMessage: String
    let onRetry: () -> Void
    
    var body: some View {
        VStack {
            Text(errorMessage)
                .foregroundColor(.red)
                .padding()
            
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
