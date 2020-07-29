//
//  ErrorDataModel.swift
//  ProficiencyExercise
//
//  Created by Ranjith Karuvadiyil on 29/07/20.
//  Copyright © 2020 Mistybits Pvt Ltd. All rights reserved.
//

import Foundation

struct  ErrordataModel {
    let fieldErrors: [FieldError]?
}

extension ErrordataModel: Decodable {
    
    private enum ErrordataModelCodingKeys: String,CodingKey{
           case fieldErrors = "fieldErrors"
       }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ErrordataModelCodingKeys.self)
        fieldErrors = try container.decodeIfPresent([FieldError].self, forKey: .fieldErrors) ?? nil
    }
}

struct FieldError {
    let field: String?
    let message: String?
}

extension FieldError: Decodable{
    private enum FieldErrorCodingKeys: String,CodingKey{
        case field = "field"
        case message = "message"
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: FieldErrorCodingKeys.self)
        field = try container.decodeIfPresent(String.self, forKey: .field) ?? ""
        
        message = try container.decodeIfPresent(String.self, forKey: .message) ?? ""
        
    }
    
}
