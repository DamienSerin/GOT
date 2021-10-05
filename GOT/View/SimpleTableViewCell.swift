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
    
    public func configure(with epName: String, epNumber: String){
        episodeName.text = epName
        episodeNumber.text = epNumber
    }
    
    @IBOutlet var coverImage: UIImageView!
    @IBOutlet var episodeName: UILabel!
    @IBOutlet var episodeNumber: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
