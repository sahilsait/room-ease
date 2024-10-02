//
//  Task.swift
//  RoomEase
//
//  Created by Sahil Sait on 01/10/24.
//

import Foundation

import Foundation

struct Task: Identifiable {
    let id = UUID()
    let title: String
    var isCompleted: Bool
}
