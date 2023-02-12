//
//  MovieCellViewModel.swift
//  viper
//
//  Created by gabatx on 8/2/23.
//

import Foundation

// Será el model encargado de modelar el entity PopularMovieEntity, ya que no queremos que nos lleguen todos sus valores
// ya que no los necesitamos.
struct MovieCellViewModel {
    var title: String
    var overview: String
    var imageUrl: URL?
}
