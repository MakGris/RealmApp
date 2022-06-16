//
//  DataManager.swift
//  RealmApp
//
//  Created by Alexey Efimov on 08.10.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    private init() {}
    
    func createTempDataV2(completion: @escaping () -> Void) {
        if !UserDefaults.standard.bool(forKey: "Buzz") {
            
            let shoppingList = TaskList()
            shoppingList.name = "Shopping List"
            
            let milk = Task()
            milk.name = "Milk"
            milk.note = "2L"
            
            let bread = Task(value: ["Bread", "", Date(), true])
            let apples = Task(value: ["name": "Apples", "note": "2Kg"])
            
            shoppingList.tasks.append(milk)
            shoppingList.tasks.insert(contentsOf: [bread, apples], at: 0)
            
            DispatchQueue.main.async {
                StorageManager.shared.save([shoppingList])
                UserDefaults.standard.set(true, forKey: "Buzz")
                completion()
            }
        }
    }
}
