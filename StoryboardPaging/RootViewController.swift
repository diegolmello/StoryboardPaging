//
//  RootViewController.swift
//  StoryboardPaging
//
//  Created by Diego Mello on 10/15/15.
//  Copyright © 2015 Diego Mello. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UIPageViewControllerDataSource {

    var pageViewController: UIPageViewController?
    
    var contentPageRestorationIDs: [String] {
        if _contentPageRestorationIDs.count == 0 {
            _contentPageRestorationIDs = ["Page1VC", "Page2VC", "Page3VC"]
        }
        
        return _contentPageRestorationIDs
    }
    var _contentPageRestorationIDs: [String] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as? UIPageViewController
        self.pageViewController?.dataSource = self
        
        let startingViewController: UIViewController = self.viewControllerAtIndex(0)!
        
        self.pageViewController?.setViewControllers([startingViewController], direction: .Forward, animated: false, completion: nil)
        self.addChildViewController(self.pageViewController!)
        self.view.addSubview((self.pageViewController?.view)!)
        self.pageViewController?.didMoveToParentViewController(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewControllerAtIndex(index: Int) -> UIViewController? {
        if index >= self.contentPageRestorationIDs.count {
            return nil
        }
        
        let contentViewController: BaseContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier(_contentPageRestorationIDs[index]) as! BaseContentViewController
        contentViewController.rootViewController = self
        
        return contentViewController
        
    }
    
    func goToNextContentViewController() {
        let currentViewController = self.pageViewController!.viewControllers![0]
        let vcRestorationID = currentViewController.restorationIdentifier
        let index = self._contentPageRestorationIDs.indexOf(vcRestorationID!)
        
        let nextViewController: UIViewController = self.viewControllerAtIndex(index! + 1)!
        
        self.pageViewController?.setViewControllers([nextViewController], direction: .Forward, animated: true, completion: nil)
    }
    
    func goToPreviousContentViewController() {
        let currentViewController = self.pageViewController!.viewControllers![0]
        let vcRestorationID = currentViewController.restorationIdentifier
        let index = self._contentPageRestorationIDs.indexOf(vcRestorationID!)
        
        let previousViewController: UIViewController = self.viewControllerAtIndex(index! - 1)!
        
        self.pageViewController?.setViewControllers([previousViewController], direction: .Forward, animated: true, completion: nil)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self._contentPageRestorationIDs.count
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let vcRestorationID = viewController.restorationIdentifier
        let index = self._contentPageRestorationIDs.indexOf(vcRestorationID!)
        
        if index == self._contentPageRestorationIDs.count - 1 {
            return nil
        }
        
        return self.viewControllerAtIndex(index! + 1)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let vcRestorationID = viewController.restorationIdentifier
        let index = self._contentPageRestorationIDs.indexOf(vcRestorationID!)
        
        if index == 0 {
            return nil
        }
        
        return self.viewControllerAtIndex(index! - 1)
    }
    
    
    override func prefersStatusBarHidden() -> Bool {
        return true
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
