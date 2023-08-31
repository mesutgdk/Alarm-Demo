//
//  SoundManager.swift
//  task2_app
//
//  Created by Mesut Gedik on 30.08.2023.
//

import AVFoundation

final class SoundManager {
    static let shared = SoundManager()
    
    private var audioPlayer: AVAudioPlayer?
    
    private init() {
    }
    
    func playAlarmSound() {
        guard let audioFilePath = Bundle.main.path(forResource: "wakeup", ofType: "mp3") else {
            fatalError("Could not find the path")
        }
        
        let audioFileURL = URL(fileURLWithPath: audioFilePath)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioFileURL)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("Error playing alarm sound: \(error.localizedDescription)")
        }
    }
    
    func stopAlarmSound() {
        audioPlayer?.stop()
    }
}

