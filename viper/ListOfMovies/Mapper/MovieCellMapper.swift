//
//  MovieCellMapper.swift
//  viper
//
//  Created by gabatx on 8/2/23.
//

import Foundation

struct MovieCellMapper {
    func map(entity: PopularMovieEntity) -> MovieCellViewModel {
        MovieCellViewModel(
            title: entity.title,
            overview: entity.overview,
            imageUrl: URL(string: "https://image.tmdb.org/t/p/w200" + entity.imageURL)
        )
    }
}
