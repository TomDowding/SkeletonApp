//
//  SkeletonAppTests.swift
//  SkeletonAppTests
//
//  Created by Tom Dowding on 11/12/2023.
//

import XCTest
@testable import SkeletonApp

final class SkeletonAppTests: XCTestCase {
    
    func testLoadState() async throws {
        let testService = TestService()
        let state = State(dataProvider: testService)
        await state.load()
        XCTAssertEqual(state.models?.count, 2)
    }
}

struct TestService: DataProvider {
    
    func fetch() async throws -> [Model] {
        return [
            Model(id: 1, name: "Test 1", subModel: Model.SubModel(name: "Test sub 1")),
            Model(id: 2, name: "Test 2", subModel: Model.SubModel(name: "Test sub 2")),
        ]
    }
}
