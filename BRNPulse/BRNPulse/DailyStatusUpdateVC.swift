//
//  DailyStatusUpdateVC.swift
//  BRNPulse
//
//  Created by Sandeep on 2/1/18.
//  Copyright © 2018 BRN. All rights reserved.
//

import UIKit

class DailyStatusUpdateVC: UIViewController
{

    @IBAction func onMenuTapped(_ sender: Any)
    {
        toggleSideMenuView()
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let imagView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imagView.contentMode = .scaleAspectFit
        imagView.image = UIImage(named: "BRNlogo.png")
        
        navigationItem.titleView = imagView

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
