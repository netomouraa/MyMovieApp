//
//  MovieListItem.swift
//  MyMovieApp
//
//  Created by Neto Moura on 10/12/23.
//

import Foundation

struct MovieListItem: Codable {
    let id: Int
    let title: String
    let overview: String
    let releaseDate: String
    let posterPath: String?
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
    }
}
