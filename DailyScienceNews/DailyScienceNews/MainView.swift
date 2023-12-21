//
//  MainView.swift
//  DailyScienceNews
//
//  Created by Berat Rıdvan Asiltürk on 9.12.2023.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        if #available(iOS 17.0, *) {
            MainViewiOS17()
        } else if #available(iOS 15.0, *) {
            MainViewiOS15()
        }
    }
}

struct Model: Identifiable, Hashable, Codable {
    var title: String
    var id = UUID()
}

@available(iOS 15.0, *)
struct MainViewiOS15: View {
    
    @State var items : [Model] = [
        Model(title: "Günlük Bilim Haberleri"),
        Model(title: "Çocuklar İçin Bilim"),
    ]
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Günlük Bilim Haberleri") {
                    NewsView()
                        .navigationTitle("Günlük Bilim Haberleri")
                }
                NavigationLink("Çocuklar İçin Bilim") {
                    ScienceContentsForKids()
                        .navigationTitle("Çocuklar İçin Bilim")
                }
            }
            .navigationTitle("Günlük Bilim")
        }
    }
}

@available(iOS 17.0, *)
struct MainViewiOS17: View {
    
    @State var items : [Model] = [
        Model(title: "Günlük Bilim Haberleri"),
        Model(title: "Çocuklar İçin Bilim"),
    ]
    
    let colors : [Color] = [.red, .orange, .teal, .yellow, .gray, .indigo, .black, .accentColor,.blue,.brown,.cyan,.green,.mint,.pink,.purple]
    private let adaptiveColumns = [ GridItem(.adaptive(minimum: 170))]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 13) {
                    ForEach(items) { item in
                        NavigationLink(value: item) {
                            ZStack{
                                RoundedRectangle(cornerRadius: 22)
                                    .frame(width: 170, height: 170)
                                    .foregroundColor(colors.randomElement() )
                                Text(item.title)
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .lineLimit(3)
                                    .multilineTextAlignment(.center)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Günlük Bilim")
            
            .navigationDestination(for: Model.self) { item in
                if item.title.contains("Günlük Bilim Haberleri") {
                    NewsView()
                } else if item.title.contains("Çocuklar İçin Bilim") {
                    ScienceContentsForKids()
                        .navigationTitle("Çocuklar İçin Bilim")
                }
            }
            .padding(.horizontal, 12)
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
