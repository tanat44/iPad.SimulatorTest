//
//  DrawView.swift
//  iPad.SimulatorTest
//
//  Created by Tanut on 25/10/2565 BE.
//

import SwiftUI

struct DrawView: View {
    @EnvironmentObject var setting: SimulatorSetting
    @ObservedObject var map: DrawableMap
    @ObservedObject var simulator: Simulator
    @State var drawingRect: CGRect? = nil
    @State var drawingOrigin: CGPoint? = nil
    
    let dict = ["key1": "value1", "key2": "value2"]
    
    var dragHandler: some Gesture { DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onChanged({ value in
                if drawingOrigin == nil {
                    drawingOrigin = value.startLocation
                    drawingRect = CGRect(origin: value.startLocation, size: CGSize(width: 10, height: 10))
                }
                
                var size: CGSize = CGSize(width: value.location.x - value.startLocation.x, height: value.location.y - value.startLocation.y)
                
                var newRect = CGRect(origin: value.startLocation, size: size)
                
                if value.location.x < value.startLocation.x {
                    size.width = abs(size.width)
                    newRect.origin = CGPoint(x: value.location.x, y: value.startLocation.y)
                }
                
                if value.location.y < value.startLocation.y {
                    size.height = abs(size.height)
                    newRect.origin = CGPoint(x: newRect.origin.x, y: value.location.y)
                }
                
                newRect.size = size
                drawingRect = newRect
                
            })
            .onEnded({ value in
                //                    Rectangle.fixMinusSize(r: &(drawingRect!))
                map.addRectangle(newRectangle: drawingRect!)
                drawingRect = nil
                drawingOrigin = nil
            })
    }
    
    func makeCanvas(_ geometry: GeometryProxy) -> some View {
        
        
//        DispatchQueue.main.async { self.frame = geometry.size }
        
        return Canvas { context, size in
            if let rect = drawingRect {
                context.stroke( Path.init(rect), with: .color(.orange))
            }
        }
    }
    var body: some View {
        ZStack{
            GeometryReader{ geometry in
                Canvas { context, size in
                    if let rect = drawingRect {
                        context.stroke( Path.init(rect), with: .color(.orange))
                    }
                }.onAppear{
                    setting.canvasSize = geometry.size
                }
            }
            
            // Draw map
            ForEach(map.rectangles) { rect in
                let color: Color = rect === map.selectedRectangle ? .mint : .yellow
                
                rect.draw()
                    .fill(color)
                    .onTapGesture(count: 1){
                        map.selectedRectangle = rect
                    }
            }
            
            // Draw dot
            ForEach(map.dots.sorted(by: >), id: \.key) { key, drawableDot in
                drawableDot.draw()
            }
        }
        .frame(
            maxHeight: .infinity
        )
        .border(.gray)
        .simultaneousGesture(dragHandler)
    }
}

struct DrawView_Previews: PreviewProvider {
    static let map = DrawableMap()
    static let simulator = Simulator()
    
    static var previews: some View {
        DrawView(map: map, simulator: simulator)
    }
}

// DRAW RECTANGLE USING CANVAS
//                for r in drawing.rectangles {
//                    if let selection = drawing.selectedRectangle {
//                        if selection === r {
//                            context.fill( Path.init(r.rect), with: .color(.gray))
//                        }
//                    }
//                    context.stroke( Path.init(r.rect), with: .color(.gray))
//                }
