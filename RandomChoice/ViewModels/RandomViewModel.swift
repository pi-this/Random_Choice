//
//  RotationViewModel.swift
//  RandomChoice
//
//  Created by Wesley Chastain on 11/25/24.
//


import SwiftUI
import Combine
class RotationViewModel: ObservableObject {
    @Published var rotation: Double = 0
    @Published var amountOfDice = 1
}
