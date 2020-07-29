//
//  PEWebserviceHandler.swift
//  ProficiencyExercise
//
//  Created by Maya Ranjith  on 29/07/20.
//

import Foundation
import Alamofire

typealias AlamoFireResponse = DataResponse<Any>

class PEWebserviceHandler: NSObject {
    
    // MARK:- Properties
    static var currntTask: DataRequest?
    
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
