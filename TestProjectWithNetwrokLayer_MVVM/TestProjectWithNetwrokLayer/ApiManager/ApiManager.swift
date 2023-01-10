//
//  ApiManager.swift
//  TestProjectWithNetwrokLayer
//
//  Created by BKS-GGS on 10/01/23.
//

import Foundation

class APIManager {
    
    ///Fetch News  Data From Server
    func getNewsFrom(url: String, closure: @escaping (NewsModel?) -> ()) {
        guard let serverURL = URL(string: url) else {
            print("URL is not Correct")
            closure(nil)
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: serverURL)) { data, response, Error in
            if Error != nil {
                print("Unbale to fetch Data")
                closure(nil)
                return
            }
            if let newsModelData = Parser().parseData(data) {
                closure(newsModelData)
            } else {
                closure(nil)
            }
        }.resume()
    }
}

class Parser {
    func parseData(_ data: Data?) -> NewsModel? {
        do {
            let hackerNewList = try JSONDecoder().decode(NewsModel.self, from: data!)
            print(hackerNewList)
            return hackerNewList
        } catch {
            print(error)
        }
        return nil
    }
}
