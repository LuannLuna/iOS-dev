//
//  Extension+Array.swift
//  Slot Machine
//
//  Created by Luann Marques Luna on 22/06/20.
//  Copyright © 2020 LUNA SOFTWARE DEVELOPMENT. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    func allEqual() -> Bool {
        if let firstItem = first {
            return !dropFirst().contains{$0 != firstItem}
        }
        return true
    }
}
