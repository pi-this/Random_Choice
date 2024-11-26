//
//  RandomChoiceApp.swift
//  RandomChoice
//
//  Created by Wesley Chastain on 11/25/24.
//

import SwiftUI

@main
struct RandomChoiceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environmentObject(RotationViewModel())
    }
}
