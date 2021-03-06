//
//  MovieService.swift
//  Flix-Part1-silva
//
//  Created by Isabel Silva on 2/23/22.
//

import Foundation

class MovieService{
    static let shared = MovieService()
    func fetchMovies(completion: @escaping(([Movie])-> Void)){
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                 
                 let moviesRawData = dataDictionary["results"] as! [[String:Any]]
                 var movies = [Movie]()
                 let baseURL = "https://image.tmdb.org/t/p/w185"
                 for rawData in moviesRawData{
                     let posterPath = rawData["poster_path"] as! String
                     let backdrop = rawData["backdrop_path"] as! String
                     let movie = Movie(
                        title: rawData["title"] as! String,
                        synopsis : rawData["overview"] as! String,
                        imageUrl: (baseURL+posterPath),
                        backDropPath:
                            backdrop,
                        releaseDate: rawData["release_date"] as! String)
                     movies.append(movie)
                 }
                 completion(movies)
             }
        }
        task.resume()

    }
    
//    func fetchSuperheroMovies(urlString: String){
//        let url = URL(string: urlString)!
//        
//        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData)
//        
//        request .setValue("Bearer\(apikey)", forHTTPHeaderField: "Authorization")
//        
//        let task = session.dataTask(with:request){ data, response, error in
//            if let error = error {
//                print(error.localizedDescription)
//            } else if let data = data {
//                let decoder = JSONDecoder()
//                let movieGrid = try? decoder.decode(Movie.self, from: data)
//            }
//        }
//    }
}
