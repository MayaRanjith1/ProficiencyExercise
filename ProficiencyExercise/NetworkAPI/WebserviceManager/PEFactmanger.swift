//
//  PEFactmanger.swift
//  ProficiencyExercise
//
//  Created by  Maya Ranjith on 29/07/20.
//

import Foundation
import Alamofire

class PEFactmanger: BaseManager {
    
    class func getFactDetails(completion: @escaping ( PEDataModel? , _ error : Error?) ->()){
        let endpoint = PERouter.baseUrl
        BaseManager.requestForServiceWith(endPoint: endpoint) {
            (responseData,responseError) in
            
            if responseData != nil{
                do{
                    let object =    try JSONDecoder().decode(PEDataModel.self, from: responseData!)
                    completion(object , nil)
                    
                }catch{
                    completion(nil , error)
                }
            }else{
                completion(nil , nil)
            }
        }
    }
    
    
}
