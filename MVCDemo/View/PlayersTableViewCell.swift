//
//  PlayersTableViewCell.swift
//  MVCDemo
//
//  Created by Adaps on 10/01/20.
//  Copyright © 2020 CrazyTricks. All rights reserved.
//

import UIKit

class PlayersTableViewCell: TableViewCell {

    /// XIB outlets

    @IBOutlet weak var playerName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    override func configure(_ item: Any?) {
        
        guard let player = item as?Player else { return  }
        self.playerName.text = player.name
        
        if let flag = player.captain {
            
            if flag == true{
                self.playerName.textColor = UIColor.systemPink
            }else{
                self.playerName.textColor = UIColor.black
            }
            
        }else{
            self.playerName.textColor = UIColor.black
        }
      
    }
    
}
