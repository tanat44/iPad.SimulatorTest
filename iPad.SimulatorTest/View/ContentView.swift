//
//  ContentView.swift
//  iPad.SimulatorTest
//
//  Created by Tanut on 8/10/2565 BE.
//

import SwiftUI

struct ContentView: View {
    @StateObject var setting: SimulatorSetting = SimulatorSetting()
    @StateObject var simulator: Simulator = Simulator.Create()
    @StateObject var map: DrawableMap = DrawableMap()
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            
            // VEHICLE
            HStack {
                Text("Vehicle")
                    .frame(alignment: .leading)
                HStack{
                    Button("Add") {
                        simulator.vehicles.append(Vehicle())
                    }
                    Button("Random") {
                        simulator.randomVehiclePosition()
                    }
                    Button("Print"){
                        print(simulator.description)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }.padding()
            Divider()
            
            // DRAWING
            HStack{
                Text("Drawing")
                    .frame(alignment: .leading)
                HStack{
                    Button("Deselect") {
                        map.selectedRectangle = nil
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
            
            // SIMULATOR
            HStack{
                Text("Simulator")
                    .frame(alignment: .leading)
                HStack{
                    Button("Target") {
                        simulator.randomTarget()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
            
//            .onReceive(timer) { time in
//                mySimulator.advanceTime(timeInSec: 1.1)
//            }
            Divider()
            DrawView(map: map, simulator: simulator).environmentObject(setting)
        }.onAppear{
            simulator.map = map
            simulator.setting = setting
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
