//
//  MoodViewModel.swift
//  SwiftUI-Assgnment-5
//
//  Created by NikoDanelia on 07/10/2026.
//
import SwiftUI

@Observable
class MoodViewModel {
    var sunShining = false
    var showCard = false
    var selectedEmojiID: UUID?
    
    var emojis: [Emoji] = [
        .init(emote: "😊"),
        .init(emote: "😢"),
        .init(emote: "😡"),
        .init(emote: "😴")
    ]
    
    var selectedEmoji: Emoji? {
        emojis.first(where: { $0.id == selectedEmojiID })
    }
    
    func toggleSun() {
        withAnimation(.easeInOut(duration: 0.5)) {
            sunShining.toggle()
        }
    }
    
    func toggleCard() {
        withAnimation {
            showCard.toggle()
        }
    }
    
    func selectMood(id: UUID) {
        withAnimation(.spring(response: 0.4)) {
            selectedEmojiID = id
        }
    }
}
