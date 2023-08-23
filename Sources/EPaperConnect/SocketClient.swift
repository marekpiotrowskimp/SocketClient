//
//  File.swift
//  
//
//  Created by Marek Piotrowski on 23/08/2023.
//

import Foundation

class SocketClient: NSObject {
    private var webSocket: URLSessionWebSocketTask?
    override init() {
        webSocket = URLSession.shared.webSocketTask(with: URL(string: "ws://192.168.22.205:5000")!)
        webSocket?.resume()
    }
}

extension SocketClient: URLSessionWebSocketDelegate {
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        print("Connect")
    }
}
