//
//  Section.swift
//  Table Expandable
//
//  Created by C Ramkumar on 04/08/17.
//  Copyright © 2017 Ram. All rights reserved.
//

import Foundation

struct Section {
    var genre: String
    var movies: String
    var expanded: Bool
    
    init(genre: String, movies: String, expanded: Bool) {
        self.genre = genre
        self.movies = movies
        self.expanded = expanded
    }
}
