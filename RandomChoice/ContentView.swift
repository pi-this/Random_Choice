//
//  ContentView.swift
//  RandomChoice
//
//  Created by Wesley Chastain on 11/25/24.
//
// Random Choice: Choose Random
//
// This will be version 1.1
//
// ability to swap between 1 and 2 die/dice
// and the die will have sound too
//
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var amountOfDice = 1
    @State var twoDice: Bool = false
    
    var body: some View {
        ZStack {
            
            
            VStack {
                HStack {
                    
                    ForEach(0..<amountOfDice, id: \.self) { _ in DieView() .foregroundColor(colorScheme == .light ? .accentColor : .black)
                    }
                    
                }
            }
        }

        .environmentObject(RotationViewModel())
    }
} 

#Preview {
    ContentView()
}
