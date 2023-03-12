//
//  DetailView.swift
//  viper
//
//  Created by gabatx on 15/2/23.
//

import Foundation
import UIKit
import Kingfisher

class DetailView: UIViewController {


    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieDescription: UILabel!

    // De esta manera conseguimos desacoplarnos de una implementación completa
    var presenter: DetailPresentable?

    override func viewDidLoad() {

        // Llamamos al método del presenter que inicia
        presenter?.onViewAppear()
    }

}

extension DetailView: DetailPresenterUI {
    func update(viewModel: DetailMovieViewModel) {

        movieImageView.kf.setImage(with: viewModel.backdropPath)
        movieName.text = viewModel.title
        movieDescription.text = viewModel.overview

    }
}
