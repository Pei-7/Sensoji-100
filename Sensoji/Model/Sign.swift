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
