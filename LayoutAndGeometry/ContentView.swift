//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Brian Vo on 5/22/24.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

        var body: some View {
            GeometryReader { fullView in
                ScrollView(.vertical) {
                    ForEach(0..<50) { index in
                        GeometryReader { proxy in
                            //Get the top of the row
                            let minY = proxy.frame(in: .global).minY
                            //Opacity should change when we're at 200 and below
                            let opacity2 = minY < 200.0 ? minY / 200.0 : 1.0
                            
                            //Get the screen size
                            let height = fullView.size.height
                            
                            //Look at the top half of the screen
                            //we shouldn't go smaller than .5
                            let scale = minY < height / 2 ? max(minY / (height / 2), 0.5) : 1
                            let scalez = 0.5
                            
                            Text("Row #\(index)")
                                .font(.title)
                                .frame(maxWidth: .infinity)
                                .background(colors[index % 7])
                                .opacity(opacity2)
                                .scaleEffect(scale, anchor: .bottom)
                                .rotation3DEffect(.degrees(proxy.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                        }
                        .frame(height: 40)
                    }
                }
            }
        }
}

#Preview {
    ContentView()
}
