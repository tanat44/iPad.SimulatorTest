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
            HStack {
                Button("Add") {
                    simulator.vehicles.append(Vehicle())
                }
                Button("Random") {
                    simulator.randomVehiclePosition(size: setting.size)
                }
                Button("Deselect") {
                    map.selectedRectangle = nil
                }
//                Text(mySimulator.description)
            }
            .padding()
            .onAppear{
                print(simulator)
            }
//            .onReceive(timer) { time in
//                mySimulator.advanceTime(timeInSec: 1.1)
//            }
            Divider()
            DrawView(map: map, simulator: simulator).environmentObject(setting)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
