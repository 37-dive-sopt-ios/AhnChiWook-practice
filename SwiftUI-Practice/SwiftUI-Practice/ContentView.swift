//
//  ContentView.swift
//  SwiftUI-Practice
//
//  Created by 안치욱 on 11/22/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                
                Spacer()
                
                Text("안녕")
                    .background(.blue)
                
                Spacer()
                
                Text("나는 치욱")
                    .background(.green)
                
                Spacer()
            }
            
            Spacer()
            
            HStack {
                
                Spacer()
                
                Text("오늘은 솝커톤")
                    .background()
                
                Spacer()
                
                Text("하는 날~")
                    .background()
                
                Spacer()
                    
            }
            
            Spacer()
            
            HStack {
                Spacer()
                
                Rectangle()
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
                    .foregroundColor(.green)
                
                Spacer()
                
                Rectangle()
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
                    .foregroundColor(.blue)
                
                Spacer()
            }
        }
        .padding()
        .background(.black)
    }
}

#Preview {
    ContentView()
}
