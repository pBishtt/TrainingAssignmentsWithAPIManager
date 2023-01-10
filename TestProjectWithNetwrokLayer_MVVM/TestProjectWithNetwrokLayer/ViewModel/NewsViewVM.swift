//
//  NewsViewVM.swift
//  TestProjectWithNetwrokLayer
//
//  Created by BKS-GGS on 10/01/23.
//

import Foundation

class NewViewVM {
    //    func getNewsFrom(url: String, closure: @escaping (NewsModel?) -> ()) {

    func fetchNews(closure: @escaping ([Hits]?) -> ()) {
        APIManager().getNewsFrom(url: SERVER.NewsURL.rawValue) { response in
            if let newsModel = response {
                let hitsArray = newsModel.hits ?? []
                closure(hitsArray)
            }
        }
    }
}
