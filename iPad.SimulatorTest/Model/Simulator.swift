//
//  File.swift
//  iPad.SimulatorTest
//
//  Created by Tanut on 10/10/2565 BE.
//

import Foundation

class Simulator: CustomStringConvertible, ObservableObject, Identifiable{
    @Published var vehicles: Array<Vehicle> = Array()
    
    static func Create() -> Simulator {
        let sim = Simulator()
        sim.vehicles.append(Vehicle())
        sim.vehicles.append(Vehicle())
        
        return sim
    }
    
    func advanceTime(timeInSec time :Float = 1){
        print("Advancing by \(time)")
    }
    
    func randomVehiclePosition(size: CGSize) {
        for v in vehicles {
            var x = Double.random(in: 0 ..< size.width)
            var y = Double.random(in: 0.0 ..< size.height)
            v.position = SIMD3<Double>(x: x, y: y, z: 0)
        }
    }
    
    public var description: String {
        var output: String = ""
        for v in vehicles{
            output += v.description + "\n"
        }
        return "#\(vehicles.count) vehicles \n\(output)"
    }
}

class SimulatorSetting: ObservableObject{
    @Published var size: CGSize = CGSize()
}
