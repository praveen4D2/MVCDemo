//
//  TableViewCell.swift
//  MVCDemo
//
//  Created by Adaps on 06/01/20.
//  Copyright © 2020 CrazyTricks. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    var item: Any? {
        didSet {
            self.configure(self.item)
        }
    }
    
    weak var delegate: NSObjectProtocol? = nil
    
    func configure(_ item: Any?) { }

}
