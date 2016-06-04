//
//  ViewController.swift
//  pitch-perfect
//
//  Created by Amadeu Andrade on 30/04/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController {
    
    var audioRecorder: AudioRecorder!
    var timer: NSTimer!
    var counter = 0
    
    let recorderSettings = [
        AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
        AVSampleRateKey: 12000.0,
        AVNumberOfChannelsKey: 1 as NSNumber,
        AVEncoderAudioQualityKey: AVAudioQuality.High.rawValue
    ]
    
    @IBOutlet weak var recordBtn: UIButton!
    @IBOutlet weak var recordLbl: UILabel!
    @IBOutlet weak var stopRecBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        audioRecorder = AudioRecorder()
        if audioRecorder.askUserPermissionToUseMicro() == false {
            recordBtn.enabled = false
            recordLbl.text = "Please ensure the app has access to your microphone."
            UtilAlerts().showAlert(self, title: "Permission Denied", message: UtilAlerts.RecordingAlerts.PermissionDenied)
        }
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(RecordSoundViewController.finishedRecording(_:)), name: "finishRecording:", object: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        recordBtn.enabled = true
        stopRecBtn.enabled = false
        recordLbl.text = "Tap to record"
    }
    
    @IBAction func onRecordPressed(sender: UIButton!) {
        recordBtn.enabled = false
        stopRecBtn.enabled = true
        startTimer()
        audioRecorder.beginRecording()
    }
    
    @IBAction func onStopRecPressed(sender: AnyObject) {
        audioRecorder.stopRecording()
        stopTimer()
    }
    
    func finishedRecording(notification: NSNotification) {
        let url = notification.userInfo!["url"] as? NSURL
        performSegueWithIdentifier("openPlaySoundsView", sender: url)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "openPlaySoundsView" {
            if let playSoundsVC = segue.destinationViewController as? PlaySoundsViewController {
                if let recordedAudioURL = sender as? NSURL {
                    playSoundsVC.recordedAudioURL = recordedAudioURL
                }
            }
        }
    }
    
}
