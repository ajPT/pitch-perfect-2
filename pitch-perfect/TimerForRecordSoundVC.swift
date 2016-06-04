//
//  TimerForRecordSoundVC.swift
//  pitch-perfect
//
//  Created by Amadeu Andrade on 04/06/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import Foundation

extension RecordSoundViewController {

    //TIMER
    func startTimer() {
        stopTimer()
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(RecordSoundViewController.timerAction), userInfo: nil, repeats: true)
    }
    
    func timerAction() {
        counter += 1
        recordLbl.text = "Recording time: \(retrieveTimeFromCounter(counter))"
    }
    
    func stopTimer() {
        if timer != nil {
            timer.invalidate()
        }
        counter = 0
    }
    
    func retrieveTimeFromCounter(counter: Int) -> String {
        let seconds = counter % 60
        let minutes = (counter / 60) % 60
        let hours = (counter / 3600)
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}