//
//  MovieList.swift
//  Movie_Test_IOS
//
//  Created by Hamid Qureshi on 12/11/2019.
//  Copyright © 2019 Hamid Qureshi. All rights reserved.
//

import SwiftUI
import Alamofire
import SwiftyJSON
import SDWebImageSwiftUI

struct MovieList: View {
    
//    @State var movieList = [Movie]()
//    @State var showFavoritesOnly = false
    
    @EnvironmentObject var movieData: MovieData
    
    let posterURL = "http://image.tmdb.org/t/p/w185/"
    
        var body: some View {
            
            NavigationView{
            List {
                
                Toggle(isOn: $movieData.showFavoritesOnly) {
                                   Text("Favorites only")
                               }
                
                ForEach(movieData.movieList) { movie in
                    if !self.movieData.showFavoritesOnly || movie.favourite {
    //                    NavigationLink(destination: MovieDetail(movie: movie)) {
                            MovieRow(movie: movie)
    //                    }
                    }
                }

            }
            .navigationBarTitle(Text("Movie List"))
                .navigationBarItems(
                       trailing: Button(action: getMovies, label: { Text("Get") })
                     )

            }
            
        }
    
    func addMovies(movies: [Movie]){
//        let movie = Movie(id: 4, title: "Joker4", averageVote: "25%", releaseData: "2018-09-01", poster: "", favourite: false)
//
//        movieList.append(movies)
    }
    
    func getMovies(){
        print("get movies called")
        let url = "https://api.themoviedb.org/3/movie/popular?"
        let parameters = ["api_key": "95e7498e31198dab04d8a5965a53f252",
                          "page": "\(self.movieData.page)"]
        
        Alamofire.request(url,
                          method: .get,
                          parameters: parameters)
            .responseJSON { (responseData) -> Void in
             if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
//                if let resData = swiftyJsonVar["results"].arrayObject {
//                                 let data = resData as! [[String:AnyObject]]
//
//                    for ob in data{
//                        print(ob["title"])
//
//                    }
//                             }
                
                
                let resData = swiftyJsonVar["results"]
                
//                print(resData)
                
                                
                for obj in resData
                {
                    let movieObj = obj.1

                    let movie = Movie(
                                      title: movieObj["title"].string ?? "",
                                      averageVote: movieObj["vote_average"].float ?? 0.0,
                                      releaseData: movieObj["release_date"].string ?? "",
                                      poster: movieObj["poster_path"].string ?? "",
                                       favourite: true)


                    self.movieData.movieList.append(movie)
                }
                
                self.movieData.page += 1
             }
         }
        
    }
    
    }

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
        .environmentObject(MovieData())

    }
}
