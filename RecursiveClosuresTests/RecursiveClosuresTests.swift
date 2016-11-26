//
//  RecursiveClosuresTests.swift
//  RecursiveClosuresTests
//
//  Created by Michi Zurmühle on 26.11.16.
//  Copyright © 2016 NiceApps. All rights reserved.
//

import XCTest
@testable import RecursiveClosures

class RecursiveClosuresTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFibonacci() {
         let fib = Recursion<Int, Int> { (i, f) in
            i <= 2 ? 1 : f(i-1) + f(i-2)
         }.closure
         XCTAssertEqual(fib(6), 8)
    }
    
    func testFibPerformance() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            let fib = Recursion<Int, Int> { (i, f) in
                i <= 2 ? 1 : f(i-1) + f(i-2)
                }.closure
            XCTAssertEqual(fib(20), 6765)
        }
    }
    
    func testFibPerformanceCached() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            let fib = Recursion<Int, Int> { (i, f) in
                i <= 2 ? 1 : f(i-1) + f(i-2)
                }.cached.closure
            XCTAssertEqual(fib(20), 6765)
        }
    }
    
}
