//
//  DrawableDot.swift
//  iPad.SimulatorTest
//
//  Created by Tanut on 26/10/2565 BE.
//

import Foundation
import SwiftUI

class DrawableDot: ObservableObject, Identifiable, Comparable{
    
    static func == (lhs: DrawableDot, rhs: DrawableDot) -> Bool {
        lhs.type == rhs.type && abs(lhs.norm() - rhs.norm()) < 0.1
    }
    
    enum DotType {
        case vehicle, viaPoint, destination
    }
    var type: DotType = DotType.viaPoint
    @Published var position: CGPoint = CGPoint()
    
    init(_dotType: DotType, _position: CGPoint){
        type = _dotType
        position = _position
    }
    
    func draw() -> some View {
        var path = Path()
        path.addArc(center: CGPoint(x: position.x, y: position.y), radius: 10, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360), clockwise: true)
        
        var color: Color = .indigo  // destination
        if type == DotType.viaPoint {
            color = .cyan
        }
        else if type == DotType.vehicle {
            color = .teal
        }
            
        return path.fill(color)
    }
    
    static func < (lhs: DrawableDot, rhs: DrawableDot) -> Bool {
        lhs.norm() < rhs.norm()
    }
    
    func norm() -> Double {
        sqrt(position.x * position.x + position.y * position.y)
    }
}
