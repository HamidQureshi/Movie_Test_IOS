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
    
    var movie: Movie
    let posterURL = "http://image.tmdb.org/t/p/w185/"
    
    var body: some View {
         HStack {
                       
                       WebImage (url: URL(string: self.posterURL+movie.poster))
                               .resizable() // Resizable like SwiftUI.Image
                               .placeholder(Image(systemName: "photo")) // Placeholder Image
                                // Supports ViewBuilder as well
                               .placeholder {
                                    Rectangle().foregroundColor(.gray)
                                }
                               .indicator(.activity) // Activity Indicator
                               .animation(.easeInOut(duration: 0.5)) // Animation Duration
                               .transition(.fade) // Fade Transition
                               .scaledToFit()
                               .frame(width: 100, height: 150, alignment: .center)
                       
                       VStack(alignment: .leading){
                           HStack{
                               Text("Title: ")
                               Text(movie.title)
                           }
                           HStack{
                               Text("Average Vote: ")
                               Text("\(movie.averageVote)")
                           }
                           HStack{
                               Text("Release Date: ")
                               Text(movie.releaseData)
                           }
                       }
                       
                     }
    }
}

//struct MovieRow_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieRow(movie: movie)
////        .previewLayout(.fixed(width: 300, height: 70))
//
//    }
//}
