//
//  File.swift
//  iPad.SimulatorTest
//
//  Created by Tanut on 10/10/2565 BE.
//

import Foundation

class Simulator: CustomStringConvertible, ObservableObject{
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
    
    public var description: String {
        var output: String = ""
        for v in vehicles{
            output += v.description + "\n"
        }
        return "#\(vehicles.count) vehicles \n\(output)"
    }
}

class Obstable {
    
}
