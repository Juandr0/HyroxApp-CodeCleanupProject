//
//  TimerClass.swift
//  HyroxFitnessApp
//
//  Created by Michael Bergsten on 2023-02-14.
//

import Foundation
import SwiftUI

class TimeManager : ObservableObject {
    
 //   enum timeMode {
 //       case running
 //       case stopped
 //       case paused
 //   }
    
 //   @Published var mode: timeMode = .stopped
    
    @Published var secondsElapsed = 0.0
    var timer = Timer()
    
    func start() {
       // mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.secondsElapsed += 0.1
        }
    }
    
    func pause() {
        timer.invalidate()
     //   mode = .paused
    }
    
    func stop() {
        timer.invalidate()
        secondsElapsed = 0
       // mode = .stopped
    }
    
    
}
