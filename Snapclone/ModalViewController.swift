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

    @IBAction func tapDetected(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: nil)
        // Hard coded for iPhone 5s
        if (!CGRect(x: 40, y: 120, width: 240, height: 320).contains(location)) {
            self.performSegue(withIdentifier: "unwindFromModal", sender: self)
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
    var shadowColor: UIColor = UIColor.black {
        didSet {
            self.layer.shadowColor = shadowColor.cgColor
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
