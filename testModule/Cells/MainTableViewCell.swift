//
//  MainTableViewCell.swift
//  testModule
//
//  Created by Anna Sverdlova on 01.02.2023.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    func setup(_ data: String) {
        nameLabel.text = data
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        nameLabel.text = ""
    }
}
