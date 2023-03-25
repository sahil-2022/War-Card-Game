//
//  ContentView.swift
//  War Card Game
//
//  Created by Sahil Prajapati on 11/02/23.
//

import SwiftUI

struct ContentView: View {
    @State var playerCard="card7"
    @State var cpuCard="card13"
    
    @State var playerScore=0
    @State var cpuScore=0
    var body: some View {
        
        ZStack {
            
         Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                
                Button {
                    deal()
                } label: {
                    Image("button")
                }

                
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                            
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    Button {
                        refresh()
                    } label: {
                       Image(systemName: "arrow.clockwise")              }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    
                }.foregroundColor(.white)
                Spacer()
                
            }
        }
        
    }
    
    func deal(){
        //Randomize the player card
        let playerCardValue=Int.random(in: 2...14)
        playerCard="card"+String(playerCardValue)
        //Randomize the cpu card
        let cpuCardValue=Int.random(in: 2...14)
        cpuCard="card"+String(cpuCardValue)
        //update the score
        if playerCardValue > cpuCardValue
        {
            //Add 1 to player cards
            
            playerScore += 1
        }
        else if cpuCardValue > playerCardValue{
            //Add 1 to cpu cards
            cpuScore += 1
        }
    
    }
    func refresh(){
        playerScore=0
        cpuScore=0
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
