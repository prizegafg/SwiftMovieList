// 
//  DetailEntity.swift
//  MovieList
//
//  Created by MAYU on 10/01/24.
//

import Foundation
import SwiftyJSON

struct MovieDetailModel {
    let adult: Bool
    let backdropPath: String?
    let belongsToCollection: String?
    let budget: Int
    let genres: [Genre]
    let homepage: String?
    let id: Int
    let imdbId: String?
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String
    let revenue: Int
    let runtime: Int
    let status: String
    let tagline: String?
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    init(json: JSON) {
        adult = json["adult"].boolValue
        backdropPath = json["backdrop_path"].string
        belongsToCollection = json["belongs_to_collection"].string
        budget = json["budget"].intValue
        genres = json["genres"].arrayValue.map { Genre(json: $0) }
        homepage = json["homepage"].string
        id = json["id"].intValue
        imdbId = json["imdb_id"].string
        originalLanguage = json["original_language"].stringValue
        originalTitle = json["original_title"].stringValue
        overview = json["overview"].stringValue
        popularity = json["popularity"].doubleValue
        posterPath = json["poster_path"].string
        releaseDate = json["release_date"].stringValue
        revenue = json["revenue"].intValue
        runtime = json["runtime"].intValue
        status = json["status"].stringValue
        tagline = json["tagline"].string
        title = json["title"].stringValue
        video = json["video"].boolValue
        voteAverage = json["vote_average"].doubleValue
        voteCount = json["vote_count"].intValue
    }
}

struct Genre {
    let id: Int
    let name: String
    
    init(json: JSON) {
        id = json["id"].intValue
        name = json["name"].stringValue
    }
}


