//
//  ListOfMoviesRouter.swift
//  viper
//
//  Created by gabatx on 7/2/23.
//

import Foundation
import UIKit

protocol ListOfMoviesRouting {
    var detailRouter: DetailRouter? { get }
    var listOfMoviesView: ListOfMoviesView? { get }
    func showDetailMovie(withId movieId: String)
    func showListOfMovies(window: UIWindow?)
}

class ListOfMoviesRouter: ListOfMoviesRouting {

    // Debemos unir los dos router:
    var detailRouter: DetailRouter?
    var listOfMoviesView: ListOfMoviesView?

    // Centro de este método es donde vamos a unir todas la piezas
    func showListOfMovies(window: UIWindow?){
        let interactor = ListOfMoviesInteractor()
        let presenter = ListOfMoviesPresenter(listOfMoviesInteractor: interactor, router: self)
        // Creamos las intancias listOfMoviesIdStory
        listOfMoviesView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "listOfMoviesIdStory") as? ListOfMoviesView

        self.detailRouter = DetailRouter()

        // Realizamos la unión
        presenter.uiDelegate = listOfMoviesView
        listOfMoviesView?.presenter = presenter // Este presenter se va a encargar de lanzar la acción

        // Le indicamos la vista que se va a mostrar
        window?.rootViewController = listOfMoviesView
        window?.makeKeyAndVisible()
    }

    func showDetailMovie(withId movieId: String){
        // Como listOfMoviesView es un opcional no la podemos usar directamente en el argumento
        guard let fromViewController = listOfMoviesView else { return }
        detailRouter?.showDetail(fromViewController: fromViewController, movieId: movieId)
    }
}
