//
//  Loader.swift
//  MVCDemo
//
//  Created by Adaps on 06/01/20.
//  Copyright © 2020 CrazyTricks. All rights reserved.
//

import Foundation
import SDWebImage
import MBProgressHUD

///---------------------------------------------------------
/// MARK: - loader Creation Functionality
///---------------------------------------------------------


class Loader {
    
    static func showAdded(to view: UIView, animated: Bool){
        MBProgressHUD.showAdded(to: view, animated: animated)
    }
    
    static func hide(for view: UIView, animated: Bool){
        MBProgressHUD.hide(for: view, animated: animated)
    }
}

extension UIViewController {
    
    func showLoader(animated: Bool = false) {
        Loader.showAdded(to: self.view, animated: animated)
    }
    
    func hideLoader(animated: Bool = false) {
        Loader.hide(for: self.view, animated: animated)
    }
}



///---------------------------------------------------------
/// MARK: - Custom Image loader
///---------------------------------------------------------
class ImageLoader
{
    func imageLoad(imgView :UIImageView,url :String)
    {
        imgView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "gallery-placeholder"))
    }
}
