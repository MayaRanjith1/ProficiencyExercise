//
//  PEConstants.swift
//  ProficiencyExercise
//
//  Created by Ranjith Karuvadiyil on 29/07/20.
//  Copyright © 2020 Mistybits Pvt Ltd. All rights reserved.
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

struct A {
        static let baseUrl = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"

}
