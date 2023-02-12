//
//  MovieView.swift
//  viper
//
//  Created by Escuela de Tecnologias Aplicadas on 8/2/23.
//

import Foundation
import UIKit

class MovieView: UIViewController{

    var presenter: MoviePresenter?

    @IBOutlet weak var movieTitle: UILabel!
    var titleMovie: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        movieTitle.text = titleMovie
        
    }
}

extension MovieView: MovieUI {
    func update(movie: MovieCellViewModel) {
        titleMovie = movie.title
    }
}
