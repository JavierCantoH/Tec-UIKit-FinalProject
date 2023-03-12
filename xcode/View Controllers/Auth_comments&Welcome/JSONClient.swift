//
//  JsonClient.swift
//  FinalProject
//
//  Created by Luis Javier Canto Hurtado on 25/04/21.
//

import UIKit

let sharedInstance = JSONClient()

class JSONClient {
    var resultArray = [String]()
    let session = URLSession.shared
    var foundStr = ""
    var dataStr = ""
    
    class var instance: JSONClient {
        return sharedInstance
    }
    
    public func sendRequest(url: String, completionHandler: @escaping (String, [String], Error?) -> Void) {
        var request = URLRequest(url: URL(string: url)!)
        request.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { (data, resp, error) in
            guard let dataResponse = data, error == nil else {
                print(error?.localizedDescription ?? "Response Error")
                return
            }
            
            self.dataStr = String(data: data!, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) ?? ""
            
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
                guard let jsonArray = jsonResponse as? [[String:Any]] else {return}
                
                print("Tamaño  arreglo:")
                print(jsonArray.count)
                for dic in jsonArray {
                    
                    guard let title = dic["title"] as? String else {return}
                    print(title)
                    self.resultArray.append(title)
                }
            }
            catch let parsingError {
                print("Error: ", parsingError)
            }
            
            completionHandler(self.dataStr, self.resultArray, error)
            
        }
        task.resume()
    }
}
