//
//  MenuTableViewController.swift
//  BRNPulse
//
//  Created by Sandeep on 1/31/18.
//  Copyright © 2018 BRN. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController
{

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.contentInset = UIEdgeInsets(top: 75, left: 0, bottom: 0, right: 0)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    /*
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section == 0
        {
            return 1
        }
        else
        {
            return 5
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.section == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuProfileCell", for: indexPath) as! ProfileTableViewCell
            
//            cell.studetnNameLbl.text = (DataStore.responseStaticDic?["firstName"])!+(DataStore.responseStaticDic?["surName"])!
//            cell.batchIDLbl.text = "BATCH ID : "+(DataStore.responseStaticDic?["batchID"])!
//            cell.studentIDLbl.text = "STUDENT ID : "+(DataStore.responseStaticDic?["studentID"])!
//            cell.profilePicImgView.image = UIImage(data: DataStore.imageData!)
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "abc", for: indexPath)
            cell.textLabel?.text = "Home"
            return cell
        }
    }
    
    
 */
 
//
//    /*
//    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
//    */
//
//    /*
//    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
//    }
//    */
//
//    /*
//    // Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//
//    }
//    */
//
//    /*
//    // Override to support conditional rearranging of the table view.
//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the item to be re-orderable.
//        return true
//    }
//    */
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
//    */
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        var destinationVC = UIViewController()
        if indexPath.row == 0
        {
            destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "HPTVC") as! HomePageTVC
        }
        else if indexPath.row == 1
        {
            destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "AttendanceDetailsVC") as! AttendanceDetailsVC
        }
        else if indexPath.row == 2
        {
            destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "DailyStatusUpdateVC") as! DailyStatusUpdateVC
        }
        else if indexPath.row == 3
        {
            destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "CreateRequestVC") as! CreateRequestVC
        }else if indexPath.row == 4
        {
            destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "ApplyLeaveVC") as! ApplyLeaveVC
        }
        else if indexPath.row == 5
        {
            destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "AppSearchVC") as! AppSearchVC
        }
        else if indexPath.row == 6
        {
            destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "GalleryVC") as! GalleryVC
        }
//        else
//        {
//            destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        }
        sideMenuController()?.setContentViewController(destinationVC)
        
        
    }

}
