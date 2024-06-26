//
//  CardView.swift
//  KW_lab2
//
//  Created by student on 27/04/2024.
//

import SwiftUI

struct CardView: View {
    var content: String
    @State var isFaceUp = true
    
    
    let base = RoundedRectangle(cornerRadius: 12)

    var body: some View {
        ZStack {
            base.fill()
            
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
        
        }
        .aspectRatio(CGSize(width: 2, height: 3), contentMode: .fill)
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    CardView(content: "😀")
}
