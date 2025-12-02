//
//  ChatssViewController.swift
//  AhnChiWook_practice
//
//  Created by 안치욱 on 11/1/25.
//

import UIKit

import SnapKit
import Then

final class ChatssViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    private var chatssRooms: [ChatssRoomModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        register()
        setDelegate()
        loadMockData()
    }
    
    private func setUI() {
        view.backgroundColor = .white
        title = "채팅"
        tableView.separatorStyle = .singleLine
    }
    
    private func setLayout() { // -- 3번
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func register() {
        tableView.register(ChatssTableViewCell.self, forCellReuseIdentifier: ChatssTableViewCell.identifier)
    }
    
    private func setDelegate() { // 누구한테 짬 때릴건지 채택!
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func loadMockData() {
        chatssRooms = ChatssRoomModel.mockData
        tableView.reloadData()
    }
}

extension ChatssViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(chatssRooms[indexPath.row].name) 채팅방 선택됨")
    }
    
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

// MARK: - UITableViewDataSource

extension ChatssViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatssTableViewCell.identifier, for: indexPath) as? ChatssTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configuress(with: chatssRooms[indexPath.row])
        return cell
    }
}
