//
//  ListOfMoviesInteractor.swift
//  viper
//
//  Created by gabatx on 7/2/23.
//

import Foundation

protocol ListOfMoviesInteractorInteractable {
    func getListOfMovies() async -> PopularMovieResponseEntity
}

class ListOfMoviesInteractor: ListOfMoviesInteractorInteractable{

    // Aquí se podría un ApiClient o un repositorio

    func getListOfMovies() async -> PopularMovieResponseEntity {
        let apiKey = "5bca4916212fdace5198cbc5984023c5"
        let url = URL (string: "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)")
        // Realizamos la petición http y guardamos los datos en la variable data
        let (data, _) = try! await URLSession.shared.data(from: url!)
        return try! JSONDecoder().decode(PopularMovieResponseEntity.self, from: data)
    }
}

class ListOfMoviesInteractorMock: ListOfMoviesInteractorInteractable{

    func getListOfMovies() async -> PopularMovieResponseEntity {
        return PopularMovieResponseEntity (results: [
            PopularMovieEntity(id: 1, title: "El león oculto", overview: "León oculto en la cueva descansando", imageURL: "", votes: 10),
            .init(id: 2, title: "Enmanuela se toma un café", overview: "Historia de Enmanuela en París", imageURL: "", votes: 10),
            PopularMovieEntity(id: 3, title: "Peter y el barco de chocolate", overview: "Peter se va de vacaciones", imageURL: "", votes: 10)
        ])
    }
}
