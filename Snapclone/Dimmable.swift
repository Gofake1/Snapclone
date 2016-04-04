//
//  Dimmable.swift
//  Snapclone
//
//  Created by David Wu on 3/27/16.
//  Copyright © 2016 Gofake1. All rights reserved.
//

import UIKit

enum Direction { case In, Out }

protocol Dimmable {}

extension Dimmable where Self: UIViewController {
    func dim(direction: Direction, color: UIColor = UIColor.blackColor(), alpha: CGFloat = 0.0, speed: Double = 0.0) {
        switch direction {
        case .In:
            let dimView = UIView(frame: self.view.frame)
            dimView.backgroundColor = color
            dimView.alpha = 0.0
            self.view.addSubview(dimView)
            
            dimView.translatesAutoresizingMaskIntoConstraints = false
            self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|[dimView]|", options: [], metrics: nil, views: ["dimView": dimView]))
            self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[dimView]|", options: [], metrics: nil, views: ["dimView": dimView]))
            
            UIView.animateWithDuration(speed, animations: {
                dimView.alpha = alpha
            })
            
        case .Out:
            UIView.animateWithDuration(speed, animations: { 
                self.view.subviews.last?.alpha = alpha ?? 0
                }, completion: { (complete) in
                    self.view.subviews.last?.removeFromSuperview()
            })
        }
    }
}