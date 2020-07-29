//
//  PERouter.swift
//  ProficiencyExercise
//
//  Created by Maya Ranjith on 29/07/20.
//

import Foundation
import Alamofire

enum PERouter: Router {
    
    case getFactsData
    
    var method: HTTPMethod{
        switch self {
        case .getFactsData:
            return  .get
        }
    }
    
    var headers: HTTPHeaders?{
        return ["Content-Type":"application/json"]
    }
    
    var bodyParams: Any?{
        return nil
    }
    
    
}
