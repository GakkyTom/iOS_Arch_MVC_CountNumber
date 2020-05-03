//
//  ViewController.swift
//  MVCPractice
//
//  Created by 板垣智也 on 2020/05/03.
//  Copyright © 2020 板垣智也. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // SceneDelegate(外部) から Model をもらう
    var myModel: Model? {
        didSet {
            registerModel()
        }
    }
    
    private(set) var myView: View = View()
    
    override func loadView() {
        view = myView
        view.backgroundColor = UIColor.init(hex: "DBE6FA")
    }
    
    deinit {
        myModel?.notificationCenter.removeObserver(self)
    }

    private func registerModel() {
        guard let model = myModel else { return }
        
        myView.label.text = model.count.description
        
        myView.minusButton.addTarget(self, action: #selector(onMinusTapped), for: .touchUpInside)
        myView.plusButton.addTarget(self, action: #selector(onPlusTapped), for: .touchUpInside)
        
        model.notificationCenter.addObserver(forName: .init(rawValue: "count"), object: nil, queue: nil) { [unowned self] notification in
            if let count = notification.userInfo?["count"] as? Int {
                self.myView.label.text = "\(count)"
            }
        }
    }
    
    @objc func onMinusTapped() {
        UIView.animate(withDuration: 0.1, animations: {
            self.myView.label.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        }) { (true) in
            UIView.animate(withDuration: 0.1) {
                self.myModel?.countDown()
                self.myView.label.transform = .identity
            }
        }
    }
    
    @objc func onPlusTapped() {
        UIView.animate(withDuration: 0.1, animations: {
            self.myView.label.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        }) { (true) in
            UIView.animate(withDuration: 0.1) {
                self.myModel?.countUp()
                self.myView.label.transform = .identity
            }
        }
    }

}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let v = Int("000000" + hex, radix: 16) ?? 0
        let r = CGFloat(v / Int(powf(256, 2)) % 256) / 255
        let g = CGFloat(v / Int(powf(256, 1)) % 256) / 255
        let b = CGFloat(v / Int(powf(256, 0)) % 256) / 255
        self.init(red: r, green: g, blue: b, alpha: min(max(alpha, 0), 1))
    }
}
