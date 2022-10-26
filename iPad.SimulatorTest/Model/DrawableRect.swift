//
//  Rectangle.swift
//  iPad.SimulatorTest
//
//  Created by Tanut on 25/10/2565 BE.
//

import Foundation
import SwiftUI

class DrawableRect: ObservableObject, Identifiable{
    @Published var rect: CGRect = CGRect()
    
    init(rect: CGRect) {
        self.rect = rect
    }
    
    func draw() -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.closeSubpath()
        return path
    }
    
//    static func fixMinusSize(r: inout CGRect, origin: CGPoint){
//        var out = CGRect(origin: r.origin, size: r.size)
//        if r.size.width < 0 {
//            print("w < 0")
//            out.origin = CGPoint(x: r.origin.x + r.size.width, y: r.origin.y)
//            out.size.width = -r.size.width
//        }
//        if r.size.height < 0 {
//            print("h < 0")
//            out.origin = CGPoint(x: r.origin.x, y: r.origin.y + r.size.height)
//            out.size.height = -r.size.height
//        }
//        print(out)
//    }
}
