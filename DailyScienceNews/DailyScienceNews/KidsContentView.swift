//
//  KidsContentView.swift
//  DailyScienceNews
//
//  Created by Berat Rıdvan Asiltürk on 9.12.2023.
//

import SwiftUI
import AVFoundation

struct KidsContentView: View {
    
    @State private var player: AVPlayer?
    @StateObject private var audioPlayerManager = AudioPlayerManager()
    @State private var currentIndex = 0
    var contentInScienceForKids: Content
    @State var rotation: CGFloat = 0.0
    @State var offset = CGSize.zero
    @State var color: Color = .black
    
    var body: some View {
        
        ScrollView {
            VStack {
                ZStack{
                    // Snake animation
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 520, height: 220)
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.indigo]), startPoint: .top, endPoint: .bottom))
                        .rotationEffect(.degrees(rotation))
                        .mask {
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .stroke(lineWidth: 5)
                                .frame(width: 1310, height: 310)
                        }
                    
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 320, height: 120)
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.teal, Color.purple]), startPoint: .top, endPoint: .bottom))
                        .rotationEffect(.degrees(rotation))
                        .mask {
                            RoundedRectangle(cornerRadius: 50, style: .continuous)
                                .stroke(lineWidth: 3)
                                .frame(width: 310, height: 270)
                        }
                    
                    Image(contentInScienceForKids.headerImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                        .cornerRadius(12)
                }
                .padding()
                Spacer()
                
                VStack {
                    Text(contentInScienceForKids.baslik)
                        .frame(width: UIScreen.main.bounds.width * 0.95)
                        .font(.custom("Righteous-Regular", size: 20))
                        .padding(3)
                    
                    if let player = player {
                        // Ses kontrol düğmelerini içeren view
                        PlayerControls(player: player)
                    } else {
                        Text("Ses çalınacak dosyanın URL'sini belirtin.")
                    }
                }
                .padding()
            }
            .onAppear{
                let audioURL = Bundle.main.url(forResource: contentInScienceForKids.soundName, withExtension: "mp3")!
                player = AVPlayer(url: audioURL)
                
                withAnimation(.linear(duration: 8).repeatForever(autoreverses: false)) {
                    rotation = 360
                }
            }
            .offset(x: offset.width, y: offset.height * 0.4)
            .rotationEffect(.degrees(Double(offset.width / 60)))
            .navigationTitle(contentInScienceForKids.baslik)
        }
    }
}

struct KidsContentView_Previews: PreviewProvider {
    static var previews: some View {
        KidsContentView(contentInScienceForKids: Content(baslik: "1", icerik: "ICERIK", headerImage: "ana1", soundName: "", timer: "03:44"))
    }
}
