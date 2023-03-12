//
//  DetailRouter.swift
//  viper
//
//  Created by gabatx on 15/2/23.
//

import Foundation
import UIKit

protocol DetailRouting {
    func showDetail(fromViewController: UIViewController, movieId: String)
}

class DetailRouter: DetailRouting {

    func showDetail(fromViewController: UIViewController, movieId: String) {
        let interactor = DetailInteractor()
        let presenter = DetailPresenter(movieId: movieId, interactor: interactor)
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailMovieIdStory") as! DetailView

        // De esta manera podremos
        view.presenter = presenter
        presenter.uiDelegate = view // De esta manera el presenter podrá pasar los datos que hemos obtenido del interactor a la view

        // -- Navegación --
        // Para poder navegar necesitamos poder tener una referencia del viewController de donde venimos, es decir,
        // desde que viewController A, vamos a presenter un viewController B. En este caso necesitamos una referencia
        // del viewController listOfMoviesView a el DetailView

        fromViewController.present(view, animated: true)
    }
}
