//
//  ProfileModel.swift
//  NYOnsites
//
//  Created by Rtstl Developer on 03/10/18.
//  Copyright © 2018 Ahmed Sahib. All rights reserved.
//

import Foundation

struct profileObject : Codable
{
    let status : Int?
    let Message : String?
    let data : profileData?

    
}
struct profileData : Codable {
    
    let ProfileDetails : profileDetailsObject?
    
}
struct profileDetailsObject :Codable{
    
    let CollectorID : String?
    let FirstName : String?
    let LastName : String?
    let Address : String?
    let City : String?
    let State : String?
    let ZipCode : String?
    let CellPhoneNumber : String?
    let EmailAddress : String?




}


//{
//    "status": 1,
//    "Message": "Success",
//    "data": {
//        "ProfileDetails": {
//            "CollectorID": "2",
//            "FirstName": "Animesh",
//            "LastName": "Das",
//            "Address": "Ad-4",
//            "City": "Kolkata",
//            "State": "West Bengal",
//            "ZipCode": "12345",
//            "CellPhoneNumber": "1234567890",
//            "EmailAddress": "animesh@gmail.com"
//        }
//    }
//}
