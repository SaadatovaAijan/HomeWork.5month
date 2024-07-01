//
//  HomeBottomView.swift
//  HomeWork2.5month
//
//  Created by Aijan Saadatova on 20/6/24.
//

import UIKit

class HomeBottomView: UIView {
    private lazy var analyticsLabel = {
        let view = UILabel()
        view.text = "Аналитика"
        view.textColor = .black
        view.font = .systemFont(ofSize: 20, weight: .bold)
        return view
    }()

    lazy var horizontalCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 25
        layout.sectionInset = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var lastLabel = {
        let view = UILabel()
        view.text = "Последнее"
        view.textColor = .black
        view.font = .systemFont(ofSize: 20, weight: .bold)
        return view
    }()
    
    lazy var verticalCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        layer.cornerRadius = 30
        backgroundColor = .white
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        addSubview(analyticsLabel)
        addSubview(horizontalCollectionView)
        addSubview(lastLabel)
        addSubview(verticalCollectionView)
        
        analyticsLabel.translatesAutoresizingMaskIntoConstraints = false
        horizontalCollectionView.translatesAutoresizingMaskIntoConstraints = false
        lastLabel.translatesAutoresizingMaskIntoConstraints = false
        verticalCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        analyticsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        analyticsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        //analyticsLabel.trailingAnchor.
        
        horizontalCollectionView.topAnchor.constraint(equalTo: analyticsLabel.bottomAnchor, constant: 10).isActive = true
        horizontalCollectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        horizontalCollectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        horizontalCollectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        lastLabel.topAnchor.constraint(equalTo: horizontalCollectionView.bottomAnchor, constant: 40).isActive = true
        lastLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
       
        verticalCollectionView.topAnchor.constraint(equalTo: lastLabel.bottomAnchor, constant: 10).isActive = true
        verticalCollectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        verticalCollectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        verticalCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
}
