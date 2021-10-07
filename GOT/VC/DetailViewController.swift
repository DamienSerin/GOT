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

    
    var epName = String()
    var epSummary = String()
    var epRuntime = String()
    var epAirDate = String()
    var epAirTime = String()
    var epImgUrl = String()
    var epUrl = String()
    
    override func viewWillAppear(_ animated: Bool){
        labelEpName.text = epName
        
        
        labelRunTime.attributedText =
            NSMutableAttributedString()
            .appendWith(weight: .regular, "Durée: ")
            .appendWith(weight: .semibold, "\(epRuntime) min")
        
        labelAirTime.attributedText =
            NSMutableAttributedString()
            .appendWith(weight: .regular, "Paru le: ")
            .appendWith(weight: .semibold, "\(epAirDate)")
            .appendWith(weight: .regular, " à ")
            .appendWith(weight: .semibold, "\(epAirTime )")
        
        labelSummary.text = epSummary
        
        guard let imageUrl = URL(string: epImgUrl) else {fatalError()}
        coverImage.sd_setImage(with: imageUrl)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func didTapeButton(_ sender: UIButton) {
        guard let url = URL(string: epUrl) else {fatalError()}
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:])
         }
    }
}
