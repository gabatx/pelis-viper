//
//  PopularMovieResponseEntity.swift
//  viper
//
//  Created by gabatx on 7/2/23.
//

import Foundation

struct PopularMovieResponseEntity: Decodable{
    let results: [PopularMovieEntity]
}
