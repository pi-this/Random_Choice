//
//  ContentView.swift
//  RandomChoice
//
//  Created by Wesley Chastain on 11/25/24.
//
// Random Choice: Roll for Fun
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            LinearGradient(colors: colorScheme == .light ? [.white, .brown, .white] : [.black, .brown, .black], startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            Die()
                .foregroundColor(colorScheme == .light ? .accentColor : .black)
            
        }

        .environmentObject(RotationViewModel())
    }
} 

#Preview {
    ContentView()
}
