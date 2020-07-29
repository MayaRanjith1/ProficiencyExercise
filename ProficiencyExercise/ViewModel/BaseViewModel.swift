//
//  BaseViewModel.swift
//  ProficiencyExercise
//
//  Created by Maya Ranjith on 29/07/20.
//

import Foundation

class BaseViewModel {
    // server error
    
    var serverErrorMessage: String{
        return BaseManager.errorDataModel?.fieldErrors?[0].message ?? ""
    }
}
