//
//  ContentView.swift
//  Movie_Test_IOS
//
//  Created by Hamid Qureshi on 09/11/2019.
//  Copyright © 2019 Hamid Qureshi. All rights reserved.
//

import SwiftUI
import Alamofire
import SwiftyJSON
import SDWebImageSwiftUI

//struct Movie: Identifiable {
//    let id: Int
//    let title: String
//    let averageVote: Float
//    let releaseData: String
//    let poster: String
//    let favourite: Bool
//}

struct ContentView: View {
    
    @State var movieList = [Movie]()
    
    let posterURL = "http://image.tmdb.org/t/p/w185/"

    
        var body: some View {
            
            NavigationView{
            List(movieList) { movie in
                
                MovieRow(movie: movie)

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
        let url = "https://api.themoviedb.org/3/movie/popular?"
        let parameters = ["api_key": "95e7498e31198dab04d8a5965a53f252",
                          "page": "1"]
        
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
                                       favourite: false)


                    self.movieList.append(movie)
                }
                
    
             }
         }
        
    }
    
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
