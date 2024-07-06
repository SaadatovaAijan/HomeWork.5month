//
//  SettingsController.swift
//  HomeWork2.5month
//
//  Created by Aijan Saadatova on 30/6/24.
//
import UIKit

protocol SettingsControllerToViewProtocol: AnyObject {
    
}

protocol SettingsControllerToModelProtocol: AnyObject {
    
}

class SettingsController {
  
    private weak var view: SettingsViewProtocol?
    private var model: SettingsModelProtocol?
    
    init(view: SettingsViewProtocol) {
        self.view = view //+2
        self.model = SettingsModel(controller: self)
    }
    
    deinit {
        print("SettingsController is deinitialized")
    }
}

extension SettingsController: SettingsControllerToModelProtocol {
    
}

extension SettingsController: SettingsControllerToViewProtocol {
    
}
