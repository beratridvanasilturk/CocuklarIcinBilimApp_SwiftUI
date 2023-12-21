//
//  ContentView.swift
//  DailyScienceNews
//
//  Created by Berat Rıdvan Asiltürk on 7.12.2023.
//

import SwiftUI

struct NewsView: View {
    
    @ObservedObject var newsViewModel = NewsViewModel()
    
    var body: some View {
        List {
            ForEach(newsViewModel.articleArray, id: \.self) { content in
                VStack {
                    //droplast & dropFirst: String karakteri silmede kullanildi
                    Text(content.publishedAt?.dropFirst(11).dropLast(4) ?? "")
                    Text(content.title ?? "")
                        .frame(width: UIScreen.main.bounds.width * 0.8, alignment: .leading)
                }
                .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
                .onTapGesture {
                    UIApplication.shared.open(URL(string: content.url ?? "")!)
                }
            }
        }
        .toolbar {
            Button("Yenile") {
                Task.init {
                    await newsViewModel.fetchData()
                }
            } .navigationTitle("Günlük Bilim Haberleri")
        }
        // onAppear await olmadigi icin task kullanildi
        .task {
            await newsViewModel.fetchData()
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
