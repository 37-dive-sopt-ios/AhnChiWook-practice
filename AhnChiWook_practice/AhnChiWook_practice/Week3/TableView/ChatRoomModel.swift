//
//  ChatRoomModel.swift
//  AhnChiWook_practice
//
//  Created by 안치욱 on 11/1/25.
//


import UIKit

struct ChatRoomModel {
    let profileImage: UIImage?
    let name: String
    let location: String
    let lastMessage: String
    let thumbnail: UIImage?
    
    static let mockData: [ChatRoomModel] = [
        ChatRoomModel(profileImage: UIImage(named: "Profile1"), name: "이명진", location: "대한민국", lastMessage: "확인했습니다 감사합니다 :)", thumbnail: UIImage(named: "Item1")),
        ChatRoomModel(profileImage: UIImage(named: "Profile2"), name: "신혜연", location: "일본", lastMessage: "넵 수고하세용 ㅋ", thumbnail: UIImage(named: "Item2")),
        ChatRoomModel(profileImage: UIImage(named: "Profile3"), name: "안치욱", location: "중국", lastMessage: "니 하오마....", thumbnail: UIImage(named: "Item3")),
        ChatRoomModel(profileImage: UIImage(named: "Profile4"), name: "선영주", location: "미국", lastMessage: "오빠 나 미미나 힘들어.", thumbnail: UIImage(named: "Item4")),
        ChatRoomModel(profileImage: UIImage(named: "Profile5"), name: "이나연", location: "프랑스", lastMessage: "네.", thumbnail: UIImage(named: "Item5")),
        ChatRoomModel(profileImage: UIImage(named: "Profile6"), name: "김나연", location: "영국", lastMessage: "김나연님이 이모티콘을 보냈어요.", thumbnail: UIImage(named: "Item6")),
        ChatRoomModel(profileImage: UIImage(named: "Profile1"), name: "이서현", location: "독일", lastMessage: "이서현님이 이모티콘을 보냈어요.", thumbnail: UIImage(named: "Item7")),
        ChatRoomModel(profileImage: UIImage(named: "Profile2"), name: "조영서", location: "이탈리아", lastMessage: "옷 예쁘네요! 얼마죠?", thumbnail: UIImage(named: "Item8")),
        ChatRoomModel(profileImage: UIImage(named: "Profile3"), name: "박정환", location: "스페인", lastMessage: "네고좀 해주세요.", thumbnail: UIImage(named: "Item9")),
        ChatRoomModel(profileImage: UIImage(named: "Profile4"), name: "진소은", location: "캐나다", lastMessage: "감사합니다! 조심하가세요~!", thumbnail: UIImage(named: "Item10"))
    ]
}
