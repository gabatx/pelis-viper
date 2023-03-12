//
//  ListOfMoviesView.swift
//  viper
//
//  Created by gabatx on 7/2/23.
//

import Foundation
import UIKit

class ListOfMoviesView: UIViewController, UITableViewDelegate {

    var presenter: ListOfMoviesPresentable?
    @IBOutlet weak var moviesTableView: UITableView!
    private var listOfMoviesTableViewDataSource: ListOfMoviesTableViewDataSource?
    private var listOfMoviesTableViewDelegate: ListOfMoviesTableViewDelegate?


    override func viewDidLoad() {
        super.viewDidLoad()

        // Se llama al presenter para que se encargue de la lógica de negocio

        // El presenter no se instancia aquí porque eso ser hará en router de cada componente. ( view.presenter = presenter )
        // Cuando se llama a la view se llama al presenter, que a su vez llama al interactor que realiza la petición http
        // Al obtener la respuesta, el interactor retorna al módelo que se almacena en una constante del presenter.
        // El presenter se lo pasa a la view
        presenter?.onViewAppear()

        listOfMoviesTableViewDataSource = ListOfMoviesTableViewDataSource(tableView: moviesTableView)
        listOfMoviesTableViewDelegate = ListOfMoviesTableViewDelegate()
        moviesTableView.dataSource = listOfMoviesTableViewDataSource
        moviesTableView.delegate = listOfMoviesTableViewDelegate

        // En cada vuelta obtenemos refrescamos las películas del tableView
        listOfMoviesTableViewDelegate?.didTapOnCell = { [weak self] index in
            // Vamos hacia el detalle
            self!.presenter?.onTapCell(atIndex: index)
        }
    }
}

extension ListOfMoviesView: LisOfMoviesUI {
    func update(movies: [MovieCellViewModel]) {
        listOfMoviesTableViewDataSource?.setMovies(movies: movies)
    }
}


