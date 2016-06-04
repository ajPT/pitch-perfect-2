//
//  UtilAlerts.swift
//  pitch-perfect
//
//  Created by Amadeu Andrade on 04/06/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import UIKit

class UtilAlerts {
    
    struct RecordingAlerts {
        static let PermissionDenied = "Permission to record not granted."
        static let RecordingFailed = "For some unknown reason your recording has failed."
        static let InactiveSession = "For some unknown reason the audio session failed."
    }
    
    struct PlayingAlerts {
        static let FileError = "Could not grab the file."
        static let PlayingAudioFailed = "Could not start playing audio."
    }
    
    func showAlert(delegate: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Close", style: .Default, handler: nil))
        delegate.presentViewController(alert, animated: true, completion: nil)
    }
    
}