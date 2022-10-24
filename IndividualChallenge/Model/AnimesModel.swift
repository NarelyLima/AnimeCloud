//
//  AnimesModel.swift
//  IndividualChallenge
//
//  Created by Narely Lima on 13/10/22.
//

import Foundation

struct AnimesModel: Decodable, Identifiable {
    let id: String
    let attributes: Atributes
}

struct Atributes: Decodable {
    let createdAt: String
    let synopsis: String
    let canonicalTitle: String
    let averageRating: String
    let posterImage: PosterImage
}

struct PosterImage: Decodable {
    let original: String
}
struct Response: Decodable {
    let data: [AnimesModel]
}
