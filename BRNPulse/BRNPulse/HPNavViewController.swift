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

    override func viewDidLoad() {
        super.viewDidLoad()
        
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        
//        let menu = storyboard.instantiateViewController(withIdentifier: "MenuTableViewController") as! MenuTableViewController
//        
//                let sidemenu = ENSideMenu(sourceView: self.view, menuViewController: menu, menuPosition: ENSideMenuPosition.left)
//        
//        sidemenu.menuWidth = 180
//        view.bringSubview(toFront: navigationBar)
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let menu = storyBoard.instantiateViewController(withIdentifier: "MenuTableViewController") as! MenuTableViewController
        sideMenu = ENSideMenu(sourceView: self.view, menuViewController: menu, menuPosition: .left)
        sideMenu?.menuWidth = 250
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
