//
//  LogDetailViewModel.swift
//  travelDiaryMVVM
//
//  Created by Isiah Parra on 6/6/22.
//

import Foundation

class LogDetailViewModel {
    
    // we need a way to access the array of logs. Can the LogDVM perform its responsibilites without the logs array?
    //Dependency
    let storage: LogStorage
    var log: Log?
    //Dependency Injection
    init(log: Log? = nil, storage: LogStorage = LogStorage.sharedInstance) {
        self.storage = storage
        self.log = log
    }
    
    func saveLog(with name: String, entry: String) {
        if log != nil {
            //trying to update
            update( with: name, and: entry)
        } else {
            let log = Log(name: name, entry: entry)
            storage.save(log)
        }
    }
    func update(with newName: String, and entry: String) {
        guard let log = log, let indexOfLog = storage.logs.firstIndex(of: log) else {
            return
        }
        let logToUpdate = storage.logs[indexOfLog]
        logToUpdate.name = newName
        logToUpdate.entry = entry
        storage.update()
    }
}// end of struct
