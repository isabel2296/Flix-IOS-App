//
//  ViewController.swift
//  Flix-Part1-silva
//
//  Created by Isabel Silva on 2/22/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,  UITableViewDelegate {
   
    @IBOutlet weak var tableView: UITableView!
    
    // properties
    private var movies = [Movie](){
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        MovieService.shared.fetchMovies{
            movie in self.movies = movie
        }}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->
    Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 145.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell") as? MoviesTableViewCell
        else {
            return UITableViewCell()
        }
        cell.configure(with: movies[indexPath.row])
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        
        let movie = movies[indexPath.row]
        
        let detailViewController = segue.destination as! MovieDetailViewController
        
        detailViewController.movie = movie
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

