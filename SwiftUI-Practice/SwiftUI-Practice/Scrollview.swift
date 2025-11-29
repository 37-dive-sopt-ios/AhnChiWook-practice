//
//  Scrollview.swift
//  SwiftUI-Practice
//
//  Created by 안치욱 on 11/22/25.
//

import SwiftUI

struct Scrollview: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ZStack {
                    Circle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 120, height: 120)
                    
                    Image(systemName: "person.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.gray)
                }
                .padding(.top, 20)
                
                nameWithPosition
                ageAndMBTI
                    .padding(.bottom, 1000)
                hobby
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 70)
        }
        directMessageButton
            .frame(width: 350, height: 50, alignment: .center)
    }
    
    private var nameWithPosition: some View {
        HStack {
            Text("iOS")
                .font(.subheadline)
            Text("안치욱")
                .font(.headline)
                .foregroundStyle(.blue)
            Spacer()
            Text("파트웡")
                .foregroundStyle(.gray)
                .font(.subheadline)
        }
        .padding(.vertical, 2)
    }
    
    private var ageAndMBTI: some View {
        HStack {
            Text("00년생")
                .font(.subheadline)
            Spacer()
            Text("ENFP")
                .font(.subheadline)
                .foregroundStyle(.indigo)
        }
    }
    
    private var hobby: some View {
        Text("취미는 영상편집, 러닝, 카공 등")
    }
    
    private var directMessageButton: some View {
        Button {
            
        } label: {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.blue)
                .overlay {
                    Text("디엠 보내기")
                        .foregroundStyle(.white)
                }
        }
    }
}

#Preview { Scrollview() }
