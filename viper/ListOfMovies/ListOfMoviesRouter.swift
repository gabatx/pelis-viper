//
//  ListOfMoviesRouter.swift
//  viper
//
//  Created by gabatx on 7/2/23.
//

import Foundation
import UIKit

class ListOfMoviesRouter {

    // Centro de este método es donde vamos a unir todas la piezas
    func showListOfMovies(window: UIWindow?){

        // Instanciamos los componentes
        let interactor = ListOfMoviesInteractor()
        let presenter = ListOfMoviesPresenter(listOfMoviesInteractor: interactor)
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "listOfMoviesIdStory") as! ListOfMoviesView

        // Realizamos la unión
        presenter.uiDelegate = view
        view.presenter = presenter // Este presenter se va a encargar de lanzar la acción

        // Creamos la instancia del navigation controller
        view.title = "List of movies"
        let navController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "storyBoardId") as! UINavigationController
        navController.viewControllers = [view] // Asignamos la vista al navigation controller

        // Le indicamos la vista que se va a mostrar
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}
