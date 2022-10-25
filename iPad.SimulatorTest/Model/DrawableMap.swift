//
//  Drawing.swift
//  iPad.SimulatorTest
//
//  Created by Tanut on 25/10/2565 BE.
//

import Foundation


class DrawableMap: ObservableObject {
    @Published var rectangles: Array<DrawRect> = Array()
    @Published var selectedRectangle: DrawRect? = nil
    
    func addRectangle(newRectangle rect: CGRect){
        rectangles.append(DrawRect(rect: rect))
    }
    
    func checkHit() -> DrawRect? {
        return nil
    }
}
