//
//  ContentView.swift
//  SwiftUI Tutorial: Create Child Views with ViewBuilder
//
//  Created by Alvin Sosangyo on 12/18/22.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack(spacing: 0) {
            SelectionItem {
                Text("You can place any View here.")
            }
            SelectionItem {
                VStack {
                    Text("You can place")
                    Text("any View here.")
                }
            }
            SelectionItem {
                HStack {
                    Group {
                        Image(systemName: "sunrise")
                        Image(systemName: "sun.max")
                        Image(systemName: "sunset")
                    }
                    .font(.system(size: 25))
                }
            }
        }
    }

} // ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SelectionItem<Content: View>: View {
    
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        HStack {
            content().padding()
            Spacer()
            arrowToRight()
        }
        .frame(height: 60)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .border(.black)
        .shadow(radius: 5)
        .padding()
    }
    
    @ViewBuilder
    private func arrowToRight() -> some View {
        Image(systemName: "arrow.right")
            .font(.system(size: 25))
            .foregroundColor(.black)
            .padding()
    }
    
}
