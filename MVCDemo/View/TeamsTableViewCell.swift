//
//  TeamsTableViewCell.swift
//  MVCDemo
//
//  Created by Adaps on 10/01/20.
//  Copyright © 2020 CrazyTricks. All rights reserved.
//

import UIKit

class TeamsTableViewCell: TableViewCell {

    /// XIB outlets
    
    @IBOutlet weak var lblTeamName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func configure(_ item: Any?) {
        guard let model = item as? TeamCellModel else { return }
        self.lblTeamName.text = (model.countryName.capitalizingFirstLetter())
    }
    
}
