//
//  AnimesModel.swift
//  IndividualChallenge
//
//  Created by Narely Lima on 13/10/22.
//

import Foundation

struct AnimesModel: Codable, Identifiable {
    let id: Int
    let createdAt: String
    let updatedAt: String
    let canonicalTitle: String
    let synopsis: String
    let averageRating: String
    let posterImage: String
}
