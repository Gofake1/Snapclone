//
//  CameraViewController.swift
//  Snapclone
//
//  Created by David Wu on 3/25/16.
//  Copyright © 2016 Gofake1. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {
    let imagePicker = UIImagePickerController()
    @IBOutlet weak var cameraImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cameraButtonTapped(sender: RoundButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.Camera)) {
            if (UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil) {
                imagePicker.sourceType = .Camera
                imagePicker.cameraCaptureMode = .Photo
                presentViewController(imagePicker, animated: true, completion: nil)
            } else {
                
            }
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
