//
//  RequestController.swift
//  RemotePad-iOS
//
//  Created by Nikita Volkov on 11.02.2021.
//

import Foundation

class RemotePadRequests {
    public func tapKey(keyCode: String) {
        let url = URL(string: "http://127.0.0.1:8080/\(keyCode)")
        guard let requestUrl = url else { fatalError() }
        // Create URL Request
        var request = URLRequest(url: requestUrl)
        // Specify HTTP Method to use
        request.httpMethod = "GET"
        // Send HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Check if Error took place
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            // Read HTTP Response Status code
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            
            // Convert HTTP Response Data to a simple String
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
            
        }
        task.resume()
     }
    
    private var webSocketTask: URLSessionWebSocketTask?
    
    public func setupWebSocket() {
        print("Trying to connect WS-server.")
        let urlSession = URLSession(configuration: .default)
        let websocketTask = URLSession.shared.webSocketTask(with: URL(string: "ws://127.0.0.1:8080/echo")!)
        websocketTask.resume()
        let openMessage = URLSessionWebSocketTask.Message.string("ws")
        webSocketTask?.send(openMessage) { error in
            if let error = error {("websocket couldn't send message: \(error.localizedDescription)")}
        }
        print("Message to WSserver sended.")
    }
}
