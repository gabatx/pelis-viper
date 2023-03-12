//
//  ListOfMoviesPresenter.swift
//  viper
//
//  Created by gabatx on 7/2/23.
//

import Foundation

protocol ListOfMoviesPresentable: AnyObject {
    var uiDelegate: LisOfMoviesUI? { get }
    var viewModelsMolvieCell: [MovieCellViewModel] {get set}
    func onViewAppear()
    func onTapCell(atIndex: Int)
}

protocol LisOfMoviesUI: AnyObject {
    func update(movies: [MovieCellViewModel])
}

class ListOfMoviesPresenter: ListOfMoviesPresentable {

    weak var uiDelegate: LisOfMoviesUI?
    var viewModelsMolvieCell: [MovieCellViewModel] = []
    private var models: [PopularMovieEntity] = []

    private let listOfMoviesInteractor: ListOfMoviesInteractorInteractable
    private var mapper: MovieCellMapper
    private let router: ListOfMoviesRouting

    init(listOfMoviesInteractor: ListOfMoviesInteractorInteractable,
         mapper: MovieCellMapper = MovieCellMapper(),
         router: ListOfMoviesRouting) {
            self.listOfMoviesInteractor = listOfMoviesInteractor
            self.mapper = mapper
            self.router = router
        }

    // Método que llamamos desde la view. El presenter llama al interactor, y el interactor le devolverá los datos
    // El presenter le devolverá la informació mediante el patrón delegation
    func onViewAppear(){
        Task {
            // Lo hacemos así porque vamos a necesitar el id de los modelos para luego enviar al detalle de la película
            models = await listOfMoviesInteractor.getListOfMovies().results
            viewModelsMolvieCell = models.map { entity in
                mapper.map(entity: entity)
            } // También así: models.map(mapper.map(entity:))
            uiDelegate?.update(movies: viewModelsMolvieCell)
        }
    }

    // Dentro de esta lógica de este método necesitamos saber el id de la película
    func onTapCell(atIndex: Int){
        let movieId = models[atIndex].id.description // description: Pasa el valor al string
        router.showDetailMovie(withId: movieId)
    }
}
