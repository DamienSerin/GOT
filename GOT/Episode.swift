//
//  Episode.swift
//  GOT
//
//  Created by Damien Serin on 04/10/2021.
//

import Foundation

struct EpisodeResponse:Decodable{
    var _embedded:Episodes
}

struct Episodes:Decodable{
    var episodes:[EpisodeDetail]
    
}

struct EpisodeDetail:Decodable{
    var id: Int
    var url: String
    var name: String
    var season: Int
    var number: Int
    var airdate: String
    var airtime: String
    var runtime: Int
    var image: ImageLinks
    var summary: String
    
}

struct ImageLinks: Decodable {
    var medium: String
    var original: String
}
