//
//  MovieCellView.swift
//  viper
//
//  Created by gabatx on 7/2/23.
//

import UIKit
import Kingfisher

class MovieCellView: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func configure(movie: MovieCellViewModel){
        movieName.text = movie.title
        movieDescription.text = movie.overview
        // Añadimos de manera asíncrona con KingFisher
        movieImageView.kf.setImage(with: movie.imageUrl)
    }
}
