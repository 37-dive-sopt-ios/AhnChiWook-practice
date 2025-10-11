//
//  ViewController.swift
//  AhnChiWook_practice
//
//  Created by 안치욱 on 10/11/25.
//

//import UIKit
// 
//class ViewController: UIViewController {
//    
//    private let testLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Hello World!"
//        label.textColor = .black
//        label.font = .systemFont(ofSize: 15)
//        label.clipsToBounds = true
//        return label
//    }()
// 
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setUI()
//        setLayout()
//    }
//    
//    private func setUI() {
//        view.addSubview(testLabel)
//        view.backgroundColor = .yellow
//    }
//    
//    private func setLayout() {
//        testLabel.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint.activate([
//            testLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            testLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150)
//        ])
//    }
//}

import UIKit
 
class ViewController: UIViewController {
    private var redView: UIView = {
        var view = UIView(frame: CGRect(origin: CGPoint(x: 100, y: 200),
                                        size: CGSize(width: 100, height: 100)))
        view.backgroundColor = .red
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(redView)
        print("frame: \(self.redView.frame)\nbounds: \(self.redView.bounds)")
    }
}

