//
//  PEBaseManager.swift
//  ProficiencyExercise
//
//  Created by Ranjith Karuvadiyil on 29/07/20.
//  Copyright © 2020 Mistybits Pvt Ltd. All rights reserved.
//

import Foundation
import Alamofire

typealias NetworkResponse = (statusCodes: Int,message: String)

enum NetworkResponseMessage: String{
    case success
    case badRequest
    case outDated
    case failed
    case noData
    case unableToDecode
    
    var description: String{
        get{
            switch (self) {
            case .success:
                return NetworkMessages.success
            case .badRequest:
                return NetworkMessages.badRequest
            case .outDated:
                    return NetworkMessages.outdated
            case .failed:
                    return NetworkMessages.failedError
            case .noData:
                    return NetworkMessages.noDataError
            case .unableToDecode:
                    return NetworkMessages.decodeError


            }
        }
    }
}
enum ConnectionType: String{
    case none
    case wifi
    case wwan
}

class  BaseManager: NSObject {
    
    // MARK:- Properties
    
    static var stringResponse: String?
    static var bodyData: String?
    static var networkRespose: NetworkResponse?
    
    static var errorDataModel: ErrordataModel?
    
    static var appDelegate: AppDelegate? = UIApplication.shared.delegate as? AppDelegate
    
    //MARK:- ConnectionType
    
    class func connectionType() -> ConnectionType{
        var type: ConnectionType  = .none
        if let reachability = NetworkReachabilityManager(){
            if reachability.isReachableOnEthernetOrWiFi{
                type = .wifi
            }else if reachability.isReachableOnWWAN{
                type = .wwan
            }
        }
        return type
    }

    class func requestForServiceWith(endPoint: String, completion: @escaping(_ response: Data?, _ error:Error?) -> ()){
        
        PEWebserviceHandler.requestData(urlString: endPoint){(data,optionalResponse,error) in
            
            guard let response = optionalResponse else{
                completion(nil,nil)
                return
            }
//            print(response)
            self.networkRespose = BaseManager.handleNetworkResponse(response )
            completion(data,nil)

//            switch response{
//            case.success:
//                completion(response.data,nil)
//
//
//            case .failure(let error):
//                self.networkRespose = BaseManager.handleNetworkResponse(response.response)
//                print("Request failed with error:\(error.localizedDescription)")
//                completion(response.data,response.e)
//
//            }
            
        }
    }
    
    
    fileprivate class func handleNetworkResponse(_ response: HTTPURLResponse?) -> NetworkResponse?{
        
        guard let response = response else {
            return nil
        }
        var message: String = ""
        switch response.statusCode {
        case 200...299:message = NetworkResponseMessage.success.description
            
        case 500...599:message = NetworkResponseMessage.badRequest.description
            case 600: message = NetworkResponseMessage.outDated.description
        default:
            message = NetworkResponseMessage.failed.description

        }
        return (statusCodes: response.statusCode,message:message)
        
    }

}
