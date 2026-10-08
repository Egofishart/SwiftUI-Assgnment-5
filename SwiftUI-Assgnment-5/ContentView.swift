//
//  ContentView.swift
//  SwiftUI-Assgnment-5
//
//  Created by NikoDanelia on 06/10/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = MoodViewModel()
    @Namespace private var moodNamespace

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 25) {
                    
                    // 1. მზე
                    VStack {
                        Text("1. მზე")
                            .font(.headline)
                        
                        Circle()
                            .fill(viewModel.sunShining ? Color.yellow : Color.gray)
                            .frame(width: viewModel.sunShining ? 150 : 100, height: viewModel.sunShining ? 150 : 100)
                            .rotationEffect(.degrees(viewModel.sunShining ? 180 : 0))
                            .shadow(color: viewModel.sunShining ? .orange : .clear, radius: 10)
                        
                        Button(viewModel.sunShining ? "გამორთვა" : "ჩართვა") {
                            viewModel.toggleSun()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    
                    Divider()
                    
                    // 2. დღის რჩევა
                    VStack {
                        Text("2. დღის რჩევა")
                            .font(.headline)

                        if viewModel.showCard {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.blue)
                                    .frame(width: 200, height: 120)
                                
                                Text("დალიე წყალი 💧")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                            }
                            .transition(.move(edge: .top).combined(with: .opacity))
                        }
                            
                        Button(viewModel.showCard ? "დამალე" : "დღის რჩევა") {
                            viewModel.toggleCard()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    
                    Divider()
                    
                    // 3. განწყობა
                    VStack(spacing: 15) {
                        Text("3. განწყობის არჩევა")
                            .font(.headline)
                        
                        HStack(spacing: 20) {
                            ForEach(viewModel.emojis) { item in
                                ZStack {
                                    if viewModel.selectedEmojiID == item.id {
                                        Circle()
                                            .fill(Color.orange.opacity(0.3))
                                            .frame(width: 50, height: 50)
                                            .matchedGeometryEffect(id: "activeMood", in: moodNamespace)
                                    }
                                    
                                    Text(item.emote)
                                        .font(.system(size: 30))
                                }
                                .onTapGesture {
                                    viewModel.selectMood(id: item.id)
                                }
                            }
                        }
                        
                        if let selected = viewModel.selectedEmoji {
                            Text("დღეს ჩემი განწყობაა: \(selected.emote)")
                                .font(.title3)
                                .fontWeight(.bold)
                        } else {
                            Text("აირჩიე განწყობა")
                                .font(.title3)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("ჩემი განწყობა 😊")
        }
    }
}
#Preview {
    ContentView()
    
}
