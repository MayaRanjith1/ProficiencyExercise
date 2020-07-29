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
    class  func request(url: URLRequestConvertible,loading: Bool = false, completion: @escaping (AlamoFireResponse?) ->() ){
        
        currntTask = Alamofire.request(url).validate().responseJSON {  (response) in
            completion(response)
        }
    }

}
