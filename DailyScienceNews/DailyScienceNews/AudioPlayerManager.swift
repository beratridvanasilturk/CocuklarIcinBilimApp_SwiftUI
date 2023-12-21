//
//  AudioPlayerManager.swift
//  DailyScienceNews
//
//  Created by Berat Rıdvan Asiltürk on 9.12.2023.
//

import SwiftUI
import AVFoundation

// CocuklarIcınBılım icerisindeki player icin kullanildi
class AudioPlayerManager: ObservableObject {
    
    private var audioPlayer: AVAudioPlayer!
    var contentInScienceForKidsView: Content?
    
    init() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [.mixWithOthers, .allowAirPlay])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to configure AVAudioSession: \(error.localizedDescription)")
        }
    }
    
    func play(url: URL) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
        }
    }
    
    func pause() {
        audioPlayer?.pause()
    }
    
    func stop() {
        audioPlayer?.stop()
        audioPlayer = nil
    }
}
