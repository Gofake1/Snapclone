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
        self.controllers = [(storyboard?.instantiateViewControllerWithIdentifier("SettingsViewController"))!,
                            (storyboard?.instantiateViewControllerWithIdentifier("BubbleViewController"))!,
                            (storyboard?.instantiateViewControllerWithIdentifier("CameraViewController"))!]
        if let firstController = controllers.first {
            setViewControllers([firstController], direction: .Forward, animated: true, completion: nil)
        }
        // Status bar blur
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))
        blurView.frame = CGRectMake(0, 0, self.view.frame.width, 20)
        self.view.addSubview(blurView)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}

// MARK: UIPageViewControllerDataSource

extension SwipeViewController: UIPageViewControllerDataSource {
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        guard let index = self.controllers.indexOf(viewController) else {
            return nil
        }
        let previousIndex = index-1
        guard previousIndex >= 0 else {
            return nil
        }
        guard self.controllers.count > previousIndex else {
            return nil
        }
        return self.controllers[previousIndex]
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        guard let index = self.controllers.indexOf(viewController) else {
            return nil
        }
        let nextIndex = index+1
        guard self.controllers.count != nextIndex else {
            return nil
        }
        guard self.controllers.count > nextIndex else {
            return nil
        }
        return self.controllers[nextIndex]
    }
}
