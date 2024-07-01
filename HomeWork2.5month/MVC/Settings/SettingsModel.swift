//
//  SettingsModel.swift
//  HomeWork2.5month
//
//  Created by Aijan Saadatova on 30/6/24.
//

import UIKit

protocol SettingsModelProtocol: AnyObject {
    
}

class SettingsModel: SettingsModelProtocol {
    //храним взаимную ссылку на контроллер
    private weak var controller: SettingsControllerToModelProtocol?
    
    init(controller: SettingsControllerToModelProtocol) {
        self.controller = controller
    }
    
    deinit {
        print("SettingsModel is deinitialized")
    }
}
