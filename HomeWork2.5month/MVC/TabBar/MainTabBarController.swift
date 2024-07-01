//
//  MainTabBarController.swift
//  HomeWork2.5month
//
//  Created by Aijan Saadatova on 20/6/24.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private lazy var mainTabBar: MainTabBar = {
        let view = MainTabBar()
        view.setup(backgroundColor: .white, images: ["house", "plus.circle", "person"])
        view.delegate = self
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tabBar.isHidden = true
        setupConstraints()
        configureViewControllers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    private func setupConstraints() {
        view.addSubview(mainTabBar)
        mainTabBar.translatesAutoresizingMaskIntoConstraints = false
        mainTabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainTabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainTabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainTabBar.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    private func configureViewControllers() {
        let categories = HomeModel.shared.categories
        let homeModel = HomeModel.shared
        let homeView = Home(model: homeModel)
        homeView.title = "Home"
        let vc1 = UINavigationController(rootViewController: homeView)
        
        let expendsAddView = ExpendsAddView()
        expendsAddView.title = "Expends"
        let vc2 = UINavigationController(rootViewController: expendsAddView)
        
        let profileView = ProfileView()
        profileView.title = "Profile"
        let vc3 = UINavigationController(rootViewController: profileView)
        
        viewControllers = [vc1, vc2, vc3]
    }
    
}

extension MainTabBarController: MainTabBarDelegate {
    func didTabButtonTap(tag: Int) {
        selectedIndex = tag
    }
}
