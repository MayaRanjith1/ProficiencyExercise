//
//  PEFactmanger.swift
//  ProficiencyExercise
//
//  Created by  Maya Ranjith on 29/07/20.
//

import Foundation
import Alamofire

class PEFactmanger: BaseManager {
    
    class func getFactDetails(completion: @escaping (_ response : Data?, _ error : Error?) ->()){
        let endpoint = PERouter.baseUrl
        BaseManager.requestForServiceWith(endPoint: endpoint) {
            (responseData,responseError) in
            completion(responseData,responseError)
        }
    }
    
    
}
