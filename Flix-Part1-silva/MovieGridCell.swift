//
//  MovieGridCell.swift
//  Flix-Part1-silva
//
//  Created by Isabel Silva on 3/5/22.
//

import UIKit
import AlamofireImage

class MovieGridCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    func configure(with movie: Movie){
        
    posterImageView.af.setImage(withURL: URL(string: movie.imageUrl)!)
    }
}
