//
//  PEBaseManager.swift
//  ProficiencyExercise
//
//  Created by Maya Ranjith on 29/07/20.
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

class BaseManager {
    
    // MARK:- Properties
    static let shared = BaseManager()
    var session: URLSession

    static var stringResponse: String?
    static var bodyData: String?
    static var networkRespose: NetworkResponse?
    
    static var errorDataModel: ErrordataModel?
    
    static var appDelegate: AppDelegate? = UIApplication.shared.delegate as? AppDelegate
    
    //MARK:- ConnectionType
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30.0
        session = URLSession(configuration:configuration)
    }
    
    class func connectionType() -> ConnectionType{
        var type: ConnectionType  = .none
        if let reachability = NetworkReachabilityManager(){
            if reachability.isReachableOnEthernetOrWiFi{
                type = .wifi
            }
        }
        return type
    }
    static func isReachable()-> Bool{
        return NetworkReachabilityManager()!.isReachable
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

            switch response.statusCode{
            case  200...299:
                completion(data,nil)


            default:
                self.networkRespose = BaseManager.handleNetworkResponse(response)
                print("Request failed with error:\(error?.localizedDescription ?? "")")
                completion(nil,error)

            }
            
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
    
    static func setMockSession(){
        let session: URLSession = {
            let config: URLSessionConfiguration  = {
                let configration = URLSessionConfiguration.default
                configration.protocolClasses = [MockURLProtocol.self]
                return configration
            }()
            return URLSession(configuration:config)
        }()
        shared.session = session
    }

}
