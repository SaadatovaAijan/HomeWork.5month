//
//  CoreDataManager.swift
//  HomeWork2.5month
//
//  Created by Aijan Saadatova on 9/7/24.
//

import CoreData
import UIKit

final class CoreDataManager {
    static let shared = CoreDataManager()

    private var appDelegate: AppDelegate {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Unable to retrieve AppDelegate")
        }
        return appDelegate
    }

    private var context: NSManagedObjectContext {
        return appDelegate.persistentContainer.viewContext
    }

    func addAccounting(id: UUID, title: String, amount: Double, date: Date, category: String, image: String, color: String) {
        guard let entity = NSEntityDescription.entity(forEntityName: "AccountingModel", in: context) else {
            print("Failed to create entity description for AccountingModel")
            return
        }
        let accountingModel = AccountingModel(entity: entity, insertInto: context)
        accountingModel.id = id
        accountingModel.title = title
        accountingModel.amount = amount
        accountingModel.date = date
        accountingModel.category = category
        accountingModel.image = image
        accountingModel.color = color

        appDelegate.saveContext()
    }

    func fetchExpenses() -> [AccountingModel] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "AccountingModel")
        do {
            let accountings = try context.fetch(fetchRequest) as! [AccountingModel]
            let expenses = accountings.filter { accounting in
                accounting.category == "expenses"
            }
            return expenses
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
    
    func fetchIncomes() -> [AccountingModel] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "AccountingModel")
        do {
            let accountings = try context.fetch(fetchRequest) as! [AccountingModel]
            let incomes = accountings.filter { accounting in
                accounting.category == "incomes"
            }
            return incomes
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
}
