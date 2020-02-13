//
//  Extensions.swift
//  MVCDemo
//
//  Created by Adaps on 10/01/20.
//  Copyright © 2020 CrazyTricks. All rights reserved.
//

import Foundation
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
