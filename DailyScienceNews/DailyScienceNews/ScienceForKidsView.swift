//
//  ScienceForKidsView.swift
//  DailyScienceNews
//
//  Created by Berat Rıdvan Asiltürk on 9.12.2023.
//
import SwiftUI

struct Content: Identifiable, Hashable, Codable {
    var id = UUID()
    var baslik: String
    var icerik: String
    var headerImage: String
    var soundName: String
    var timer:String
}

struct ScienceContentsForKids: View {
    
    var contentsHeader: [Content] = [ Content(baslik: "Bakteri Nedir?", icerik: "", headerImage: "Bakteri Nedir?", soundName: "Bakteri Nedir?", timer: ""),
                                      Content(baslik: "Beyin Nedir ve Nasıl Çalışır?", icerik: "", headerImage: "Beyin Nedir ve Nasıl Çalışır?", soundName: "Beyin Nedir ve Nasıl Çalışır?", timer: ""),
                                      Content(baslik: "Mikroorganizmalar Bakteriler Virüsler", icerik: "", headerImage: "Mikroorganizmalar Bakteriler Virüsler", soundName: "Mikroorganizmalar Bakteriler Virüsler", timer: ""),
                                      Content(baslik: "Pi Sayısı (π)", icerik: "", headerImage: "Pi Sayısı (π)", soundName: "Pi Sayısı (π)", timer: ""),
                                      Content(baslik: "Geometride Çevre Nedir?", icerik: "", headerImage: "Geometride Çevre Nedir?",soundName: "Geometride Çevre Nedir?", timer: ""),
                                      Content(baslik: "Su Yaşam Alanları", icerik: "", headerImage: "Su Yaşam Alanları", soundName: "Su Yaşam Alanları", timer: ""),
                                      Content(baslik: "Nasıl Tat Alırız?", icerik: "", headerImage: "Nasıl Tat Alırız?", soundName: "Nasıl Tat Alırız?", timer: ""),
                                      Content(baslik: "Virüs Ve Bakteri Farklılıkları", icerik: "", headerImage: "Virüs Ve Bakteri Farklılıkları", soundName: "Virüs Ve Bakteri Farklılıkları", timer: ""),
                                      Content(baslik: "Görme Duyusu", icerik: "", headerImage: "Görme Duyusu", soundName: "Görme Duyusu", timer: ""),
                                      Content(baslik: "Koku Alma Duyusu", icerik: "", headerImage: "Koku Alma Duyusu",soundName: "Koku Alma Duyusu", timer: ""),
                                      Content(baslik: "Dokunma Duyusu", icerik: "", headerImage: "Dokunma Duyusu",  soundName: "Dokunma Duyusu", timer: ""),
                                      Content(baslik: "Karbonhidratlar Nelerdir?", icerik: "", headerImage: "Karbonhidratlar Nelerdir?",  soundName: "Karbonhidratlar Nelerdir?", timer: ""),
                                      Content(baslik: "Proteinler Nelerdir?", icerik: "", headerImage: "Proteinler Nelerdir?", soundName: "Proteinler Nelerdir?", timer: ""),
                                      Content(baslik: "Atmosfer - Dünyanın Katmanları", icerik: "", headerImage: "Atmosfer - Dünyanın Katmanları",  soundName: "Atmosfer - Dünyanın Katmanları", timer: "")
    ]
    
    var body: some View {
        List(contentsHeader) { hikaye in
            NavigationLink(destination: KidsContentView(contentInScienceForKids: hikaye)) {
                VStack {
                    ZStack{
                        Image(hikaye.headerImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 160)
                            .clipped()
                    }
                    Text(hikaye.baslik)
                        .fontWeight(.bold)
                        .font(.custom("Righteous-Regular", size: 18))
                        .padding(20)
                }
                // Arkaplandaki rengi hucrenin belirginligini artirir
                .background(Color.purple.opacity(0.2))
                .cornerRadius(40)
            }
        }
        .listStyle(.inset)
    }
}

struct ScienceContentsForKids_Previews: PreviewProvider {
    static var previews: some View {
        ScienceContentsForKids()
    }
}
