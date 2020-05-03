//
//  Model.swift
//  MVCPractice
//
//  Created by 板垣智也 on 2020/05/03.
//  Copyright © 2020 板垣智也. All rights reserved.
//
import Foundation
class Model {
    let notificationCenter = NotificationCenter()
    
    // setterだけをprivate にしている（getterはpublic）
    // 参考: https://qiita.com/codelynx/items/43e1c4f176730d952d13
    private(set) var count = 0 {
        didSet {
            notificationCenter.post(name: .init("count"),
                                    object: nil,
                                    userInfo: ["count": count])
        }
    }
    
    func countDown() {
        count -= 1
    }
    
    func countUp() {
        count += 1
    }
}
