//
//  BCell.swift
//  HomeWork2.5month
//
//  Created by Aijan Saadatova on 20/6/24.
//

import UIKit

class B: UICollectionViewCell {
    static var reuseId = "ver_cell"
    
    private let image: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "")
        view.contentMode = .scaleToFill
        view.layer.cornerRadius = 26
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
    
    private let label3: UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 18, weight: .bold)
        lbl.textColor = .black
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(image)
        addSubview(label)
        addSubview(label2)
        addSubview(label3)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
        label3.translatesAutoresizingMaskIntoConstraints = false
        
        image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        image.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        image.widthAnchor.constraint(equalToConstant: 50).isActive = true
        image.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20).isActive = true
        //label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        label2.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5).isActive = true
        label2.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20).isActive = true
        
        label3.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label3.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
    }
    
    func setCustomCellData(with elements: Content) {
        image.image = elements.imageV
        label.text = elements.sumLabel
        label2.text = elements.nameLabelV
        label3.text = elements.timeLabel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
