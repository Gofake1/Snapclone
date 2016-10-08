//
//  Dimmable.swift
//  Snapclone
//
//  Created by David Wu on 3/27/16.
//  Copyright © 2016 Gofake1. All rights reserved.
//

import UIKit

enum Direction { case `in`, out }

protocol Dimmable {}

extension Dimmable where Self: UIViewController {
    func dim(_ direction: Direction, color: UIColor = UIColor.black, alpha: CGFloat = 0.0, speed: Double = 0.0) {
        switch direction {
        case .in:
            let dimView = UIView(frame: self.view.frame)
            dimView.backgroundColor = color
            dimView.alpha = 0.0
            self.view.addSubview(dimView)
            
            dimView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[dimView]|", options: [], metrics: nil, views: ["dimView": dimView]))
            self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[dimView]|", options: [], metrics: nil, views: ["dimView": dimView]))
            
            UIView.animate(withDuration: speed, animations: {
                dimView.alpha = alpha
            })
            
        case .out:
            UIView.animate(withDuration: speed, animations: { 
                self.view.subviews.last?.alpha = alpha 
                }, completion: { (complete) in
                    self.view.subviews.last?.removeFromSuperview()
            })
        }
    }
}
