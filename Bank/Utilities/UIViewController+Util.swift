//
//  UIViewController.swift
//  Bank
//
//  Created by Asadullah Behlim on 09/01/23.
//

import Foundation
import UIKit

extension UIViewController {
    func setStatusBar()  {
        let statusBarSize = UIApplication.shared.statusBarFrame.size
        let frame = CGRect(origin: .zero, size: statusBarSize)
        let statusBarView = UIView(frame: frame)
        
        statusBarView.backgroundColor = appColor
        view.addSubview(statusBarView)
        
    }
  func setTabBarImage(imageName: String, title: String) {
      let configuration = UIImage.SymbolConfiguration(scale: .large)
      let image = UIImage(systemName: imageName, withConfiguration: configuration)
      tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
        
    }
}
