//
//  PERouter.swift
//  ProficiencyExercise
//
//  Created by Ranjith Karuvadiyil on 29/07/20.
//  Copyright © 2020 Mistybits Pvt Ltd. All rights reserved.
//

import Foundation
import  Alamofire

enum PERouter:  Router {
    
    
    
    
    
    
    
    case getFactsData
    
    var method: HTTPMethod{
        switch self {
        case .getFactsData:
          return  .get
        }
    }
    var path: String{
        switch self {
        case .getFactsData:
            return "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
            
        
        }
        
    }
    var headers: HTTPHeaders?{
        return ["Content-Type":"application/json"]
    }
    
    var bodyParams: Any?{
        return nil
    }

}
