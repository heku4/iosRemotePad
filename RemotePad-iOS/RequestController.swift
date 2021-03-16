//
//  RequestController.swift
//  RemotePad-iOS
//
//  Created by Nikita Volkov on 11.02.2021.
//

import Foundation

class RemotePadRequests {
    func tapKey(keyCode: String) {
        let url = URL(string: "http://192.168.1.68:8080/\(keyCode)")
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
    
    func connectWS() {
        let url = URL(string: "ws://192.168.1.68:8080/echo")!
        let request = URLRequest(url: url)
        //let websocketTask = URLSessionWebSocketTask()
        
        
    }
}
