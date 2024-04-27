//
//  ContentView.swift
//  KW_lab2
//
//  Created by student on 27/04/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var noOfCards = 2
    
    var emoijs = ["😀", "😃", "😂", "🤣", "🥲", "☺️"]
    
    var body: some View {
        HStack {
            Text("Memo").font(.largeTitle)
        }
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))], content: {
                    ForEach(0..<noOfCards, id: \.self) { index in
                        CardView(content: emoijs[index])
                    }
                }).foregroundColor(.blue)
                
            }
            
            Spacer()
            
            HStack {
//                adjustCardNumber(by: -2, symbol: "minus.square")
                
                Spacer()
                
//                adjustCardNumber(by: 2, symbol: "plus.app")
            }.font(.largeTitle)
                
        }
        .padding()
    }
    
    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
        var disabled = offset + noOfCards < 2 || offset + noOfCards > emoijs.count
        
        return Button(action: {
            noOfCards += offset
        }, label: {
            Image(systemName: symbol)
        }).disabled(disabled)
            .foregroundColor(disabled ? .gray : .blue)
    }
}

#Preview {
    ContentView()
}
