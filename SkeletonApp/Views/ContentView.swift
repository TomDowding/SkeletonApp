//
//  ContentView.swift
//  SkeletonApp
//
//  Created by Tom Dowding on 11/12/2023.
//

import Foundation
import SwiftUI

struct ContentView: View {
    
    @StateObject var state: State
    
    var body: some View {
        VStack(alignment: .leading) {
            if let models = state.models {
                ForEach(models, id: \.self) { model in
                    ModelView(text: model.name, subText: model.subModel.name)
                }
            } else if let errorMessage = state.errorMessage {
                Text(errorMessage)
            } else {
                Text("Loading...")
            }
        }
        .task {
            await state.load()
        }
    }
}

#Preview {
    let mockService = MockService()
    let state = State(dataProvider: mockService)
    return ContentView(state: state)
}
