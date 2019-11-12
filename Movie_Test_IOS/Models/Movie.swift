//
//  Movie.swift
//  Movie_Test_IOS
//
//  Created by Hamid Qureshi on 11/11/2019.
//  Copyright © 2019 Hamid Qureshi. All rights reserved.
//

import Foundation

struct Movie: Identifiable, Hashable, Codable {
    let id = UUID()
    let title: String
    let averageVote: Float
    let releaseData: String
    let poster: String
    var favourite: Bool
}
