//
//  EpisodeRequest.swift
//  GOT
//
//  Created by Damien Serin on 04/10/2021.
//

import Foundation

enum EpisodeError:Error {
    case noDataAvailable
    case cantProcessData
}

struct EpisodeRequest {
    let resourceURL:URL
    
    init(urlString:String){
        guard let url = URL(string: urlString) else {fatalError()}
        self.resourceURL = url
    }
    
    func getEpisodes (completion: @escaping (Result<[EpisodeDetail], EpisodeError>) -> Void ) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) {data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            do{
                let decoder = JSONDecoder()
                let episodesResponse = try decoder.decode(EpisodeResponse.self, from: jsonData)
                let episodeDetails = episodesResponse._embedded.episodes
                print(episodeDetails)
                completion(.success(episodeDetails))
 
            }catch{
                completion(.failure(.cantProcessData))
            }
        }
        dataTask.resume()
    }
    
}
