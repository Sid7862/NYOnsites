//
//  LoginModel.swift
//  CodeableDemo
//
//  Created by Rtstl Developer on 27/09/18.
//  Copyright © 2018 Ahmed Sahib. All rights reserved.
//

import Foundation

struct loginData : Decodable
{
    let IsSuccess : String?
    let CollectorID : String?
    let FirstName : String?
    let LastName : String?
    let EmailAddress : String?
    let Message : String?


}
struct loginObject : Decodable {

    let status : Int?
    let Message : String?
    let data : loginData?

}


//{
//    "status": 1,
//    "Message": "Login Successful.",
//    "data": {
//        "IsSuccess": "Y",
//        "CollectorID": "2",
//        "FirstName": "Animesh",
//        "LastName": "Das",
//        "EmailAddress": "animesh@gmail.com",
//        "Message": "Login Successful."
//    }
//}
