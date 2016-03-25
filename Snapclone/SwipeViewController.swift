//
//  SwipeViewController.swift
//  Snapclone
//
//  Created by David Wu on 3/25/16.
//  Copyright © 2016 Gofake1. All rights reserved.
//

import UIKit

class SwipeViewController: UIPageViewController {
    var controllers: [UIViewController]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.dataSource = self
        self.controllers = [(storyboard?.instantiateViewControllerWithIdentifier("BubbleViewController"))!,
                            (storyboard?.instantiateViewControllerWithIdentifier("CameraViewController"))!]
        if let firstController = controllers.first {
            setViewControllers([firstController], direction: .Forward, animated: true, completion: nil)
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
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

// MARK: UIPageViewControllerDataSource

extension SwipeViewController: UIPageViewControllerDataSource {
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = self.controllers.indexOf(viewController) else {
            return nil
        }
        let previousIndex = currentIndex-1
        guard previousIndex >= 0 else {
            return nil
        }
        guard self.controllers.count > previousIndex else {
            return nil
        }
        return self.controllers[previousIndex]
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = self.controllers.indexOf(viewController) else {
            return nil
        }
        let nextIndex = currentIndex+1
        guard self.controllers.count != nextIndex else {
            return nil
        }
        guard self.controllers.count > nextIndex else {
            return nil
        }
        return self.controllers[nextIndex]
    }
}
