//
//  PEConstants.swift
//  ProficiencyExercise
//
//  Created by Maya Ranjith on 29/07/20.
//

import UIKit

struct CellIdentifiers {
    static let factCell = "PEFactsCell"
}

struct  NetworkMessages {
    static let success = "Success"
    static let authError = "Authentication Error"
    static let badRequest = "Bad Request"
    static let outdated = "The url requested is Outdated"
    static let noDataError = "Response returned with no data to decode"
    static let decodeError = "We couldnt decode the response"
    static let failedError = "Network request failed"
    
    
    
}

struct URLValue {
    static let baseUrl = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
    
}

struct NetworkError {
    static let noInternet = "No internet connectivity.Please checj mobile/Wifi settings"
    static let noDatafound = "No Data Found"
}
