//
//  Vehicle.swift
//  iPad.SimulatorTest
//
//  Created by Tanut on 10/10/2565 BE.
//

import Foundation

class Vehicle: CustomStringConvertible, ObservableObject {
    static var count: Int = 0
    
    let name: String
    var velocity: SIMD3<Float> = SIMD3.zero
    var acceleration: SIMD3<Float> = SIMD3.zero
    var position: SIMD3<Float> = SIMD3.zero
    var destination: SIMD3<Float> = SIMD3.zero
    
    init(){
        self.name = "Vehicle " + String(Vehicle.count)
        Vehicle.count += 1
    }
    
    public var description: String {
        var output: String = ""
        output += name
        return output
    }
}
