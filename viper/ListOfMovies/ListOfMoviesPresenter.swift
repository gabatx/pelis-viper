//
//  ListOfMoviesPresenter.swift
//  viper
//
//  Created by gabatx on 7/2/23.
//

import Foundation
import UIKit

protocol ListOfMoviesPresentable: AnyObject {
    var uiDelegate: LisOfMoviesUI? { get }
    var viewModelsMolvieCell: [MovieCellViewModel] {get set}
    func onViewAppear()
    func didTapOnMovie(movie: MovieCellViewModel, view: UIViewController)
}

protocol LisOfMoviesUI: AnyObject {
    func update(movies: [MovieCellViewModel])
}

class ListOfMoviesPresenter: ListOfMoviesPresentable {

    private let listOfMoviesInteractor: ListOfMoviesInteractorInteractable
    weak var uiDelegate: LisOfMoviesUI?
    var viewModelsMolvieCell: [MovieCellViewModel] = []
    private var mapper: MovieCellMapper

    init(listOfMoviesInteractor: ListOfMoviesInteractorInteractable, mapper: MovieCellMapper = MovieCellMapper()) {
        self.listOfMoviesInteractor = listOfMoviesInteractor
        self.mapper = mapper
    }

    // Método que llamamos desde la view. El presenter llama al interactor, y el interactor le devolverá los datos
    // El presenter le devolverá la informació mediante el patrón delegation
    func onViewAppear(){
        Task {
            let models = await listOfMoviesInteractor.getListOfMovies().results
            viewModelsMolvieCell = models.map { entity in
                mapper.map(entity: entity)
            } // También así: models.map(mapper.map(entity:))
            uiDelegate?.update(movies: viewModelsMolvieCell)
        }
    }

    func didTapOnMovie(movie: MovieCellViewModel, view: UIViewController) {
        // Conectamos con el router para que nos envíe a movieDetail
        let router = MovieRouter(navigationController: view.navigationController)
        router.showMovie(movie: movie)
    }
}
