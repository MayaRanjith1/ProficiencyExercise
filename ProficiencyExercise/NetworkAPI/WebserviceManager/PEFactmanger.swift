//
//  PEFactmanger.swift
//  ProficiencyExercise
//
//  Created by Ranjith Karuvadiyil on 29/07/20.
//  Copyright © 2020 Mistybits Pvt Ltd. All rights reserved.
//

import Foundation

class PEFactmanger: BaseManager {
    
    class func getFactDetails(completion: @escaping (_ response : Data?, _ error : Error?) ->()){
        let endpoint = PERouter.getFactsData
        BaseManager.requestForServiceWith(endPoint: endpoint) {
            (responseData,responseError) in
            completion(responseData,responseError)
        }
    }
}
