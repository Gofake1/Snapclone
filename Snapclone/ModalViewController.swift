//
//  ModalViewController.swift
//  Snapclone
//
//  Created by David Wu on 3/27/16.
//  Copyright © 2016 Gofake1. All rights reserved.
//

import UIKit

// FIXME: rewrite using PresentationViewController

class ModalViewController: UIViewController {
    @IBOutlet weak var visualEffectView: ModalVisualEffectView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tapDetected(sender: UITapGestureRecognizer) {
        let location = sender.locationInView(nil)
        // Hard coded for iPhone 5s
        if (!CGRectContainsPoint(CGRectMake(40, 120, 240, 320), location)) {
            self.performSegueWithIdentifier("unwindFromModal", sender: self)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

@IBDesignable
class ModalVisualEffectView: UIVisualEffectView {
    @IBInspectable
    var shadowColor: UIColor = UIColor.blackColor() {
        didSet {
            self.layer.shadowColor = shadowColor.CGColor
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float = 0.0 {
        didSet {
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize = CGSize() {
        didSet {
            self.layer.shadowOffset = shadowOffset
        }
    }
    
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
