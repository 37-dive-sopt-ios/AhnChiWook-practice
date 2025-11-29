//
//  ChatList.swift
//  SwiftUI-Practice
//
//  Created by 안치욱 on 11/22/25.
//

import SwiftUI

struct ChatList: View {
    let chatRooms: [ChatRoomModel]

    var body: some View {
        List(chatRooms) { chatRoom in
            ChatRow(chatRoom: chatRoom)
                .listRowInsets(EdgeInsets()) // inset 타이트하게 맞춰줍니다.
                .listRowSeparator(.visible) // 구분선 보이게 함
        }
        .listStyle(.plain) // 기본 스타일
    }
}

#Preview {
    ChatList(chatRooms: ChatRoomModel.mockData)
}
