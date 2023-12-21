//
//  AudioPlayerView.swift
//  DailyScienceNews
//
//  Created by beratridvanasilturk on 21.12.2023.
//

import SwiftUI
import AVFoundation

struct PlayerControls: View {
    var player: AVPlayer
    
    var body: some View {
        VStack {
            // Ses kontrol düğmeleri
            HStack {
                Button(action: {
                    // Geri sarma
                    let forwardTime = CMTime(seconds: 10, preferredTimescale: 1)
                    
                    // AVPlayer'ı kullanarak ileri sarma işlemi gerçekleştirin
                    player.seek(to: (player.currentTime()) - forwardTime)
                }) {
                    Image("tenleft")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: 50, maxHeight: 50)
                }
                .padding()
                
                Button(action: {
                    
                    // Duraklat veya oynat
                    if player.timeControlStatus == .playing {
                        player.pause()
                    } else {
                        player.play()
                    }
                }) {
                    Image("pause-play")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: 80, maxHeight: 80)
                }
                .padding()
                
                Button(action: {
                    // İleri sarma
                    let forwardTime = CMTime(seconds: 10, preferredTimescale: 1)
                    
                    // AVPlayer'ı kullanarak ileri sarma işlemi gerçekleştirin
                    player.seek(to: (player.currentTime()) + forwardTime)
                }) {
                    Image("tenright")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: 50, maxHeight: 50)
                }
                .padding()
            }
        }
    }
}

