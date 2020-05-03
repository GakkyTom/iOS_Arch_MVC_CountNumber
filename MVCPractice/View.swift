//
//  View.swift
//  MVCPractice
//
//  Created by 板垣智也 on 2020/05/03.
//  Copyright © 2020 板垣智也. All rights reserved.
//

import UIKit

class View: UIView {
    
    let label = UILabel()
    let minusButton = UIButton()
    let plusButton = UIButton()
    let labelBackground = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 順番大事。先に addSubview をして constraints 設定しないと落ちる
        setSubView()
        setLayout()
    }
    
    // `init()` を override する場合は `required init?(code: NSCoder)` が必要
    required init?(coder: NSCoder) {
        return nil
    }
    
    private func setSubView() {
        addSubview(labelBackground)
        addSubview(label)
        addSubview(minusButton)
        addSubview(plusButton)
        
        label.textAlignment = .center
        label.textColor = UIColor.white
        
        labelBackground.backgroundColor = UIColor.init(hex: "3158C7")
        labelBackground.layer.cornerRadius = 10
        labelBackground.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        labelBackground.layer.shadowColor = UIColor.black.cgColor
        labelBackground.layer.shadowOpacity = 0.5
        
        minusButton.setTitle("-", for: .normal)
        plusButton.setTitle("+", for: .normal)
        
        minusButton.setTitleColor(UIColor.init(hex: "3158C7"), for: .normal)
        minusButton.setTitleColor(UIColor.init(hex: "7296DF"), for: .focused)

        plusButton.setTitleColor(UIColor.init(hex: "3158C7"), for: .normal)
        plusButton.setTitleColor(UIColor.init(hex: "7296DF"), for: .focused)
    }
    
    // 制約周りはこの記事がわかりやすい
    // https://www.avanderlee.com/swift/auto-layout-programmatically/
    // https://qiita.com/yucovin/items/4bebcc7a8b1088b374c9
    private func setLayout() {
        label.translatesAutoresizingMaskIntoConstraints = false
        labelBackground.translatesAutoresizingMaskIntoConstraints = false
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        
        let labelConstraints = [
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.widthAnchor.constraint(equalToConstant: 50),
            label.heightAnchor.constraint(equalToConstant: 50),
        ]
        
        let labelBackgroundConstraints = [
            labelBackground.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            labelBackground.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            labelBackground.widthAnchor.constraint(equalToConstant: 50),
            labelBackground.heightAnchor.constraint(equalToConstant: 50)
        ]

        let plusButtonConstraints = [
            plusButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            plusButton.leadingAnchor.constraint(equalTo: label.trailingAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 50),
            plusButton.heightAnchor.constraint(equalToConstant: 50)
        ]

        let minusButtonConstraints = [
            minusButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            minusButton.trailingAnchor.constraint(equalTo: label.leadingAnchor),
            minusButton.widthAnchor.constraint(equalToConstant: 50),
            minusButton.heightAnchor.constraint(equalToConstant: 50)
        ]

        NSLayoutConstraint.activate(labelConstraints)
        NSLayoutConstraint.activate(minusButtonConstraints)
        NSLayoutConstraint.activate(plusButtonConstraints)
        NSLayoutConstraint.activate(labelBackgroundConstraints)
    }
}
