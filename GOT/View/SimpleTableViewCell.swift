//
//  SimpleTableViewCell.swift
//  GOT
//
//  Created by Damien Serin on 04/10/2021.
//

import UIKit

class SimpleTableViewCell: UITableViewCell {
    
    static let identifier = "SimpleTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "SimpleTableViewCell", bundle: nil)
    }
    
    public func configure(with epName: String, epNumber: String, imgUrl: URL){
        episodeName.text = epName
        episodeNumber.text = epNumber
        coverImage.sd_setImage(with: imgUrl)
    }
    
    @IBOutlet var coverImage: UIImageView!
    @IBOutlet var episodeName: UILabel!
    @IBOutlet var episodeNumber: UILabel!
}
