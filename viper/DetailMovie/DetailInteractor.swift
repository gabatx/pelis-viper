//
//  DetailInteractor.swift
//  viper
//
//  Created by gabatx on 15/2/23.
//

import Foundation

protocol DetailInteractable {
    func getDetailMovie(withId id: String) async -> DetailMovieEntity
}

class DetailInteractor: DetailInteractable {
    // Método que se va a encargar de hacer la petición http:
    // - A nuestro interactor le llegará un parámetro que será el id de la película

    func getDetailMovie(withId id: String) async -> DetailMovieEntity {
        let apiKey = "5bca4916212fdace5198cbc5984023c5"
        let urlString = "https://api.themoviedb.org/3/movie/\(id)?api_key=\(apiKey)"
        // Definimos la url
        let url = URL(string: urlString)!
        // Petitión http:
        let (data, _) = try! await URLSession.shared.data(from: url)
        // Parseamos el contenido:
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let dataParse = try! jsonDecoder.decode(DetailMovieEntity.self, from: data)
        // Una vez parseado lo retornamos
        return dataParse
    }

}
