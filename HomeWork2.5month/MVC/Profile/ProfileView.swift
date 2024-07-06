//
//  ProfileView.swift
//  HomeWork2.5month
//
//  Created by Aijan Saadatova on 20/6/24.
//

import UIKit

class Test {
    init() {
              //Создает объект и хранит в памяти
    }
}

class ProfileView: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupNavigationItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            if UserDefaults.standard.bool(forKey: "darkTheme") == false {
                view.overrideUserInterfaceStyle = .light
            } else {
                view.overrideUserInterfaceStyle = .dark
            }
            
        }
    
    private func setupNavigationItem() {
        let settingsButton = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(settingsButtonTapped))
        navigationItem.rightBarButtonItem = settingsButton
    }
    
    @objc func settingsButtonTapped() {
        let settingsView = SettingsView()
        navigationController?.pushViewController(settingsView, animated: true)
    }
    
    deinit {
        print("ProfileView is deinitialized")
    }
    
}
