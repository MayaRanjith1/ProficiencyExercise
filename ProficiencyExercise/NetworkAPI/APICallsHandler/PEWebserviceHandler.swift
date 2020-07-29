//
//  PEWebserviceHandler.swift
//  ProficiencyExercise
//
//  Created by Ranjith Karuvadiyil on 29/07/20.
//  Copyright © 2020 Mistybits Pvt Ltd. All rights reserved.
//

import Foundation
import Alamofire

typealias AlamoFireResponse = DataResponse<Any>

class PEWebserviceHandler: NSObject {
    
    // MARK:- Properties
    static var currntTask: DataRequest?
    
    // MARK:- Request
//    class  func request(url: URLRequestConvertible,loading: Bool = false, completion: @escaping (AlamoFireResponse?) ->() ){
//
//        currntTask = Alamofire.request(url).validate().responseJSON {  (response) in
//            print("response \(response)")
//            completion(response)
//        }
//    }

    
    class  func requestData(urlString: String, completion: @escaping (_ data: Data?,_ response:HTTPURLResponse?, _ error: Error?) -> Void) {
          guard let url = URL(string: urlString) else {
              print("Error: Cannot create URL from string")
              return
          }
          let urlRequest = URLRequest(url: url)
          let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
              guard error == nil else {
                  print("Error calling api")
                return completion(nil,response as? HTTPURLResponse, error)
              }
              guard let responseData = data else {
                  print("Data is nil")
                return completion(nil,response as? HTTPURLResponse, error)
              }
              
              let convertedString = String(data: responseData, encoding: String.Encoding.isoLatin1)!
              //            print("string \(convertedString)")
              
              let newdata = Data(convertedString.utf8)
              
            completion(newdata,response as? HTTPURLResponse, nil)
          }
          task.resume()
      }
}
