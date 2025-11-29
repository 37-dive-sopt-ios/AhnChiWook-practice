//
//  ChatRow.swift
//  SwiftUI-Practice
//
//  Created by 안치욱 on 11/22/25.
//

import SwiftUI

struct ChatRow: View {
    let chatRoom: ChatRoomModel
    
    var body: some View {
        HStack {
            if let profileImage = chatRoom.profileImage {
                profileImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .padding(8)
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.gray)
                    .padding(8)
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text(chatRoom.name)
                        .bold()
                    
                    Text(chatRoom.location)
                        .font(Font.caption2)
                        .foregroundColor(.gray)
                        
                }
                Text(chatRoom.lastMessage)
                    .font(Font.caption)
            }
            Spacer()
            
            chatRoom.thumbnail
                .padding(16)
        }
    }
}

