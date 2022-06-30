//
//  Webservice.swift
//  GetStartAsyncAwait
//
//  Created by Luann Luna on 11/11/21.
//

import Foundation

class Webservice {
    func getDate() async throws -> CurrentDate? {
        sleep(2)
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        dateFormatter.string(from: date)
        return CurrentDate(date: dateFormatter.string(from: date))
    }
}
