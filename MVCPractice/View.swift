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
        
        addSubview(label)
        addSubview(minusButton)
        addSubview(plusButton)
        
        label.textAlignment = .center
        
        label.backgroundColor = .blue
        minusButton.backgroundColor = .red
        plusButton.backgroundColor = .green

        minusButton.setTitle("-1", for: .normal)
        plusButton.setTitle("+1", for: .normal)
    }
    
    private func setLayout() {
        label.translatesAutoresizingMaskIntoConstraints = false
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        
        label.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: minusButton.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: plusButton.topAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: minusButton.heightAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: plusButton.heightAnchor).isActive = true
        
        minusButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        plusButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        minusButton.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        minusButton.rightAnchor.constraint(equalTo: plusButton.leftAnchor).isActive = true
        plusButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        minusButton.widthAnchor.constraint(equalTo: plusButton.widthAnchor).isActive = true
        
    }
}
