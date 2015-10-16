//
//  ViewController2.swift
//  StoryboardPaging
//
//  Created by Diego Mello on 10/15/15.
//  Copyright © 2015 Diego Mello. All rights reserved.
//

import UIKit

class ViewController2: BaseContentViewController {

    
    @IBAction func page1Action(sender: AnyObject) {
        self.rootViewController?.goToPreviousContentViewController()
    }
    @IBAction func page3Action(sender: AnyObject) {
        self.rootViewController?.goToNextContentViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
