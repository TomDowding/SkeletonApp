//
//  State.swift
//  SkeletonApp
//
//  Created by Tom Dowding on 11/12/2023.
//

import Foundation

final class State: ObservableObject {
    
    @Published var models: [Model]?
    @Published var errorMessage: String?
    
    private let dataProvider: DataProvider
    
    init(dataProvider: DataProvider = LiveService()) {
        self.dataProvider = dataProvider
    }
    
    @MainActor
    func load() async {
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            self.models = try await self.dataProvider.fetch()
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
}
