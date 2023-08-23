//
//  File.swift
//  
//
//  Created by Marek Piotrowski on 23/08/2023.
//

import Foundation

public class SocketClient: NSObject {
    private let url: URL
    private lazy var webSocket: URLSessionWebSocketTask = {
        session.webSocketTask(with: url)
    }()
    private lazy var session = URLSession(configuration: .default,
                                     delegate: self,
                                     delegateQueue: OperationQueue())
    public init(urlString: String) {
        self.url = URL(string: urlString)!
        super.init()
    }
    
    public func connect() {
        webSocket.resume()
    }
}

extension SocketClient: URLSessionWebSocketDelegate {
    public func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        print("Connect")
    }
}
