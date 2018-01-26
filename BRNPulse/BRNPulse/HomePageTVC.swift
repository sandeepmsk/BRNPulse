//
//  HomePageTVC.swift
//  BRNPulse
//
//  Created by Sandeep on 1/23/18.
//  Copyright © 2018 BRN. All rights reserved.
//

import UIKit

class HomePageTVC: UITableViewController
{
    /*
     Total Days	169
     Working Days	122
     Leaves	2 days
     Absents	8 days
     Days Attended	112 days
     Updates Sent	112 times
     Working Hours	976:00:00
     Worked Hours	962:49:53
     Overall Spent Summary	-14:11:07
     Worked Per day(Avg.Hrs)	07:53:31(99%)
     Shortage Per day(Avg.Hrs)	00:06:28(1%)
     Late to Office	3 times
     Minimum Hrs Missed	24 times
     Max Points	3660
     Points Earned	2910
     Your Performance Score 79.5082%
     */
    var attendanceDetailsArr = ["Total Days","Working Days","Leaves","Absents","Days Attended","Updates Sent","Working Hours","Worked Hours","Overall Spent Summary","Worked Per day(Avg.Hrs)","Shortage Per day(Avg.Hrs)","Late to Office","Minimum Hrs Missed","Max Points","Points Earned","Your Performance Score"]
    var detailsArr = ["169","129","2 days","8 days","112 days","112 times","976:00:00","962:49:53","-14:11:07","07:53:31(99%)","00:06:28(1%)","3 times","24 times","3660","2910","79.5082%"]
    
    var studentDic:[String:String]?
    
    var URLSessionObj:URLSession?
    var URLReq:URLRequest?
    var dataTask:URLSessionDataTask?
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        print(self.studentDic!)
        
        self.URLSessionObj = URLSession(configuration: .default)
        self.URLReq = URLRequest(url: URL(string: "http://www.brninfotech.com/pulse/modules/admin/DashboardSnippets.php")!)
        
        self.URLReq?.httpMethod = "POST"
        
        var dataToSever = "funcName=getUserAttendance&studentIDByAdmin=NoValue"
        
        self.URLReq?.httpBody = dataToSever.data(using: .utf8)
        
        self.dataTask = self.URLSessionObj?.dataTask(with: self.URLReq!, completionHandler: { (data, response, error) in
            print(data)
            do
            {
                //                var responseObj = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions(rawValue: JSONSerialization.ReadingOptions)
                
                 var responseArr = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions(rawValue: JSONSerialization.ReadingOptions.RawValue(0))) as! [[String:Any]]
                print(responseArr)
            }
            catch
            {
                print("something went wrong")
            }
        })
        
        self.dataTask?.resume()
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of rows
        if section == 0
        {
            return 1
        }
        else
        {
            return self.attendanceDetailsArr.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        // no need of register cell in tableview controller, we took tv in VC we have to register in viewcontroller
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "profileCell")
        if indexPath.section == 0
        {
            self.tableView.rowHeight = 230;
            let  cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ProfileTableViewCell
        
            var firstName = self.studentDic?["firstName"]!
            var surName = self.studentDic?["surName"]!
            print("\(firstName!) \(surName!)")
            
            print(self.studentDic?["studentID"]!)
            cell.studetnNameLbl.text = "\(firstName!) \(surName!)"
            cell.studentIDLbl.text = self.studentDic?["studentID"]!
            
            
//            cell.studetnNameString(describing: Lbl.text = self.studentDic?["s)tudentName"] as! String
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "attendanceCell", for: indexPath)
            cell.textLabel?.text = self.attendanceDetailsArr[indexPath.row]
            cell.detailTextLabel?.text = self.detailsArr[indexPath.row]
            self.tableView.separatorStyle = .singleLineEtched
            self.tableView.rowHeight = 50;
            return cell
        }
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
