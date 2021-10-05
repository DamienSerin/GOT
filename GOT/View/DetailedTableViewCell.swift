//
//  DetailedTableViewCell.swift
//  GOT
//
//  Created by Damien Serin on 04/10/2021.
//

import UIKit

class DetailedTableViewCell: UITableViewCell {

    static let identifier = "DetailedTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "DetailedTableViewCell", bundle: nil)
    }
    
    public func configure(with epName: String, epNumber: String, epSummary: String){
        episodeName.text = epName
        episodeNumber.text = epNumber
        episodeSummary.text = epSummary
        labelContainer.layer.cornerRadius = 10
        
        labelContainer.layer.shadowColor = UIColor.black.cgColor
        labelContainer.layer.shadowOffset = CGSize(width: 0, height: 2)
        labelContainer.layer.shadowOpacity = 0.6
        labelContainer.layer.shadowRadius=3.0
    }
    
    @IBOutlet var coverImage: UIImageView!
    @IBOutlet var episodeName: UILabel!
    @IBOutlet var episodeNumber: UILabel!
    @IBOutlet var episodeSummary: UILabel!
    @IBOutlet weak var labelContainer: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
