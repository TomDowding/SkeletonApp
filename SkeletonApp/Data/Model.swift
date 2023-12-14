//
//  Model.swift
//  SkeletonApp
//
//  Created by Tom Dowding on 11/12/2023.
//

import Foundation

struct Model: Decodable, Hashable {
    
    let id: Int
    let name: String
    let subModel: SubModel
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case subModel = "company"
    }
    
    init(id: Int, name: String, subModel: SubModel) {
        self.id = id
        self.name = name
        self.subModel = subModel
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        subModel = try container.decode(SubModel.self, forKey: .subModel)
    }
    
    struct SubModel: Decodable, Hashable {
        
        let name: String
        
        enum CodingKeys: CodingKey {
            case name
        }
    }
}
