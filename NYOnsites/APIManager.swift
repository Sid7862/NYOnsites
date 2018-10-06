//
//  APIManager.swift
//  APIManager
//
//  Created by Rtstl Developer on 14/09/18.
//  Copyright © 2018 Ahmed Sahib. All rights reserved.
//
import Foundation
import Alamofire

protocol APIManagerDelegate: class {
    
    
//    func responseData(service : APIManager, responseDictionary : Dictionary<String,Any>, tag : Int)
    func responseData(service : APIManager, responseData : Data, tag : Int)

    
    func serviceFailed(service : APIManager, type : String)
    
    
}


class APIManager
{
     weak var delegate: APIManagerDelegate?
    static let shared = APIManager()
    
    private init()
    {
        
    }
   /*
    func requestPostApiCallWithParameter(parameterDictionary :  Dictionary<String, Any>, tag : Int)
    {
        let net = NetworkReachabilityManager()
        net?.startListening()
        
        net?.listener = { status in
            if net?.isReachable ?? false
            {
                if status == .notReachable || status == .unknown
                {
                    
                }
                else
                {
                    let requestURlString : String!
                        requestURlString = self .getUrlString(tag: tag)
                    Alamofire.request(requestURlString, method: .post, parameters: parameterDictionary, encoding: URLEncoding.default).responseJSON { response in
                        
                        switch(response.result)
                        {
                        case .success(let responseString):
                            print(responseString)
                            
                            if let responseObject = response.result.value
                            {
                                let responseDictionary:Dictionary = responseObject as! Dictionary<String,Any>
                                print(responseDictionary)
                               // self.delegate? .responseData(service: self, responseDictionary: responseDictionary, tag: tag)
                            }
                            
                            
                        case .failure(let error):
                            print(error)
                        }
                        
                    }
                }
            }
    }
    }
    */
    
    func requestPostApiCallWithParameter(parameterDictionary :  Dictionary<String, Any>, tag : Int,concatUrlString : String)
    {
        let net = NetworkReachabilityManager()
        net?.startListening()
        
        net?.listener = { status in
            if net?.isReachable ?? false
            {
                if status == .notReachable || status == .unknown
                {
                    
                }
                else
                {
                    let requestURlString : String!
                    if(concatUrlString .isEmpty)
                    {
                        requestURlString = self .getUrlString(tag: tag)
                        print(requestURlString)
                        
                        
                    }
                    else{
                        requestURlString = self .getUrlString(tag: tag)+concatUrlString
                        print(requestURlString)
                        
                    }
                    
                    Alamofire.request(requestURlString, method: .post, parameters: parameterDictionary, encoding: URLEncoding.default).responseData {
                        response in
                        switch(response.result)
                        {
                        case .success(let responseString):
                            print(responseString)
                            
                            guard let data = response.data else {return}
                            self.delegate?.responseData(service: self, responseData: data, tag: tag)
                            
                            
                            
                            
                            
                        case .failure(let error):
                            print(error)
                        }
                        
                    }
                }
            }
        }
    }
    
    /*
    func requestGetApiCall(tag : Int)
    {
        let net = NetworkReachabilityManager()
        net?.startListening()
        
        net?.listener = { status in
            if net?.isReachable ?? false
            {
                if status == .notReachable || status == .unknown
                {
                    
                }
                else
                {
                    let requestURlString : String!
                    requestURlString = self .getUrlString(tag: tag)
                    Alamofire.request(requestURlString).responseJSON{
                        response in
                        switch(response.result)
                        {
                        case .success(let responseString):
                            print(responseString)
                           
                            if let responseObject = response.result.value
                            {
                                let responseDictionary:Dictionary = responseObject as! Dictionary<String,Any>
                                print(responseDictionary)
                                self.delegate? .responseData(service: self, responseDictionary: responseDictionary, tag: tag)
                               
                                
                            }
                            
                           
                            case .failure(let error):
                            print(error)
                        }
                        
                    }
                }
            }
        }
    }
    */
    
    func requestGetApiCall(tag : Int,concatUrlString : String)
    {
        let net = NetworkReachabilityManager()
        net?.startListening()
        
        net?.listener = { status in
            if net?.isReachable ?? false
            {
                if status == .notReachable || status == .unknown
                {
                    
                }
                else
                {
                    let requestURlString : String!
                    if(concatUrlString .isEmpty)
                    {
                        requestURlString = self .getUrlString(tag: tag)
                        print(requestURlString)


                    }
                    else{
                        requestURlString = self .getUrlString(tag: tag)+concatUrlString
                        print(requestURlString)

                    }
                   
                    Alamofire.request(requestURlString).responseData{
                        response in
                        switch(response.result)
                        {
                        case .success(let responseString):
                            print(responseString)
                            
                            guard let data = response.data else {return}
                            self.delegate?.responseData(service: self, responseData: data, tag: 2)
                            
                            
                            
                            
                        
                        case .failure(let error):
                            print(error)
                        }
                        
                    }
                }
            }
        }
    }
    
    
    func getUrlString(tag : Int) -> String
    {
        var stringUrl : String!
        
        if tag == 1
        {
            stringUrl = BaseURL+Login
        }
        else if tag == 2
        {
            stringUrl = BaseURL+Myprofile
        }
       
      
        return stringUrl
        
    }
    
}
