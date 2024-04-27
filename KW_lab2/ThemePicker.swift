//
//  ThemePicker.swift
//  KW_lab2
//
//  Created by student on 27/04/2024.
//

import SwiftUI

struct ThemePicker: View {
    @Binding var activeTheme: [String]
    @Binding var activeColor: Color
    
    var theme1 = ["😀", "😂", "🤣", "🙃", "😙", "🤨", "😀", "😂", "🤣", "🙃"]
    var theme2 = ["🍎", "🍏", "🍌", "🍇", "🍎", "🍏", "🍌", "🍇", "🍎", "🍏", "🍌", "🍇"]
    var theme3 = ["👩‍🎨", "👨", "👱‍♀️", "👷🏻‍♀️", "👮🏼‍♀️", "👩🏾", "👩‍🎨", "👨"]
    
    func shufle(emojiSet: [String]) -> [String] {
        var newSet: [String] = []
        for _ in 0..<emojiSet.count {
            let ogIndex = Int.random(in: 0..<emojiSet.count)
            newSet.append(emojiSet[ogIndex])
        }
        return newSet
    }
    
    func themeButton(text: String, icon: String, emojiSet: [String], color: Color) -> some View {
        return VStack {
            Image(systemName: icon)
            Text(text).font(.subheadline)
        }.padding(20)
            .onTapGesture {
                activeTheme = shufle(emojiSet: emojiSet)
                activeColor = color
            }
    }
    
    var body: some View {
        HStack {
            themeButton(text: "Theme 1", icon: "face.smiling.inverse", emojiSet: theme1, color: Color.blue)
            Spacer()
            themeButton(text: "Theme 2", icon: "apple.logo", emojiSet: theme2, color: Color.green)
            Spacer()
            themeButton(text: "Theme 3", icon: "person.fill", emojiSet: theme3, color: Color.red)

        }.foregroundColor(activeColor)
            .onAppear(perform: {
                activeTheme = theme1
                activeColor = Color.blue
            })
    }
}

#Preview {
    ThemePicker(activeTheme: .constant([""]),
                activeColor: .constant(.blue)
    )
}
