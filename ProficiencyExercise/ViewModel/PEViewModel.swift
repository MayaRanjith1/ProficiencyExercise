//
//  PEViewModel.swift
//  ProficiencyExercise
//
//  Created by Maya Ranjith on 28/07/20.
//

import Foundation

class PEViewModel: BaseManager {
    
    private var factDataModel: PEDataModel?
    var factDetails: [FactRows]?
}

extension PEViewModel{
    func getFactData(completion: @escaping (Bool) -> ()){
        PEFactmanger.getFactDetails { (data,error) in
            if error == nil{
                do{
                    let decoder = JSONDecoder()
                    guard let responseData = data else{
                        DispatchQueue.main.async {
                            completion(false)
                        }
                        return
                    }
                    self.factDataModel = try decoder.decode(PEDataModel.self, from: responseData)
                    
                    self.factDetails = self.factDataModel?.factRows
                    DispatchQueue.main.async {
                        completion (true)
                    }
                }
                catch {
                    DispatchQueue.main.async {
                        completion(false)
                    }
                }
                
            }else{
                completion(false)
                
            }
        }
        
    }
}
