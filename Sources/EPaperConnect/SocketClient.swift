//
//  File.swift
//  
//
//  Created by Marek Piotrowski on 23/08/2023.
//

import Foundation

class SocketClient: NSObject {
    private let url: URL
    private lazy var webSocket: URLSessionWebSocketTask = {
        session.webSocketTask(with: url)
    }()
    private lazy var session = URLSession(configuration: .default,
                                     delegate: self,
                                     delegateQueue: OperationQueue())
    init(urlString: String) {
        self.url = URL(string: urlString)!
        super.init()
    }
    
    func connect() {
        webSocket.resume()
    }
}

extension SocketClient: URLSessionWebSocketDelegate {
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        print("Connect")
    }
}
