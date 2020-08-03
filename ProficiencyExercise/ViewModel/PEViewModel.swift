//
//  PEViewModel.swift
//  ProficiencyExercise
//
//  Created by Maya Ranjith on 28/07/20.
//

import Foundation

protocol PEViewModelDelegate:class {
    func showNetworkError()
    func fetchedFacts()
    func showRequestError(_ error: String)
}
class PEViewModel: BaseManager {
    
    private var factDataModel: PEDataModel?
    var factDetails: [FactRows]?
    weak var delegate: PEViewModelDelegate?
}

extension PEViewModel{
    
    func fetchFactData(){
        if(!BaseManager.isReachable()){
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                self.delegate?.showNetworkError()
            }
            return
        }
        PEFactmanger.getFactDetails { (response:PEDataModel?,error) in
            if error != nil{
                self.delegate?.showRequestError(error?.localizedDescription ?? "")
            }else{
                self.factDetails = []
                self.factDetails?.append(contentsOf: (response?.factRows ?? []))
                self.delegate?.fetchedFacts()
            }
        }
        
    }
    
}
