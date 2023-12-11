//
//  MovieListModel.swift
//  MyMovieApp
//
//  Created by Neto Moura on 09/12/23.
//

struct MovieListModel: Codable {
    let page: Int
    let results: [MovieListItem]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
