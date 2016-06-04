//
//  PlaySoundsViewController.swift
//  pitch-perfect
//
//  Created by Amadeu Andrade on 30/04/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var audioPlayer: AudioPlayer!
    var recordedAudioURL: NSURL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        audioPlayer = AudioPlayer(recordedAudioURL: recordedAudioURL)
    }
    
    @IBAction func playSoundEffect(sender: UIButton) {
        if sender.tag == 0 {
            audioPlayer.playSound(rate: 0.5)
        } else if sender.tag == 1 {
            audioPlayer.playSound(rate: 1.5)
        } else if sender.tag == 2 {
            audioPlayer.playSound(pitch: 1000)
        } else if sender.tag == 3 {
            audioPlayer.playSound(pitch: -1000)
        } else if sender.tag == 4 {
            audioPlayer.playSound(echo: true)
        } else if sender.tag == 5 {
            audioPlayer.playSound(reverb: true)
        }
    }
    
    @IBAction func onStopPressed(sender: AnyObject) {
        audioPlayer.stopAudio()
    }
    
}

