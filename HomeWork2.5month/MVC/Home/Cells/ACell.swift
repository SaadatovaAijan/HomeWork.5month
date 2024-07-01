//
//  ACell.swift
//  HomeWork2.5month
//
//  Created by Aijan Saadatova on 20/6/24.
//

import UIKit

class A: UICollectionViewCell {
    
    static var reuseId = "hor_cell"
    
    private let image: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "")
        view.contentMode = .scaleToFill
        view.layer.cornerRadius = 27
        view.layer.masksToBounds = true
        return view
    }()
    
    private let label: UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 18, weight: .bold)
        lbl.textColor = .black
        return lbl
    }()
    
    private let label2: UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 14, weight: .bold)
        lbl.textColor = .systemGray
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(image)
        addSubview(label)
        addSubview(label2)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
        
        image.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        image.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        image.widthAnchor.constraint(equalToConstant: 60).isActive = true
        image.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        label2.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5).isActive = true
        label2.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        label2.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }

    func setCustomCellData(with elements: Content) {
        image.image = elements.imageH
        label.text = elements.numberLabel
        label2.text = elements.nameLabel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

