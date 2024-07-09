//
//  IncomesView.swift
//  HomeWork2.5month
//
//  Created by Aijan Saadatova on 4/7/24.
//

import UIKit

class IncomesView: UIViewController {
    
    var dataList: [AccountingModel ] = []
    
    var expendsTabBarController: ExpensesTabBarController?
    
    lazy var incomesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(AddCell.self, forCellWithReuseIdentifier: AddCell.reuseId)
        view.dataSource = self
        view.delegate = self
        view.backgroundColor = .clear
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        expendsTabBarController?.expendsTabBarControllerDelegate = self
        setupConstraints()
        dataList = CoreDataManager.shared.fetchIncomes()
        incomesCollectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        incomesCollectionView.reloadData()
    }
    
    private func setupConstraints() {
        view.addSubview(incomesCollectionView)
        incomesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        incomesCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 244).isActive = true
        incomesCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        incomesCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        incomesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension IncomesView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddCell.reuseId, for: indexPath) as! AddCell
        let item = dataList[indexPath.row]
        cell.setup(data: item)
        return cell
    }
}

extension IncomesView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
}

extension IncomesView: ExpendsTabBarControllerDelegate {
    func didAddTap() {
        let alert = UIAlertController(title: "Доходы", message: "Добавьте доходы", preferredStyle: .alert)
        var amountTextField = UITextField()
        var titleTextField = UITextField()
        titleTextField.placeholder = "Введите название"
        amountTextField.placeholder = "Введите сумму"
        let acceptAction = UIAlertAction(title: "Да", style: .cancel) { action in
            let id = UUID()
            let title = titleTextField.text ?? ""
            let amount = Double(amountTextField.text ?? "0")
            let date = Date()
            let category = "incomes"
            let image = "star"
            let color = "green"
            
            CoreDataManager.shared.addAccounting(id: id, title: title, amount: amount ?? 0 , date: date, category: category, image: image, color: color)
            
            self.dataList = CoreDataManager.shared.fetchIncomes()
            self.incomesCollectionView.reloadData()
            print(self.dataList)
        }
        
        let declineAction = UIAlertAction(title: "Нет", style: .default)
        
        alert.addTextField { textField in
            titleTextField = textField
        }
        alert.addTextField { textField in
            amountTextField = textField
        }
        
        alert.addAction(acceptAction)
        alert.addAction(declineAction)
        present(alert, animated: true)
    }
}
