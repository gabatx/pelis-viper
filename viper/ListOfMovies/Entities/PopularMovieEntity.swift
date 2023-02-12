//
//  PopularMovieEntity.swift
//  viper
//
//  Created by gabatx on 7/2/23.
//

import Foundation


struct PopularMovieEntity: Decodable {

    var id: Int
    var title: String
    var overview: String
    var imageURL: String
    var votes: Double

    // Sirve para cambiar el nombre de las llamadas de las propiedades. Ej: vote_average es el nombre de la api y aquí la llamaremos votes
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case imageURL = "poster_path"
        case votes = "vote_average"
    }
}
