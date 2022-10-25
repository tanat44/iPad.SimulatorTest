//
//  DrawView.swift
//  iPad.SimulatorTest
//
//  Created by Tanut on 25/10/2565 BE.
//

import SwiftUI

struct DrawView: View {
    @ObservedObject var drawing: Drawing = Drawing()
    @State var drawingRect: CGRect? = nil
    @State var drawingOrigin: CGPoint? = nil
    
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
                drawing.addRectangle(newRectangle: drawingRect!)
                drawingRect = nil
                drawingOrigin = nil
            })
    }
    
    var body: some View {
        ZStack{
            ForEach(drawing.rectangles) { rect in
                rect.drawRect()
            }
            Rectangle()
                .fill(.mint)
                .frame(width: 10, height: 10)
            Canvas { context, size in
                if let rect = drawingRect {
                    context.stroke( Path.init(rect), with: .color(.orange))
                }
                
                for r in drawing.rectangles {
                    if let selection = drawing.selectedRectangle {
                        if selection === r {
                            context.fill( Path.init(r.rect), with: .color(.gray))
                        }
                    }
                    context.stroke( Path.init(r.rect), with: .color(.gray))
                }
                
            }
        }
        .frame(
            maxHeight: .infinity
        )
        .border(.blue)
        .gesture(
            SpatialTapGesture(count:1, coordinateSpace: .local)
            .onEnded({ value in
                print(value)
            })
            .simultaneously(with: dragHandler)
        )
    }
}

struct DrawView_Previews: PreviewProvider {
    static var previews: some View {
        DrawView()
    }
}
