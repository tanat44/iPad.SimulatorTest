//
//  Drawing.swift
//  iPad.SimulatorTest
//
//  Created by Tanut on 25/10/2565 BE.
//

import Foundation

class DrawableMap: ObservableObject {
    
    @Published var rectangles: Array<DrawableRect> = Array()
    @Published var selectedRectangle: DrawableRect? = nil
    @Published var dots = [String: DrawableDot]()
    
    func addRectangle(newRectangle rect: CGRect){
        rectangles.append(DrawableRect(rect: rect))
    }
    
    func checkHit() -> DrawableRect? {
        return nil
    }
    
    func updateDot(id: String, newDot: DrawableDot) {
        dots[id] = newDot
    }
    
    func removeDot(id: String) {
        dots.removeValue(forKey: id)
    }
}
