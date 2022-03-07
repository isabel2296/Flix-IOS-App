//
//  MovieDetailViewController.swift
//  Flix-Part1-silva
//
//  Created by Isabel Silva on 2/26/22.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var backDropImage: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = movie?.title
        titleLabel.sizeToFit()
        releaseDateLabel.text = movie?.releaseDate
        releaseDateLabel.sizeToFit()
        synopsisLabel.text = movie?.synopsis
        synopsisLabel.sizeToFit()
        let posterURL = URL(string: movie!.imageUrl)!
        let backDropURL = URL(string: "https://image.tmdb.org/t/p/w780"+movie!.backDropPath)!
        
        posterImageView.af.setImage(withURL: posterURL)
        backDropImage.af.setImage(withURL:backDropURL)
    }
    

}
