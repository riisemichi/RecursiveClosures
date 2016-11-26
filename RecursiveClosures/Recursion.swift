//
//  Recursion.swift
//  RecursiveClosures
//
//  Created by Michi Zurmühle on 26.11.16.
//  Copyright © 2016 NiceApps. All rights reserved.
//

import Foundation

/**
 Class that lets you create recursive closures.
 
     // Create Closure
     let fib = Recursion<Int, Int> { (i, f) in
         i <= 2 ? 1 : f(i-1) + f(i-2)
     }.closure
 
     // Run it
     fib(20)
 
 **T**: Parameter Type.
 
 **R**: Return Type.
 */
public class Recursion<T, R> {
    
    fileprivate let f : (T, (T)->R) -> R
    public var closure : ((T)->R) {
        get {
            return run
        }
    }
    
    /**
     Initializes with a function.
     - parameter function: The function as closure, that should be made recursive.
     - parameter parameter: The parameter of the function.
     - parameter f: The recursive representation of the function. Call this for the recursive call. The function itself will be called if you call this in the closure. `f(n-1)`.
     */
    public init(with function: @escaping (_ parameter: T, _ f: (T)->R)-> R) {
        self.f = function
    }
    
    /**
     Runs the function recursively.
     */
    public func run(_ param: T) -> R {
        return f(param, run)
    }
}

/**
 Cache optimized version of Recursion.
 */
public class CachedRecursion<T: Hashable, R>: Recursion<T, R> {
    private var cache: [T:R] = [:]
    
    /**
     Will store any result in a Cache and only run the actual function if there is no result stored for the parameter already.
     - parameter param: Parameter of the function.
     - returns: Result of the function.
     */
    public override func run(_ param: T) -> R {
        if let result : R = cache[param] {
            return result
        }
        let result = f(param, run)
        cache[param] = result
        return result
    }
    
    /**
     Clear the entire cache.
     */
    public func clearCache() {
        cache.removeAll()
    }
}

public extension Recursion where T: Hashable {
    /**
     Returns a CachedRecursion with the same function.
     
     Supports fluent language:
     
         // Create Closure
         let fib = Recursion<Int, Int> { (i, f) in
             i <= 2 ? 1 : f(i-1) + f(i-2)
         }.cached.closure
     
         // Run it
         fib(20)
     */
    public var cached: CachedRecursion<T, R> {
        get {
            return CachedRecursion(with: f)
        }
    }
}

/**
 Class that lets you create recursive closures.
 
     // Create Closure
     let fib = 🌀<Int, Int> { (i, f) in
         i <= 2 ? 1 : f(i-1) + f(i-2)
     }.closure
 
     // Run it
     fib(20)
 
 **T**: Parameter Type.
 
 **R**: Return Type.
 */
typealias 🌀<T:Hashable, R> = Recursion<T, R> // ;)

