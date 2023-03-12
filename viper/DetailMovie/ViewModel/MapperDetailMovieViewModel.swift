//
//  MapperDetailMovieViewModel.swift
//  viper
//
//  Created by gabatx on 15/2/23.
//

import Foundation

struct MapperDetailMovieViewModel {
    func map(entity: DetailMovieEntity) -> DetailMovieViewModel {
        DetailMovieViewModel (
            title: entity.title,
            overview: entity.overview,
            backdropPath: URL(string: "https://image.tmdb.org/t/p/w200" + entity.backdropPath)
        )
    }
}
