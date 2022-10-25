//
//  TableViewCell.swift
//  SepiaPets
//
//  Created by Sushobhit Jain on 25/10/22.
//

import UIKit

class PetsListTableViewCell: UITableViewCell {

  static let identifier = "PetsListTableViewCell"
  @IBOutlet weak var nameL: UILabel!
  @IBOutlet weak var iconView: UIImageView!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

  func setUpCell(data: PetModel) {
    self.nameL.text = data.title
    self.iconView.loadRemoteImageFrom(urlString: data.imageURL)
  }
    
}
