//
//  CustomTableViewCell.swift
//  FINDINGBEER
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 10/07/22.
//
import UIKit

class CustomTableViewCell: UITableViewCell{
    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var nameLocalCell: UILabel!
    //    @IBOutlet weak var imageCell: UIImageView!
//
//    @IBOutlet weak var nameLocalCell: UILabel!
//
//    @IBOutlet weak var descriptioncell: UILabel!
//
//
//    @IBOutlet weak var estrellasCell: UILabel!
//
//    @IBOutlet var tableView: UITableView!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
