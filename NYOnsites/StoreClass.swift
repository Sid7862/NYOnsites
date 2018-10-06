//
//  StoreClass.swift
//  Divine2Logic
//
//  Created by Rtstl Developer on 07/03/18.
//  Copyright © 2018 Rtstl Developer. All rights reserved.
//

import UIKit

class StoreClass: NSObject {
    
    static let sharedInstance = StoreClass()
     var countryid:String=""
     var roleid:String=""
     var latitude:String=""
     var longitude:String=""
     var deviceID:String=""
     var deviceToken:String=""


//    var member_id:String=""
//    var member_type:String=""
//    var org_mem_id:String=""
//    var pic_id:String=""
    

   static func isNullString(inputString : String) -> Bool {
        
//        if(( inputString .isEqualToString(find: ""))||(inputString .isEqualToString(find: "(NULL)"))||(inputString .isEqualToString(find: "<NULL>"))||(inputString .isEqualToString(find: "<null>"))||(inputString .isEqualToString(find: "(null)"))||inputString.count==0)
        
         if(( inputString == "")||(inputString == "(NULL)")||(inputString == "<NULL>")||(inputString == "<null>")||(inputString == "(null)")||inputString.count==0)
        {
            return true
        }
        else
        {
        return false
        }
    }
    
   static func showAlert(messageString : String, viewcontroller : UIViewController)
    {
        let uiAlert = UIAlertController(title: "Sorry!!", message: messageString, preferredStyle: UIAlertControllerStyle.alert)
        viewcontroller.present(uiAlert, animated: true, completion: nil)
        
        uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
        }))
        

    }

}

