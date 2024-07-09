//
//  ExpensesView.swift
//  HomeWork2.5month
//
//  Created by Aijan Saadatova on 4/7/24.
//

import UIKit

class ExpensesView: UIViewController {
    
    var dataList: [AccountingModel ] = []
    
    var expendsTabBarController: ExpensesTabBarController?
    
    lazy var expensesCollectionView: UICollectionView = {
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
        dataList = CoreDataManager.shared.fetchExpenses()
        expensesCollectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        expensesCollectionView.reloadData()
    }
    
    private func setupConstraints() {
        view.addSubview(expensesCollectionView)
        expensesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        expensesCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 244).isActive = true
        expensesCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        expensesCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        expensesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension ExpensesView: UICollectionViewDataSource {
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

extension ExpensesView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
}

extension ExpensesView: ExpendsTabBarControllerDelegate {
    func didAddTap() {
        let alert = UIAlertController(title: "Расходы", message: "Добавьте расходы", preferredStyle: .alert)
        var titleTextField = UITextField()
        titleTextField.placeholder = "Введите название"
        var amounTextField = UITextField()
        amounTextField.placeholder = "Введите сумму"
        let acceptAction = UIAlertAction(title: "Да", style: .cancel) { action in
            
            let id = UUID()
            let title = titleTextField.text ?? ""
            let amount = Double(amounTextField.text ?? "0")
            let date = Date()
            let category = "expenses"
            let image = "star"
            let color = "orange"
            
            CoreDataManager.shared.addAccounting(id: id, title: title, amount: amount ?? 0 , date: date, category: category, image: image, color: color)
            
            self.dataList =
            CoreDataManager.shared.fetchExpenses()
            self.expensesCollectionView.reloadData()
            print(self.dataList)
            
        }
        
        let declineAction = UIAlertAction(title: "Нет", style: .default) { action in
            
        }
        
        alert.addTextField { textField in
            titleTextField = textField
            
        }
        
        alert.addTextField { textField in
            amounTextField = textField
        }
        
        alert.addAction(acceptAction)
        alert.addAction(declineAction)
        present(alert, animated: true)
    }
}
