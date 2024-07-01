//
//  MainTabBar.swift
//  HomeWork2.5month
//
//  Created by Aijan Saadatova on 20/6/24.
//

import UIKit
protocol MainTabBarDelegate: AnyObject {
    func didTabButtonTap(tag: Int)
}

class MainTabBar: UIView {
    
    private var images: [String] = []
    
    weak var delegate: MainTabBarDelegate?
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 10
        view.distribution = .fillEqually
        view.alignment = . center
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    func setup(backgroundColor: UIColor, images: [String]) {
        self.images = images
        self.backgroundColor = backgroundColor
        for i in 0...images.count - 1 {
            let button = createButton(image: images[i])
            button.tag = i
            button.addTarget(self, action: #selector(tabButtonTapped), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tabButtonTapped(sender: UIButton) {
        delegate?.didTabButtonTap(tag: sender.tag)
    }
    
    private func setupConstraints() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true

    }
}
func createButton(image: String) -> UIButton {
    let view = UIButton (type: .system)
    view.setImage(UIImage(systemName: image), for: .normal)
    view.tintColor = .black
    return view
}
