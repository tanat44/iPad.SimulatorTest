//
//  File.swift
//  iPad.SimulatorTest
//
//  Created by Tanut on 10/10/2565 BE.
//

import Foundation

class Simulator: CustomStringConvertible, ObservableObject, Identifiable{
    @Published var vehicles: Array<Vehicle> = Array()
    var map: DrawableMap? = nil
    var setting: SimulatorSetting? = nil
    
    static func Create() -> Simulator {
        let sim = Simulator()
        sim.vehicles.append(Vehicle())
        sim.vehicles.append(Vehicle())
        
        return sim
    }
    
    func advanceTime(timeInSec time :Float = 1){
        print("Advancing by \(time)")
    }
    
    func randomVehiclePosition() {
        let w = setting?.canvasSize.width
        let h = setting?.canvasSize.height
        
        for v in vehicles {
            let x = Double.random(in: 0 ..< Double(w!))
            let y = Double.random(in: 0 ..< Double(h!))
            v.position = SIMD3<Double>(x: x, y: y, z: 0)
            
            // render
            let dot = DrawableDot(_dotType: DrawableDot.DotType.vehicle, _position: CGPoint(x: x, y: y))
            map?.updateDot(id: v.name, newDot: dot)
        }
    }
    
    func randomTarget(){
        let w = setting?.canvasSize.width
        let h = setting?.canvasSize.height
        
        
        for v in vehicles {
            let x = Double.random(in: 0 ..< Double(w!))
            let y = Double.random(in: 0 ..< Double(h!))
            
            // render
            let dot = DrawableDot(_dotType: DrawableDot.DotType.destination, _position: CGPoint(x: x, y: y))
            map?.updateDot(id: v.name + "_target", newDot: dot)
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

class SimulatorSetting: ObservableObject {
    @Published var canvasSize: CGSize = CGSize()
}
