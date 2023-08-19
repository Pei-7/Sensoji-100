//
//  Sign.swift
//  Sensoji
//
//  Created by 陳佩琪 on 2023/8/19.
//

import Foundation

struct Sign: Decodable {
    var id: String
    var type: String
    var poem: String
    var explain: String
    var result: [String: String]
    
}
//
//struct Result: Decodable {
//    var wish: String?
//    var disease: String?
//    var person: String?
//    var lost: String?
//    var newHouse: String?
//    var moving: String?
//    var marry: String?
//    var travel: String?
//    var dating: String?
//
//    enum CodingKeys: String, CodingKey {
//        case wish = "願望"
//        case disease = "疾病"
//        case person = "盼望的人"
//        case lost = "遺失物"
//        case newHouse = "蓋新居"
//        case moving = "搬家"
//        case marry = "嫁娶"
//        case travel = "旅行"
//        case dating = "交往"
//    }
//}
