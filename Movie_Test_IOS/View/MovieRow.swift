//
//  MovieRow.swift
//  Movie_Test_IOS
//
//  Created by Hamid Qureshi on 11/11/2019.
//  Copyright © 2019 Hamid Qureshi. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieRow: View {
    @EnvironmentObject var movieData: MovieData

    
    var movie: Movie
    let posterURL = "http://image.tmdb.org/t/p/w185/"
    
    var movieIndex: Int {
        movieData.movieList.firstIndex(where: { $0.id == movie.id })!
    }
    
    var body: some View {
         HStack {
                       
                       WebImage (url: URL(string: self.posterURL+movie.poster))
                               .resizable() // Resizable like SwiftUI.Image
                               .placeholder(Image(systemName: "photo")) // Placeholder Image
                                // Supports ViewBuilder as well
                               .placeholder {
                                    Rectangle().foregroundColor(.gray)
                                }
//                                .clipShape(Rectangle())
//                               .overlay(Rectangle.stroke(Color.gray, glLineWidth(4)))
                               .indicator(.activity) // Activity Indicator
                               .animation(.easeInOut(duration: 0.5)) // Animation Duration
                               .transition(.fade) // Fade Transition
                               .scaledToFit()
                               .frame(width: 100, height: 150, alignment: .center)
                       
                        Spacer()
            
                       VStack(alignment: .leading){
                        Spacer()
                           HStack{
                               Text("Title: ")
                               Text(movie.title)
                           }
                        Spacer()
                           HStack{
                               Text("Average Vote: ")
                               Text("\(movie.averageVote)")
                           }
                        Spacer()
                           HStack{
                               Text("Release Date: ")
                               Text(movie.releaseData)
                           }
                        Spacer()
                        
                        HStack{
                              Spacer()

                                Button(action: {
                                    self.movieData.movieList[self.movieIndex].favourite.toggle()
                                                  }) {
                                                    if self.movieData.movieList[self.movieIndex].favourite {
                                                          Image(systemName: "star.fill")
                                                            .padding()
                                                              .foregroundColor(Color.blue)
                                                      } else {
                                                          Image(systemName: "star")
                                                            .padding()
                                                              .foregroundColor(Color.gray)
                                                      }
                                                  }

                            
                            }
                        Spacer()

                       }
                Spacer()

                       
                     }
    }
}

struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieRow(movie: Movie(title: "Joker",averageVote: 3.44,releaseData: "12-1-2019",poster: "",favourite: false))
        .previewLayout(.fixed(width: 400, height: 200))

    }
}
