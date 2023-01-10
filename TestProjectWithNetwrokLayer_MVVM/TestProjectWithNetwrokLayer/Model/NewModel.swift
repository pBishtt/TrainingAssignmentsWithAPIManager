//
//  NewModel.swift
//  TestProjectWithNetwrokLayer
//
//  Created by BKS-GGS on 10/01/23.
//

import Foundation

struct NewsModel: Decodable {
    var hits: [Hits]?
}

struct Hits: Decodable {
    var title: String?
    var url: String?
    var points: Int
}

//struct NewsModel: Decodable {
//    var title: String?
//    var url: String?
//    var points: Int
//}
//
//
//struct Hits: Decodable {
//    var newsModel: [NewsModel]?
//}
//
//struct DataModel: Decodable {
//    var hits: Hits?
//}

