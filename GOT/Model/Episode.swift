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
    
    init(id: Int, url: String, name: String, season: Int, number: Int, airdate: String, airtime: String, runtime: Int, image: ImageLinks, summary: String){
        self.id = id
        self.url = url
        self.name = name
        self.season = season
        self.number = number
        self.airdate = airdate
        self.airtime = airtime
        self.runtime = runtime
        self.image = image
        self.summary = summary
        
    }
    
}

struct ImageLinks: Decodable {
    var medium: String
    var original: String
    
    init(medium: String, original: String){
        self.medium = medium
        self.original = original
    }
}
