//
//  Home.swift
//  HomeWork2.5month
//
//  Created by Aijan Saadatova on 20/6/24.
//

import UIKit

protocol HomeProtocol: AnyObject {
    
}

class Home: UIViewController, HomeProtocol {
    
    private lazy var homeBottomView = HomeBottomView()
    
    private lazy var totalAmountLabel = {
        let view = UILabel()
        view.text = "2,40,081c"
        view.textColor = .white
        view.font = .systemFont(ofSize: 28, weight: .bold)
        return view
    }()
    
    private var model: HomeModelProtocol
    
    init(model: HomeModelProtocol) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 28/255, green: 89/255, blue: 255/255, alpha: 1)
        setupConstraints()
        collectionConfigure()
    }
    
    private func collectionConfigure() {
        homeBottomView.horizontalCollectionView.register(
            A.self,
            forCellWithReuseIdentifier: A.reuseId)

        homeBottomView.horizontalCollectionView.delegate = self
        homeBottomView.horizontalCollectionView.dataSource = self
        
        homeBottomView.verticalCollectionView.register(
            B.self,
            forCellWithReuseIdentifier: B.reuseId)
        
        homeBottomView.verticalCollectionView.delegate = self
        homeBottomView.verticalCollectionView.dataSource = self
    }
    
    private func setupConstraints() {
        view.addSubview(homeBottomView)
        homeBottomView.translatesAutoresizingMaskIntoConstraints = false
        homeBottomView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250).isActive = true
        homeBottomView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        homeBottomView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        homeBottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        view.addSubview(totalAmountLabel)
        totalAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        totalAmountLabel.bottomAnchor.constraint(equalTo: homeBottomView.topAnchor, constant:   -100).isActive = true
        totalAmountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

extension Home: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == homeBottomView.horizontalCollectionView {
            return model.categories.count
        } else {
            return model.categories.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == homeBottomView.horizontalCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: A.reuseId, for: indexPath) as! A
            let elements = model.categories[indexPath.row]
            cell.setCustomCellData(with: elements)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: B.reuseId, for: indexPath) as! B
            let elements = model.categories[indexPath.row]
            cell.setCustomCellData(with: elements)
            return cell
        }
        
    }
}

extension Home: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == homeBottomView.horizontalCollectionView {
            return CGSize(width: (collectionView.frame.width / 3),
                          height: collectionView.frame.width / 3)
        } else {
            return CGSize(width: (collectionView.frame.width), height: 100)
        }
    }
}
