//
//  Log.swift
//  travelDiaryMVVM
//
//  Created by Isiah Parra on 6/6/22.
//

import Foundation

class Log: Codable {
    
    var name: String
    var entry: String
    var date: Date = Date()
    var uuid: UUID = UUID()
    
    //MARK: Initilazier
    init(name: String, entry: String, date: Date = Date(), uuid: UUID = UUID()) {
        self.name = name
        self.entry = entry
        self.date = date
        self.uuid = uuid
    }
}

extension Log: Equatable {
    static func == (lhs: Log, rhs: Log) -> Bool {
        return lhs.uuid == rhs.uuid
    }
    
    
}
