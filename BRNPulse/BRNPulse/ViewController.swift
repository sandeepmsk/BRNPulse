//
//  ViewController.swift
//  BRNPulse
//
//  Created by Sandeep on 1/23/18.
//  Copyright © 2018 BRN. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var URLSessionObj:URLSession?
    var URLReq:URLRequest?
    var dataTask:URLSessionDataTask?
    
    @IBOutlet weak var emailIDTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    var alertCntrl:UIAlertController?
    var alertActn:UIAlertAction?
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: -ButtonsActions
    
    @IBAction func onSignInButtonTap(_ sender: Any)
    {
        self.emailIDTF.resignFirstResponder()
        self.passwordTF.resignFirstResponder()
        
        if self.emailIDTF.text! == "" &&
            self.passwordTF.text! == ""
        {
            print("something whent wrong")
            self.alertCntrl = UIAlertController(title: "Warning", message: "Please enter Email and Password", preferredStyle: .alert)
            
            self.alertActn = UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
                
            })
            
            self.alertCntrl!.addAction(self.alertActn!)
            
            self.present(self.alertCntrl!, animated: true, completion: nil)
        }
        else
        {
            self.URLSessionObj = URLSession(configuration: .default)
            
            self.URLReq = URLRequest(url: URL(string: "http://www.brninfotech.com/pulse/modules/admin/ValidateLogin.php")!)
            //        self.URLReq = URLRequest(url: URL(string: "https://rss.itunes.apple.com/api/v1/in/ios-apps/top-free/all/10/explicit.json")!)
            
            URLReq?.httpMethod = "POST"
            
            var dataToServer = "funcName=verifyLogin&registeredEmail="+self.emailIDTF.text!+"&registeredPassword="+self.passwordTF.text!
            
            self.URLReq?.httpBody = dataToServer.data(using: .utf8)
            
            self.dataTask = self.URLSessionObj?.dataTask(with: self.URLReq!, completionHandler: { (data, response, error) in
                print(data)
                
                do
                {
                    var responseDic = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions(rawValue: JSONSerialization.ReadingOptions.RawValue(0))) as! [String:String]
                    print(responseDic)
                    
                    if responseDic["loggedIn"] == "yes"
                    {
                        print("logged in successfully")
                        
                        var HPTVC = self.storyboard?.instantiateViewController(withIdentifier: "HPTVC") as! HomePageTVC
                        HPTVC.studentDic = responseDic
                        self.present(HPTVC, animated: true, completion: nil)
                        
                        
                        
                    }
                    else
                    {
                        print("not logged in")
                        
                        self.alertCntrl = UIAlertController(title: "Warning", message: responseDic["msg"], preferredStyle: .alert)
                        
                        self.alertActn = UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
                            
                        })
                        
                        self.alertCntrl!.addAction(self.alertActn!)
                        
                        self.present(self.alertCntrl!, animated: true, completion: nil)
                        
                    }
                    
                }
                catch
                {
                    print("something whent wrong")
                    self.alertCntrl = UIAlertController(title: "Warning", message: "Please enter Email and Password", preferredStyle: .alert)
                    
                    self.alertActn = UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
                        
                    })
                    
                    self.alertCntrl!.addAction(self.alertActn!)
                    
                    self.present(self.alertCntrl!, animated: true, completion: nil)
                }
            })
            
            self.dataTask?.resume()
            
        }
        
//        var registeredEmail = self.emailIDTF.text!
//        var registeredPassword = self.passwordTF.text!
//        print(registeredEmail)
//        print(registeredPassword)
        
        
        
    }
    @IBAction func onCreateAccountButtonTap(_ sender: Any)
    {
        
    }

    


}

