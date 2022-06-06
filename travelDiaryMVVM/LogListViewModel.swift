//
//  LogListViewModel.swift
//  travelDiaryMVVM
//
//  Created by Isiah Parra on 6/6/22.
//

import Foundation

class LogListViewModel {
    
    // business logic and such
    let storage: LogStorage
    var logs: [Log] = []
    
    //Dependency Injection
    init(storage: LogStorage = LogStorage.sharedInstance) {
        self.storage = storage
    }
    
    func loadData() {
        storage.load()
        self.logs = storage.logs
    }
    
    func delete(index: Int) {
        storage.logs.remove(at: index)
        storage.update()
        self.logs = storage.logs
    }
}
