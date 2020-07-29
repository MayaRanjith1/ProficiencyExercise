//
//  PEDataModel.swift
//  ProficiencyExercise
//
//  Created by Ranjith Karuvadiyil on 29/07/20.
//  Copyright © 2020 Mistybits Pvt Ltd. All rights reserved.
//

import Foundation

struct PEDataModel: Codable {
    var title: String?
    var factRows: [FactRows]?
    
    private enum PEDataCodingKeys: String,CodingKey{
        case title = "title"
        case factRows = "rows"
    }

}

struct FactRows:Codable {
    var title: String?
    var description: String?
    var imageName: String?
    
    private enum FactRowsCodingKeys: String,CodingKey{
        case title = "title"
        case description = "description"
        case imageName = "imageHref"
    }
}

extension PEDataModel{
    init(from decoder:Decoder) throws{
        let dataInfo =  try decoder.container(keyedBy: PEDataCodingKeys.self)
        title =  try dataInfo.decodeIfPresent(String.self, forKey: .title) ?? ""
        factRows = try dataInfo.decode([FactRows].self , forKey: .factRows)
        
    }
}


extension FactRows{
    init(from decoder:Decoder) throws{
           let rowsInfo =  try decoder.container(keyedBy: FactRowsCodingKeys.self)
           title =  try rowsInfo.decodeIfPresent(String.self, forKey: .title) ?? ""
        description =  try rowsInfo.decodeIfPresent(String.self, forKey: .description) ?? ""

        imageName =  try rowsInfo.decodeIfPresent(String.self, forKey: .imageName) ?? ""
       }
}
