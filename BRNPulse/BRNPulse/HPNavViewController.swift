//
//  HPNavViewController.swift
//  BRNPulse
//
//  Created by Sandeep on 1/31/18.
//  Copyright © 2018 BRN. All rights reserved.
//

import UIKit

class HPNavViewController: ENSideMenuNavigationController
{
    var responseDic:[String:String]?

    override func viewDidLoad() {
        super.viewDidLoad()
 
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let menu = storyBoard.instantiateViewController(withIdentifier: "MenuTableViewController") as! MenuTableViewController
        

        
        sideMenu = ENSideMenu(sourceView: view, menuViewController: menu, menuPosition: .left)
        sideMenu?.menuWidth = (view.bounds.size.width*3)/4
        view.bringSubview(toFront: navigationBar)
        

        
        
        

        


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
