//
//  ViewController.swift
//  NYOnsites
//
//  Created by Rtstl Developer on 28/09/18.
//  Copyright © 2018 Ahmed Sahib. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController,APIManagerDelegate,UIScrollViewDelegate,UITextFieldDelegate {
    
    @IBOutlet var scrollView : UIScrollView?
    var currentResponder : UITextField?
    
    
//    profileObject(status: Optional(1), Message: Optional("Success"), data: Optional(NYOnsites.profileData(ProfileDetails: Optional(NYOnsites.profileDetailsObject(CollectorID: Optional("2"), FirstName: Optional("Animesh"), LastName: Optional("Das"), Address: Optional("Ad-4"), City: Optional("Kolkata"), State: Optional("West Bengal"), ZipCode: Optional("12345"), CellPhoneNumber: Optional("1234567890"), EmailAddress: Optional("animesh@gmail.com"))))))
    
    @IBOutlet var firstNameFld : UITextField?
    @IBOutlet var lastNameFld : UITextField?
    @IBOutlet var addressFld : UITextField?
    @IBOutlet var cityFld : UITextField?
    @IBOutlet var stateFld : UITextField?
    @IBOutlet var zipCodeFld: UITextField?
    @IBOutlet var cellPhoneNumberFld : UITextField?
    @IBOutlet var emailAddressFld : UITextField?

    
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        APIManager.shared.delegate=self
        let concatUrlString = "?CollectorID=\("2")"
        APIManager.shared.requestGetApiCall(tag: 2, concatUrlString: concatUrlString)
        
        self.scrollView?.contentSize=CGSize(width: 0, height: 580)
        self.scrollView?.isScrollEnabled=true
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    
    }
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
             //   self.view.frame.origin.y -= keyboardSize.height
               // print(keyboardSize.height)
                
                self.scrollView?.setContentOffset(CGPoint(x: 0, y: (currentResponder?.frame.origin.y)!), animated: true)

            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
               // self.view.frame.origin.y += keyboardSize.height
                self.scrollView?.setContentOffset(CGPoint(x: 0, y: (currentResponder?.frame.origin.y)!), animated: true)

            }
        }
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
//        if let currentResponder=currentResponder{
//
//            currentResponder.resignFirstResponder()
//            self.scrollView?.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
//
//        }
    }
    
    
    @IBAction func backCallBack(sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
     //   self.scrollView?.setContentOffset(CGPoint(x: 0, y: textField.frame.origin.y-120.0), animated: true)
        
        
        textField.becomeFirstResponder()
        currentResponder=textField
        
        
        
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField)->Bool
    {
        textField.resignFirstResponder()
        self.scrollView?.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        
        return true
    }
    
    
    
    @IBAction func loginCallBack(){
        
       // DeviceID=1234567890&DeviceToken=1234567890
      
    }
    
    func responseData(service : APIManager, responseData : Data, tag : Int)
    {
        if(tag==2)
        {
            
                do
                {
                    let result = try JSONDecoder().decode(profileObject.self, from: responseData)
                    print(result)
                    
                    guard let data = result.data else {
                        return
                    }
                    
                    self.initialize(data: data)
                    
                   
                }
                catch let jsonerr
                {
                    print(jsonerr)
                }
            
        }
    }
    
    private func initialize(data : profileData)
    {
        firstNameFld?.text=data.ProfileDetails?.FirstName
        lastNameFld?.text=data.ProfileDetails?.LastName
        addressFld?.text=data.ProfileDetails?.Address
        cityFld?.text=data.ProfileDetails?.City
        stateFld?.text=data.ProfileDetails?.State
        zipCodeFld?.text=data.ProfileDetails?.ZipCode
        cellPhoneNumberFld?.text=data.ProfileDetails?.CellPhoneNumber
        emailAddressFld?.text=data.ProfileDetails?.EmailAddress
}
    
    
    func serviceFailed(service : APIManager, type : String)
    {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

