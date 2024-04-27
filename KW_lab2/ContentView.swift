//
//  ContentView.swift
//  KW_lab2
//
//  Created by student on 27/04/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var noOfCards = 2
    
    @State var emoijs: [String] = []
    @State var activeColor: Color = Color.blue
    
    var body: some View {
        HStack {
            Text("Memo").font(.largeTitle)
        }
        VStack {
//            displayCards(cardCount: noOfCards, emojis: emoijs)
            displayCards(cardCount: emoijs.count, emojis: emoijs)

            Spacer()
            
            ThemePicker(activeTheme: $emoijs, activeColor: $activeColor)
            
//            HStack {
//                adjustCardNumber(by: -2, symbol: "minus.square")
//                Spacer()
//                adjustCardNumber(by: 2, symbol: "plus.app")
//            }.font(.largeTitle)
                
        }
        .foregroundColor(activeColor)
        .padding()
    }
    
    func displayCards(cardCount: Int, emojis: [String]) -> some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], content: {
                ForEach(0..<cardCount, id: \.self) { index in
                    CardView(content: emojis[index])
                }
            })
            
        }
    }
    
    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
        let disabled = offset + noOfCards < 2 || offset + noOfCards > emoijs.count
        
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
