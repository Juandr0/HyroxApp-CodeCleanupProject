//
//  TimerClass.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-02-14.
//

import Foundation
import SwiftUI

class TimerManager: ObservableObject {
    
    @Published var elapsedTime: TimeInterval = 0
    var timer: Timer?
    var startTime: Date?
    
    func start() {
        timer?.invalidate()
        startTime = Date()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if let startTime = self.startTime {
                self.elapsedTime = -startTime.timeIntervalSinceNow
            }
        }
    }
    
    func stop() {
        timer?.invalidate()
        if let startTime = startTime {
            let elapsedTime = -startTime.timeIntervalSinceNow
            self.elapsedTime = elapsedTime
            self.startTime = nil
        }
    }
}

