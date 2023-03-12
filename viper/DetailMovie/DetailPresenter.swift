//
//  DetailPresenter.swift
//  viper
//
//  Created by gabatx on 15/2/23.
//

import Foundation

protocol DetailPresenterUI: AnyObject {
    func update(viewModel: DetailMovieViewModel)
}

// Creamos un protocolo que será la abstracción que usaremos desde la view, de esta manera la view no conocerá el
// detail presenter, conocerá el protocolo que vamos a crear ahora.

protocol DetailPresentable{
    var uiDelegate: DetailPresenterUI? { get }
    var movieId: String { get }
    func onViewAppear()
}

class DetailPresenter: DetailPresentable{

    weak var uiDelegate: DetailPresenterUI?

    // Algún componente de la arquitectura de viper se lo acabará inyectando al presenter.
    let movieId: String
    private let interactor: DetailInteractor
    private let mapper: MapperDetailMovieViewModel

    init(movieId: String,
         interactor: DetailInteractor,
         mapper: MapperDetailMovieViewModel = MapperDetailMovieViewModel()) {
        self.interactor = interactor
        self.movieId = movieId
        self.mapper = mapper
    }

    func onViewAppear(){
        Task {
            let model = await interactor.getDetailMovie(withId: movieId)
            let viewModel = mapper.map(entity: model)
            // await MainActor.run{} es un método que nos permite ejecutar código en el hilo principal.
            await MainActor.run{
                self.uiDelegate?.update(viewModel: viewModel)
                print(viewModel)
            }
        }
    }
}
