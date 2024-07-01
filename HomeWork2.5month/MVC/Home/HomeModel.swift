//
//  HomeModel.swift
//  HomeWork2.5month
//
//  Created by Aijan Saadatova on 20/6/24.
//

import UIKit

struct Content {
    var imageH: UIImage
    var numberLabel: String
    var nameLabel: String
    
    var imageV: UIImage
    var sumLabel: String
    var nameLabelV: String
    var timeLabel: String
}

protocol HomeModelProtocol {
    var categories: [Content] { get }
}

class HomeModel: HomeModelProtocol {
    
    static let shared = HomeModel()
    
    var categories: [Content]
    
    private init() {
        self.categories = [
            Content(imageH: UIImage(resource: .imageH5), numberLabel: "235", nameLabel: "неман", imageV: UIImage(resource: .person), sumLabel: "1234", nameLabelV: "Eric", timeLabel: "21:09"),
            Content(imageH: UIImage(resource: .imageH2), numberLabel: "766", nameLabel: "газпром", imageV: UIImage(resource: .imageH3), sumLabel: "679", nameLabelV: "Globus", timeLabel: "09:21"),
            Content(imageH: UIImage(resource: .imageH3), numberLabel: "345", nameLabel: "глобус", imageV: UIImage(resource: .person2), sumLabel: "100", nameLabelV: "Anna", timeLabel: "13:54"),
            Content(imageH: UIImage(resource: .imageH4), numberLabel: "76543", nameLabel: "билайн", imageV: UIImage(resource: .person5), sumLabel: "346", nameLabelV: "liza", timeLabel: "11:29"),
            Content(imageH: UIImage(resource: .imageH), numberLabel: "4345", nameLabel: "шоро", imageV: UIImage(resource: .person4), sumLabel: "8800", nameLabelV: "Alex", timeLabel: "17:00"),
        ]
    }
}
