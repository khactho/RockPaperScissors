//
//  ContentView.swift
//  day25
//
//  Created by Nguyễn Khắc Thơ on 16/05/2022.
//

import SwiftUI

struct customModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 100))
            .background(.yellow)
            .cornerRadius(25)
    }
}
struct ContentView: View {
    
    @State var yourPoints = 0
    @State var winOrLose = ["Win", "Lose"].shuffled()
    @State var Ott = ["✂️", "🔨", "🍁"].shuffled()
    @State var result = ""
    @State var showingScore = false
    @State var count = 0
    @State private var animationAmount1 = 0.0
    @State private var animationAmount2 = 0.0
    @State private var animationAmount3 = 0.0

    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.green, .mint]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                Spacer()
                Text("Rock Paper Scissors")
                    .font(.largeTitle)
                VStack {
                    Text(Ott[0])
                        .modifier(customModifier())
                    Text("You must: " + winOrLose[0])
                        .font(.title)
                        .padding(20)
                    HStack(spacing: 20) {
                        Button {
                            if Ott[0] == "🍁" && winOrLose[0] == "Win" {
                                yourPoints += 1
                                result = "Correct"
                            } else if Ott[0] == "🔨" && winOrLose[0] == "Lose" {
                                yourPoints += 1
                                result = "Correct"
                            } else {
                                result = "Wrong"
                            }
                            showingScore = true
                            askQuestion()
                            count+=1
                            if count > 10 {
                                count = 0
                                yourPoints = 0
                            }
                            withAnimation(.interpolatingSpring(stiffness: 5, damping: 10)) {
                                animationAmount1 += 360
                            }
                        } label: {
                            Text("✂️")
                        } .modifier(customModifier())
                            .alert(result, isPresented: $showingScore) {
                                Button("Continue", action: askQuestion)
                            } message: {
                                Text("Your score is \(yourPoints)")
                            }
                            .rotation3DEffect(.degrees(animationAmount1), axis: (x: 0, y: 1, z: 0))

                        Button {
                            if Ott[0] == "✂️" && winOrLose[0] == "Win" {
                                yourPoints += 1
                                result = "Correct"
                            } else if Ott[0] == "🍁" && winOrLose[0] == "Lose" {
                                yourPoints += 1
                                result = "Correct"
                            } else {
                                result = "Wrong"
                            }
                            showingScore = true
                            askQuestion()
                            count+=1
                            if count > 10 {
                                count = 0
                                yourPoints = 0
                            }
                            withAnimation(.interpolatingSpring(stiffness: 5, damping: 10)) {
                                animationAmount2 += 360
                            }
                        } label: {
                            Text("🔨")
                        } .modifier(customModifier())
                            .alert(result, isPresented: $showingScore) {
                                Button("Continue", action: askQuestion)
                            } message: {
                                Text("Your score is \(yourPoints)")
                            }
                            .rotation3DEffect(.degrees(animationAmount2), axis: (x: 0, y: 1, z: 0))
                        Button {
                            if Ott[0] == "🔨" && winOrLose[0] == "Win" {
                                yourPoints += 1
                                result = "Correct"
                            } else if Ott[0] == "✂️" && winOrLose[0] == "Lose" {
                                yourPoints += 1
                                result = "Correct"
                            } else {
                                result = "Wrong"
                            }
                            showingScore=true
                            askQuestion()
                            count+=1
                            if count > 10 {
                                count = 0
                                yourPoints = 0
                            }
                            withAnimation(.interpolatingSpring(stiffness: 5, damping: 10)) {
                                animationAmount3 += 360
                            }
                        } label: {
                            Text("🍁")
                        } .modifier(customModifier())
                            .alert(result, isPresented: $showingScore) {
                                Button("Continue", action: askQuestion)
                            } message: {
                                Text("Your score is \(yourPoints)")
                            }
                            .rotation3DEffect(.degrees(animationAmount3), axis: (x: 0, y: 1, z: 0))
                        
                    }
                } .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                Spacer()
                Text("Your points: \(yourPoints) / \(count)")
                    .font(.largeTitle)
                Text("Turn: \(count) / 10")
                    .font(.title)
                Spacer()
                Spacer()
                
                
            } .padding()
        }
    }
    func askQuestion() {
        winOrLose = winOrLose.shuffled()
        Ott = Ott.shuffled()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
