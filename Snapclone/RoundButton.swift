//
//  RoundButton.swift
//  Snapclone
//
//  Created by David Wu on 3/25/16.
//  Copyright © 2016 Gofake1. All rights reserved.
//

import UIKit

@IBDesignable
public class RoundButton: UIButton {
    @IBInspectable
    var borderColor: UIColor = UIColor.whiteColor() {
        didSet {
            self.layer.borderColor = borderColor.CGColor
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.clipsToBounds = true
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
