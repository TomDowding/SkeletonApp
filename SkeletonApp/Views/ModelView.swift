//
//  ModelView.swift
//  SkeletonApp
//
//  Created by Tom Dowding on 11/12/2023.
//

import Foundation
import SwiftUI

struct ModelView: View {
    
    let text: String
    let subText: String

    var body: some View {
        HStack {
            Text(text)
            Text(":")
            Text(subText)
        }
    }
}
