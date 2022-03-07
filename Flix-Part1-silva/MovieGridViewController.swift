//
//  MovieGridViewController.swift
//  Flix-Part1-silva
//
//  Created by Isabel Silva on 3/4/22.
//

import UIKit

class MovieGridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var moviePosterCollectionView: UICollectionView!
    private var movies = [Movie](){
        didSet{
            moviePosterCollectionView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        moviePosterCollectionView.dataSource = self
        moviePosterCollectionView.delegate = self
        
        let layout = moviePosterCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let width = (view.frame.size.width - layout.minimumInteritemSpacing * 2) / 2
        
        layout.itemSize = CGSize(width: width, height: width*3/2)
        
        MovieGridService.shared.fetchSuperHeroMovies{
            movie in self.movies = movie
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = moviePosterCollectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for: indexPath) as? MovieGridCell
        else{
            return UICollectionViewCell()
        }
        
        cell.configure(with: movies[indexPath.item])
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        let cell = sender as! UICollectionViewCell
        let indexPath = moviePosterCollectionView.indexPath(for: cell)!
        
        let movie = movies[indexPath.row]
        
        let detailViewController = segue.destination as! MovieDetailViewController
        
        detailViewController.movie = movie
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
