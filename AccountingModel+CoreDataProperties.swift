//
//  AccountingModel+CoreDataProperties.swift
//  HomeWork2.5month
//
//  Created by Aijan Saadatova on 9/7/24.
//
//

import Foundation
import CoreData


extension AccountingModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AccountingModel> {
        return NSFetchRequest<AccountingModel>(entityName: "AccountingModel")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var amount: Double
    @NSManaged public var date: Date?
    @NSManaged public var category: String?
    @NSManaged public var image: String?
    @NSManaged public var color: String?

}

extension AccountingModel : Identifiable {

}
