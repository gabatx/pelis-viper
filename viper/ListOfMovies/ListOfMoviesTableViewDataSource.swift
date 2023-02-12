//
//  ListOfMoviesTableViewDataSource.swift
//  viper
//
//  Created by gabatx on 7/2/23.
//

import Foundation
import UIKit


class ListOfMoviesTableViewDataSource: NSObject, UITableViewDataSource {

    private let tableView: UITableView
    // Las películas, es el modelo que va a representar dentro de la TableView.
    // private(set): solo se pueda modificar desde dentro de la estructura creada entre llaves
    private(set) var movies: [MovieCellViewModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    // Inicializador para poderlo crear desde el controlador
    init(tableView: UITableView, movies: [MovieCellViewModel] = []) {
        self.tableView = tableView
        self.movies = movies
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Recuperamos una celda de la tableView
        let cell: MovieCellView = tableView.dequeueReusableCell(withIdentifier: "MovieCellView", for: indexPath) as! MovieCellView
        // Recuperamos que personaje debemos mostrar en esa celda
        let movie = movies[indexPath.row]
        cell.configure(movie: movie)

        return cell
    }

    // Creamos un método para setear los personajes
    func setMovies(movies: [MovieCellViewModel]){
        self.movies = movies
    }
}
