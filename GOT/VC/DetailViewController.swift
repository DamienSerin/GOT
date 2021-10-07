//
//  DetailViewController.swift
//  GOT
//
//  Created by Damien Serin on 04/10/2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var labelEpName: UILabel!
    @IBOutlet weak var labelRunTime: UILabel!
    @IBOutlet weak var labelAirTime: UILabel!
    @IBOutlet weak var labelSummary: UILabel!
    @IBOutlet weak var coverImage: UIImageView!

    var episode = EpisodeDetail(id: 0, url: "", name: "", season: 0, number: 0, airdate: "", airtime: "", runtime: 0, image: ImageLinks(medium: "", original: ""), summary: "")
    
    override func viewWillAppear(_ animated: Bool){
        labelEpName.text = episode.name
        
        labelRunTime.attributedText =
            NSMutableAttributedString()
            .appendWith(weight: .regular, "Durée: ")
            .appendWith(weight: .semibold, "\(episode.runtime) min")
        
        labelAirTime.attributedText =
            NSMutableAttributedString()
            .appendWith(weight: .regular, "Paru le: ")
            .appendWith(weight: .semibold, "\(episode.airdate)")
            .appendWith(weight: .regular, " à ")
            .appendWith(weight: .semibold, "\(episode.airtime)")
        
        guard let decodedSummary = String(htmlEncodedString: episode.summary) else {fatalError()}
        labelSummary.text = decodedSummary
        
        guard let imageUrl = URL(string: episode.image.original) else {fatalError()}
        coverImage.sd_setImage(with: imageUrl)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func didTapeButton(_ sender: UIButton) {
        guard let url = URL(string: episode.url) else {fatalError()}
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:])
         }
    }
}
