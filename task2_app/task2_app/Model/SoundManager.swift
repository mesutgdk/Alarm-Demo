//
//  SoundManager.swift
//  task2_app
//
//  Created by Mesut Gedik on 30.08.2023.
//

import AVFoundation
import UIKit

final class SoundManager {
    static let shared = SoundManager()
    
    var player: AVAudioPlayer?
    var volumeTimer: Timer?
    let maxVolume: Float = 1.0
    let duration: TimeInterval = 30.0
    
    private init() {
    }
    
    func playAlarmSound() {
        guard let audioFilePath = Bundle.main.path(forResource: "wakeup", ofType: "mp3") else {
            return
        }
        
        let audioFileURL = URL(fileURLWithPath: audioFilePath)
        
        do {
            player = try AVAudioPlayer(contentsOf: audioFileURL)
            player?.volume = 0.3
            player?.setVolume(maxVolume, fadeDuration: duration)
            player?.prepareToPlay()
            player?.play()
        } catch {
            print("Error playing alarm sound: \(error.localizedDescription)")
        }
    }

    func stopAlarmSound(){
        player?.stop()
    }


}


