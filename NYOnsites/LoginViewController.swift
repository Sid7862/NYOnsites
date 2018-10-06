//
//  ViewController.swift
//  NYOnsites
//
//  Created by Rtstl Developer on 28/09/18.
//  Copyright © 2018 Ahmed Sahib. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,APIManagerDelegate {
    
    
    @IBOutlet var emailFld : UITextField?
    @IBOutlet var passwordFld : UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        APIManager.shared.delegate=self
        
    
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
         self.navigationController?.navigationBar.isHidden=true
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    @IBAction func loginCallBack(){
        
       // DeviceID=1234567890&DeviceToken=1234567890
        let concatUrlString = "?"+"DeviceID=\(StoreClass.sharedInstance.deviceID)"+"&DeviceToken=\(StoreClass.sharedInstance.deviceToken)"
        let Parameter : Dictionary<String,Any>
        Parameter = ["EmailAddress":self.emailFld?.text ?? "","Password":self.passwordFld?.text ?? ""]
        
        APIManager.shared.requestPostApiCallWithParameter(parameterDictionary: Parameter, tag: 1, concatUrlString: concatUrlString)
    }
    
    
    func responseData(service : APIManager, responseData : Data, tag : Int)
    {
        if(tag==1)
        {
            
                do
                {
                    let result = try JSONDecoder().decode(loginObject.self, from: responseData)
                    print(result)
                    if(result.data?.IsSuccess=="Y")
                    {
                        print("success")

                    }
                    else{
                        print("failed")

                    }
                }
                catch let jsonerr
                {
                    print(jsonerr)
                }
            
        }
    }
    
    
    func serviceFailed(service : APIManager, type : String)
    {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

