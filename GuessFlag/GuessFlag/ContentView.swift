//
//  ContentView.swift
//  GuessFlag
//
//  Created by Chommanee Rujijanakul on 15/11/2566 BE.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var userScore = 0
    @State private var round = 0
    
    var body: some View {
        
        ZStack{
            LinearGradient(colors: [.indigo,.black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 30){
                VStack {
                    Text("Tap the flag of")
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .font(.largeTitle.weight(.semibold))
                        
                }.foregroundColor(.white)
                
                ForEach(0..<3){number in
                    Button{
                        flagTapped(number)
                    }label: {
                        Image(countries[number])
                            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                            .shadow(radius: 20)
                    }
                }
                
                Text("Your Score is \(userScore)")
                    .foregroundColor(.white)
                    .font(.headline.weight(.heavy))
                
                
            }
        }
        .alert("Finish", isPresented: $showingScore){
            Button("Continue", action: askQ)
        } message: {
            Text("Your score is \(userScore)")
        }
    }
    
    func flagTapped (_ number : Int){
        if number == correctAnswer {
            userScore += 1
            
        }
        askQ()
        if round == 5{
            showingScore = true
        }
        round += 1
        
    }
    
    func askQ (){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
