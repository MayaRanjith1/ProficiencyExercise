//
//  MockURLProtocol.swift
//  ProficiencyExercise
//
//  Created by Maya Ranjith on 29/07/20.
//

import Foundation

class MockURLProtocol: URLProtocol, URLSessionDelegate {
    enum ResponseType{
        case error(Error)
        case success(HTTPURLResponse)
    }
    
    static var responseType: ResponseType!
    static var responseData: Data!
    
    private lazy var session: URLSession = {
        let configuration: URLSessionConfiguration = URLSessionConfiguration.ephemeral
        return URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    }()
    
    private (set) var activetask: URLSessionTask?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    override class  func requestIsCacheEquivalent(_ a: URLRequest, to b: URLRequest) -> Bool {
        return false
    }
    
    override func startLoading() {
        activetask = session.dataTask(with: request)
        activetask?.cancel()
    }
    
    override func stopLoading() {
        activetask?.cancel()
    }
    
}
extension MockURLProtocol:URLSessionDataDelegate{
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        client?.urlProtocol(self, didLoad: data)
    }
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        switch MockURLProtocol.responseType {
        case .error(let error):
            client?.urlProtocol(self, didFailWithError: error)
        case .success(let response)?:
            client?.urlProtocol(self, didReceive:response,cacheStoragePolicy: .notAllowed )
            client?.urlProtocol(self, didLoad: MockURLProtocol.responseData)
        default:
            break
        }
        client?.urlProtocolDidFinishLoading(self)
    }
}
extension MockURLProtocol   {
    static func responsewithFailure(_ error:Error){
        MockURLProtocol.responseType = MockURLProtocol.ResponseType.error(error)
    }
    
    static func resposnseWithSuccess(data: Data){
        MockURLProtocol.responseData = data
        MockURLProtocol.responseType = MockURLProtocol.ResponseType.success(HTTPURLResponse(url: URL(string: "http:/any.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)!)
    }
}
