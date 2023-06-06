//
//  DisplayResponse.swift
//  CameraGPT
//
//  Created by Isaac Castro on 5/13/23.
//

import Foundation

struct Response: Decodable {
    let result: String
}

func dispResult(_ testStr: String) {
    let url = URL(string: "http://localhost:3000/GiveAnswer?question=\(testStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")")!
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let error = error {
            print("Error: \(error)")
        } else if let data = data {
            if let answer = String(data: data, encoding: .utf8) {
                print("Answer: \(answer)")
            }
        }
    }
    task.resume()
}

func findRes(userInput : String) {
  //  let test = "what is 1+1"
  
    dispResult(userInput)
}
