//
//  SettingsView.swift
//  HomeWork2.5month
//
//  Created by Aijan Saadatova on 30/6/24.
//

import UIKit

protocol SettingsViewProtocol: AnyObject {
    
}

class SettingsView: UIViewController {
    
    private var controller: SettingsControllerToViewProtocol?
    
    private var settings: [Settings] = [Settings(image: "globe", title: "Выбрать язык", type: .descritpion, description: "русский"), Settings(image: "moon", title: "Темная тема", type: .withSwitch), Settings(image: "trash", title: "Очистить данные", type: .standart)]
    
    private lazy var settingsTableView: UITableView = {
        let view = UITableView()
        view.register(SettingsCell.self, forCellReuseIdentifier: SettingsCell.reuseId)
        view.dataSource = self
        view.delegate = self
        view.backgroundColor = .clear
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        view.backgroundColor = .systemBackground
        controller = SettingsController(view: self)
        setupConstraints()
        
        let isDarkTheme = UserDefaults.standard.bool(forKey: "darkTheme")
        if isDarkTheme == true {
            view.overrideUserInterfaceStyle = .dark
        } else {
            view.overrideUserInterfaceStyle = .light
        }
        print(isDarkTheme)
    }    
    
    deinit {
        print("SettingView is deinitialized")
    }
    
    private func setupConstraints() {
        view.addSubview(settingsTableView)
        settingsTableView.translatesAutoresizingMaskIntoConstraints = false
        settingsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        settingsTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        settingsTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        settingsTableView.heightAnchor.constraint(equalToConstant: 156).isActive = true
    }
    
}

extension SettingsView: SettingsViewProtocol {
    
}

extension SettingsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.reuseId, for: indexPath) as! SettingsCell
        let item = settings[indexPath.row]
        cell.setup(settings: item)
        cell.delegate = self
        return cell
    }
}

extension SettingsView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }
}

extension SettingsView: SettingsCellDelegate {
    func didSwitch(isOn: Bool) {
        UserDefaults.standard.setValue(isOn, forKey: "darkTheme")
        if isOn == true {
            view.overrideUserInterfaceStyle = .dark
        } else {
            view.overrideUserInterfaceStyle = .light
        }
    }
}
