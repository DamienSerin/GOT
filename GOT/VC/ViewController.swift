//
//  ViewController.swift
//  GOT
//
//  Created by Damien Serin on 04/10/2021.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!
    
    var listOfEpisodes = [EpisodeDetail](){
        didSet{
            DispatchQueue.main.async {
                self.table.reloadData()
                //self.navigationItem.title = "\(self.listOfEpisodes.count) Episodes found"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(SimpleTableViewCell.nib(), forCellReuseIdentifier: SimpleTableViewCell.identifier)
        table.register(DetailedTableViewCell.nib(), forCellReuseIdentifier: DetailedTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        
        self.title = "GOT"
        
        let episodeRequest = EpisodeRequest(urlString: "https://beta.goandup.paris/got.json")
        episodeRequest.getEpisodes { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case.success(let episodes):
                self?.listOfEpisodes = episodes
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfEpisodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let simpleCell = tableView.dequeueReusableCell(withIdentifier: SimpleTableViewCell.identifier, for: indexPath) as! SimpleTableViewCell
        let detailedeCell = tableView.dequeueReusableCell(withIdentifier: DetailedTableViewCell.identifier, for: indexPath) as! DetailedTableViewCell
        
        let episode = listOfEpisodes[indexPath.row]
        let episodeRef = "Season \(episode.season) - Episode \(episode.number)"
        
        guard let mediumImageUrl = URL(string: episode.image.medium) else {fatalError()}
        guard let originalImageUrl = URL(string: episode.image.original) else {fatalError()}
        guard let decodedSummary = String(htmlEncodedString: episode.summary) else {fatalError()}
        
        if indexPath.row == 0 {
            detailedeCell.configure(with: episode.name, epNumber: episodeRef, epSummary: decodedSummary)
            detailedeCell.coverImage.sd_setImage(with: originalImageUrl)
            return detailedeCell
        }
        if (indexPath.row)%5 == 0 {
            detailedeCell.configure(with: episode.name, epNumber: episodeRef, epSummary: decodedSummary)
            detailedeCell.coverImage.sd_setImage(with: originalImageUrl)
            return detailedeCell
        }
        simpleCell.configure(with: episode.name, epNumber: episodeRef)
        simpleCell.coverImage.sd_setImage(with: mediumImageUrl)
        return simpleCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowEpisodeDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "ShowEpisodeDetail" {
            let destination = segue.destination as! DetailViewController
            if let indexPath = table.indexPathForSelectedRow{
                let selectedRow = indexPath.row
                
                let episode = listOfEpisodes[selectedRow]
                
                guard let decodedSummary = String(htmlEncodedString: episode.summary) else {fatalError()}
                destination.epName  = episode.name
                destination.epSummary = decodedSummary
                destination.epRuntime = String(episode.runtime)
                destination.epAirDate = episode.airdate
                destination.epAirTime = episode.airtime
                destination.epImgUrl = episode.image.original
                destination.epUrl = episode.url
            }
        }
    }
}

