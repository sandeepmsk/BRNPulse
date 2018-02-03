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
    var attendanceDetailsArr = ["Total Days","Working Days","Leaves","Absents","Days Attended","Updates Sent","Working Hours","Worked Hours","Overall Spent Summary","Worked Per day(Avg.Hrs)","Shortage Per day(Avg.Hrs)","Late to Office","Minimum Hrs Missed","Max Points","Points Earned","Your Performance Score"]
    var detailsArr = ["169","129","2 days","8 days","112 days","112 times","976:00:00","962:49:53","-14:11:07","07:53:31(99%)","00:06:28(1%)","3 times","24 times","3660","2910","79.5082%"]
    
    var studentDic:[String:String]?
    
    var URLSessionObj:URLSession?
    var URLReq:URLRequest?
    var dataTask:URLSessionDataTask?
    
    var responseArr = [[String:Any]]()
    
    static var attendanceSummaryDetailsArry = [Any]()
    
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.studentDic = DataStore.staticResponseDic
        
        print(self.studentDic!)
        let imagView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imagView.contentMode = .scaleAspectFit
        imagView.image = UIImage(named: "BRNlogo.png")
        
        navigationItem.titleView = imagView
        
        
        
        self.loadingImageFromServer()
        self.gettingAttendanceDetails()
        print(self.studentDic!)
        
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
            self.tableView.rowHeight = 353;
            let  cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ProfileTableViewCell
            cell.studetnNameLbl.text = (DataStore.staticResponseDic?["firstName"])!+(DataStore.staticResponseDic?["surName"])!
            cell.batchIDLbl.text = "BATCH ID : "+(DataStore.staticResponseDic?["batchID"])!
            cell.studentIDLbl.text = "STUDENT ID : "+(DataStore.staticResponseDic?["studentID"])!
            if DataStore.staticImageData != nil
            {
                cell.profilePicImgView.image = UIImage(data: DataStore.staticImageData!)

            }
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "attendanceCell", for: indexPath)
            cell.textLabel?.text = self.attendanceDetailsArr[indexPath.row]
//            cell.detailTextLabel?.text = self.detailsArr[indexPath.row]
            if HomePageTVC.attendanceSummaryDetailsArry.count != 0
            {
                cell.detailTextLabel?.text = (String)(describing: HomePageTVC.attendanceSummaryDetailsArry[indexPath.row] as Any)
                self.tableView.separatorStyle = .singleLineEtched
                self.tableView.rowHeight = 50;
            }
            return cell

            
        }
    }
    //MARK: -Tableview Delegates
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        var height = CGFloat()
        if section == 1
        {
            height = 40
        }
        return height
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
    {
        if section == 1
        {
            let headerView = view as! UITableViewHeaderFooterView
            headerView.contentView.backgroundColor = UIColor.init(colorLiteralRed: 0.2157, green: 0.5059, blue: 0.2118 , alpha: 1)
            headerView.textLabel?.text = "ATTENDANCE SUMMARY"
            headerView.textLabel?.textColor = UIColor.white
            headerView.textLabel?.textAlignment = .center
            headerView.textLabel?.font = UIFont.init(name: "Arial", size: 27)        }
        
    }

    //MARK:- Menu Button Acrion
    @IBAction func onMenuTapped(_ sender: Any)
    {
        toggleSideMenuView()
    }
    
    //MARK:-loading Image
    func loadingImageFromServer()
    {
        var img:NSString = (self.studentDic?["profileImagePath"])! as NSString
        print(img)
        var img1 = img.substring(from: 2)
        print(img1)
        
        var imgURL = "http://www.brninfotech.com/pulse/modules"+img1
        print(imgURL)
        
        //            let url:URL = URL(string: imgURL)!
        let session = URLSession(configuration: .default)
        var urlReq = URLRequest(url: URL(string: imgURL)!)
        urlReq.httpMethod = "GET"
        
        var task = session.dataTask(with: urlReq, completionHandler: { (data1, response1, error1) in
            if data1 != nil
            {
                DataStore.staticImageData = data1
            }
            else
            {
                print("image is not available")
            }
        })
        
        
        
        task.resume()
    }

    @IBAction func onLgoutTapped(_ sender: Any)
    {
        let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(destinationVC, animated: true, completion: nil)

    }
    
    //MARK:-Getting Attendance Details
    func gettingAttendanceDetails()
    {
        self.URLSessionObj = URLSession(configuration: .default)
        self.URLReq = URLRequest(url: URL(string: "http://www.brninfotech.com/pulse/modules/admin/DashboardSnippets.php")!)
        
        self.URLReq?.httpMethod = "POST"
        
        var dataToSever = "funcName=getUserAttendance&studentIDByAdmin=NoValue"
        
        self.URLReq?.httpBody = dataToSever.data(using: .utf8)
        
        self.dataTask = self.URLSessionObj?.dataTask(with: self.URLReq!, completionHandler: { (data, response, error) in
            print(data)
            do
            {
                self.responseArr = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions(rawValue: JSONSerialization.ReadingOptions.RawValue(0))) as! [[String:Any]]
                
                print("attendance response is  \(self.responseArr)")
                DataStore.staticAttendanceSummaryDataDic = self.responseArr[0]
                
                print("student attendance summary is \(DataStore.staticAttendanceSummaryDataDic!)")
                
                
                self.responseArr.remove(at: 0)
                DataStore.staticAttendanceDailyArray = self.responseArr
                
                print(print("student daily attendance  is \(DataStore.staticAttendanceDailyArray!)"))
                
                self.attendanceSummaryAssigning()

                
                
            }
            catch
            {
                print("something went wrong")
            }
        })
        
        self.dataTask?.resume()
    }
    
    func attendanceSummaryAssigning()
    {
        print("student attendance summary is \(DataStore.staticAttendanceSummaryDataDic!)")

        HomePageTVC.attendanceSummaryDetailsArry = [(DataStore.staticAttendanceSummaryDataDic?["totalDays"])!,(DataStore.staticAttendanceSummaryDataDic?["totalWorkingDays"])!,(DataStore.staticAttendanceSummaryDataDic?["totalLeaves"])!,(DataStore.staticAttendanceSummaryDataDic?["totalAbsents"])!,(DataStore.staticAttendanceSummaryDataDic?["totalDaysAttended"])!,(DataStore.staticAttendanceSummaryDataDic?["totalUpdatesSent"])!,(DataStore.staticAttendanceSummaryDataDic?["totalWorkingHours"])!,(DataStore.staticAttendanceSummaryDataDic?["totalWorkedHours"])!,(DataStore.staticAttendanceSummaryDataDic?["totalShortageHours"])!,(DataStore.staticAttendanceSummaryDataDic?["avgWorkingHours"])!,(DataStore.staticAttendanceSummaryDataDic?["avgShortageHours"])!,(DataStore.staticAttendanceSummaryDataDic?["numberOfTimesLateToOffice"])!,(DataStore.staticAttendanceSummaryDataDic?["numberOfTimesMinimumHoursMissed"])!,(DataStore.staticAttendanceSummaryDataDic?["maxPoints"])!,(DataStore.staticAttendanceSummaryDataDic?["pointsScored"])!,(DataStore.staticAttendanceSummaryDataDic?["percScored"])!]
        
        print(HomePageTVC.attendanceSummaryDetailsArry)
        
        self.tableView.reloadData()

        
    }
    
    
    
    
}
