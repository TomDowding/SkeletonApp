//
//  Service.swift
//  SkeletonApp
//
//  Created by Tom Dowding on 11/12/2023.
//

import Foundation

protocol DataProvider {
    
    func fetch() async throws -> [Model]
}

struct LiveService: DataProvider {
        
    func fetch() async throws -> [Model] {
        let urlString = "https://jsonplaceholder.typicode.com/users"
        
        let url = URL(string: urlString)!
        
        let urlRequest = URLRequest(url: url)
        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
      
        let decoder = JSONDecoder()
        
        return try decoder.decode([Model].self, from: data)
    }
}

struct MockService: DataProvider {
    
    func fetch() async throws -> [Model] {
        return [
            Model(id: 1, name: "Thing 1", subModel: Model.SubModel(name: "Subthing 1")),
            Model(id: 2, name: "Thing 2", subModel: Model.SubModel(name: "Subthing 2")),
            Model(id: 3, name: "Thing 3", subModel: Model.SubModel(name: "Subthing 3")),
        ]
    }
}
