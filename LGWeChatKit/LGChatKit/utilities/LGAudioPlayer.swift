//
//  LGAudioPlayer.swift
//  LGChatViewController
//
//  Created by Nikolai on 09/03/16.
//  Copyright © 2016 Nikolai. All rights reserved.
//

import UIKit
import AVFoundation

class LGAudioPlayer: NSObject, AVAudioPlayerDelegate {
    
    var audioPlayer: AVAudioPlayer!
    
    override init() {
        
    }
    
    func startPlaying(message: voiceMessage) {
        if (audioPlayer != nil && audioPlayer.playing) {
            stopPlaying()
        }
     
        let voiceData = NSData(contentsOfURL: message.voicePath)
    
        do {
            try audioPlayer = AVAudioPlayer(data: voiceData!)
        } catch{
            return
        }
        audioPlayer.delegate = self
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        } catch {
            // no-op
        }
        
        audioPlayer.play()
    }
    
    
    func stopPlaying() {
        audioPlayer.stop()
    }
}
