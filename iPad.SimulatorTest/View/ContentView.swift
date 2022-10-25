//
//  ContentView.swift
//  iPad.SimulatorTest
//
//  Created by Tanut on 8/10/2565 BE.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var mySimulator: Simulator = Simulator.Create()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            VStack {
                Button("Add Vehicle") {
                    mySimulator.vehicles.append(Vehicle())
                }
                .foregroundColor(.white)
                .background(Color.brown)
                Button("Deselect") {
                    
                }
                
                
//                Text(mySimulator.description)
            }
            .padding()
            .onAppear{
                print(mySimulator)
            }
//            .onReceive(timer) { time in
//                mySimulator.advanceTime(timeInSec: 1.1)
//            }
            Divider()
            DrawView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
