//
//  MoviePresenter.swift
//  viper
//
//  Created by Escuela de Tecnologias Aplicadas on 8/2/23.
//

import Foundation

protocol MovieUI: AnyObject {
    func update(movie: MovieCellViewModel)
}

class MoviePresenter {

    weak var uiDelegate: MovieUI?

    

}
