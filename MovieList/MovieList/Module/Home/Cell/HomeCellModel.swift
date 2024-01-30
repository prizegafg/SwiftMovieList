//
//  HomeCellModel.swift
//  MovieList
//
//  Created by MAYU on 13/01/24.
//

import Foundation

struct HomeRegulerModel{
    var title: [String]
    var rating: [String]
    var image: [String]
    var id: [Int]
    
    init(title: [String], rating: [String], image: [String], id: [Int]) {
        self.title = title
        self.rating = rating
        self.image = image
        self.id = id
    }
    
    
}
