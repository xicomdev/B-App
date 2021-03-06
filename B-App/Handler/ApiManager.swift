//
//  ApiManager.swift
//  B-App
//
//  Created by Ankit Chhabra on 10/27/17.
//  Copyright © 2017 Ankit Chhabra. All rights reserved.
//

import Foundation
import Alamofire
import DKImagePickerController
class ApiManager{
    
    static let sharedObj = ApiManager()
    let baseUrl = "http://13.115.153.99:8080/b-app/"
    
    private init()
    {
        
    }
    
    func requestApi(_ endpoint: String, method: HTTPMethod, param: [String : Any]?, completion: @escaping (_ result:NSDictionary?, _ isSuccess:Bool, _ errorStr:String?) -> Void) {
        if (Reachability()?.isReachable)! {
            
            showIndicator()
            let requestUrl = baseUrl + endpoint
            if method == .get {
                request(requestUrl, method: .get, parameters: param, encoding: JSONEncoding.default, headers: ["content-type": "application/json", "Authorization":getAuthHeader()])
                    .responseJSON { response in
                        self.hideIndicator()
                        print(response)
                        if response.response?.statusCode == 200 {
                            if let jsonData = response.result.value as? NSDictionary {
                                completion(jsonData,true,nil)
                            }else {
                                completion(nil,false,NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue) as String?)
                            }
                        }else {
                            print(NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue)!)
                            completion(nil,false,NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue) as String?)
                        }
                }
            }else if method == .post {
            
                request(requestUrl, method: .post, parameters: param, encoding: JSONEncoding.default, headers: ["content-type": "application/json", "Authorization":getAuthHeader()])
                    .responseJSON { response in
                        self.hideIndicator()
                        print(response)
                        if response.response?.statusCode == 200 {
                            if let jsonData = response.result.value as? NSDictionary {
                                print(jsonData)
                                completion(jsonData,true,nil)
                            }else {
                                completion(nil,false,NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue) as String?)
                            }

                        }else {
                            print(NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue)!)

                            completion(nil,false,NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue) as String?)
                        }
                }
            }
            
        }else {
            appDelegateObj.showAlert("No internet connection")
        }
    }
    
    
    func uploadImages(_ endpoint:String, param: [String: String], assets:[DKAsset], completion: @escaping (NSDictionary) -> Void) {
        if (Reachability()?.isReachable)! {
            showIndicator()
            let requestUrl = baseUrl + endpoint
            
            upload(multipartFormData: { multipartFormData in
                for i in 0 ..< assets.count {
                    assets[i].fetchImageWithSize(CGSize(width: 200, height: 200), completeBlock: { image, info in
                        multipartFormData.append(UIImagePNGRepresentation(image!)!, withName: "file", fileName: "\(Date().timeIntervalSince1970).jpeg", mimeType: "image/jpeg")
                    })
                }
                for (key, value) in param {
                    multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
                }
            }, to: requestUrl,
               
               encodingCompletion: { encodingResult in
                self.hideIndicator()
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        if response.response?.statusCode == 200 {
                            if let jsonData = response.result.value as? NSDictionary {
                                completion(jsonData)
                            }
                        }
                    }
                case .failure(let error):
                    print(error)
                }
                
            })
        }else {
            appDelegateObj.showAlert("No internet connection")
        }
        
    }
    
    func uploadImage(_ endpoint:String, param: [String: String]?, image:UIImage, completion: @escaping (_ result:NSDictionary?, _ isSuccess:Bool, _ errorStr:String?) -> Void) {
        if (Reachability()?.isReachable)! {
            showIndicator()
            let requestUrl = baseUrl + endpoint
            
            upload(multipartFormData: { multipartFormData in
                
                multipartFormData.append(UIImagePNGRepresentation(image)!, withName: "filename", fileName: "\(Date().timeIntervalSince1970).jpeg", mimeType: "image/jpeg")
                
            }, to: requestUrl,
               method:.post,
               headers:["content-type": "application/json", "Authorization":getAuthHeader()],
               encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        print(response)
                        self.hideIndicator()
                        if response.response?.statusCode == 200 {
                            if let jsonData = response.result.value as? NSDictionary {
                                completion(jsonData,true,nil)
                            }else {
                                completion(nil,false,NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue) as String?)
                            }
                        }else {
                            completion(nil,false,NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue) as String?)
                        }
                    }
                case .failure(let error):
                    completion(nil,false,error.localizedDescription)
                }
                
            })
        }else {
            appDelegateObj.showAlert("No internet connection")
        }
        
    }
    
    func showIndicator() {
        SwiftLoader.show(true)
    }
    
    func hideIndicator() {
        SwiftLoader.hide()
    }
    
}




