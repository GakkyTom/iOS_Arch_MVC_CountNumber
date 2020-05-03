//
//  ViewController.swift
//  MVCPractice
//
//  Created by 板垣智也 on 2020/05/03.
//  Copyright © 2020 板垣智也. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myModel: Model? {
        didSet {
            registerModel()
        }
    }
    
    private(set) var myView: View = View()
    
    override func loadView() {
        view = myView
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//    }
    
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
        myModel?.countDown()
    }
    
    @objc func onPlusTapped() {
        myModel?.countUp()
    }

}

