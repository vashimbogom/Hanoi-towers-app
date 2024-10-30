//
//  SharedURLSessionDelegate.swift
//  hanoi-towers-app
//
//  Created by Lord Jose Lopez on 30/10/24.
//

import Foundation

final class SharedURLSessionDelegate: NSObject, URLSessionDelegate {
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        challenge.trustServer { challangeDisposition, credential in
            completionHandler(challangeDisposition,credential)
        }
    }
}

extension URLAuthenticationChallenge {
    
    func trustServer(completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if self.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
            if let serverTrust = self.protectionSpace.serverTrust {
                let credential = URLCredential(trust: serverTrust)
                completionHandler(.useCredential, credential)
                return
            }
        }
        completionHandler(.performDefaultHandling, nil)
    }
}
