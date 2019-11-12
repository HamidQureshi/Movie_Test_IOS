//
//  MovieData.swift
//  Movie_Test_IOS
//
//  Created by Hamid Qureshi on 12/11/2019.
//  Copyright © 2019 Hamid Qureshi. All rights reserved.
//

import Foundation
import Combine

final class MovieData: ObservableObject  {
    
    @Published var showFavoritesOnly = false
    @Published var page = 1
    @Published var movieList : [Movie] = []
    
}
