//
//  BubbleImageView.swift
//  Snapclone
//
//  Created by David Wu on 4/6/16.
//  Copyright © 2016 Gofake1. All rights reserved.
//

import UIKit

@IBDesignable
class BubbleImageView: UIImageView {
    @IBInspectable
    var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.clipsToBounds = true
    }

}
