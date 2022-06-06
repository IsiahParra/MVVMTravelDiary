//
//  PersistentStore.swift
//  travelDiaryMVVM
//
//  Created by Isiah Parra on 6/6/22.
//

import Foundation

protocol LogStoreable {
    // able is the convention to name a protocol that does something
    var logs: [Log] {get set}
    // Save to Persistent Store
    func save(_ log: Log)
    func update()
    func load()
    
}

class LogStorage: LogStoreable {
    var logs: [Log] = [] // SOT
    static let sharedInstance = LogStorage() // single
    private var fileURL: URL? {
            guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
            let url = documentsDirectory.appendingPathComponent("traveldiary-mvvm.json")
            return url
        }
    
    func save(_ log: Log) {
        guard let fileURL = fileURL else {
            return
        }
        do {
            logs.append(log)
       let data = try JSONEncoder().encode(logs)
            try data.write(to: fileURL)
        } catch let error{
            print(error)
        }
    }
    
    func update() {
            guard let url = fileURL else {
                return
            }
            do {
           let data = try JSONEncoder().encode(logs)
                try data.write(to: url)
            } catch let error{
                print(error)
            }
        }
    
    func load() {
        guard let fileURL = fileURL else { return }
        do {
            // 2. Load the raw data from the url
            let data = try Data(contentsOf: fileURL)
            // 3. Convert the raw data into our Swift class
            let logs = try JSONDecoder().decode([Log].self, from: data)
            self.logs = logs
        } catch {
            print("Error Loading Devices", error)
        }
    }

    
}
