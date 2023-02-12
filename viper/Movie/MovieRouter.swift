//
//  MovieRouter.swift
//  viper
//
//  Created by Escuela de Tecnologias Aplicadas on 8/2/23.
//

import Foundation
import UIKit


class MovieRouter {

    var navigationController: UINavigationController?

    // Crearemos un inicializador que le inyectamos un navigationController
    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }

    func showMovie(movie: MovieCellViewModel) {
        // Instanciamos los componentes
        let presenter = MoviePresenter()
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieIdStory") as! MovieView

        // Asignamos las dependencias
        view.presenter = presenter
        presenter.uiDelegate = view
        presenter.uiDelegate?.update(movie: movie)

        // Le indicamos la vista que se va a mostrar
       navigationController?.pushViewController(view, animated: true)
    }
}
