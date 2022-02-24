//
//  MoviesTableViewCell.swift
//  Flix-Part1-silva
//
//  Created by Isabel Silva on 2/23/22.
//

import UIKit
import AlamofireImage
class MoviesTableViewCell: UITableViewCell {

    @IBOutlet weak var MovieImage: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieSynopsisLabel: UILabel!
    
    func configure(with movie: Movie){
        movieTitleLabel.text = movie.title
        movieSynopsisLabel.text = movie.synopsis
        MovieImage.af.setImage(withURL: URL(string: movie.imageUrl)!)
    }
}
