//
//  ExpendsAddView.swift
//  HomeWork2.5month
//
//  Created by Aijan Saadatova on 20/6/24.
//

import UIKit

class ExpendsAddView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
}

protocol ExpendsTabbarControllerDelegate: AnyObject {
    func didAppTap()
}
