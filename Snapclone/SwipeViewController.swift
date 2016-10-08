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
        self.controllers = [(storyboard?.instantiateViewController(withIdentifier: "SettingsViewController"))!,
                            (storyboard?.instantiateViewController(withIdentifier: "BubbleViewController"))!,
                            (storyboard?.instantiateViewController(withIdentifier: "CameraViewController"))!]
        if let firstController = controllers.first {
            setViewControllers([firstController], direction: .forward, animated: true, completion: nil)
        }
        // Status bar blur
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        blurView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 20)
        self.view.addSubview(blurView)
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}

// MARK: UIPageViewControllerDataSource

extension SwipeViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = self.controllers.index(of: viewController) else {
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
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = self.controllers.index(of: viewController) else {
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
