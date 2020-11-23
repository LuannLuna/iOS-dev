//
//  Extension.swift
//  Slot Machine
//
//  Created by Luann Marques Luna on 04/06/20.
//  Copyright © 2020 LUNA SOFTWARE DEVELOPMENT. All rights reserved.
//

import SwiftUI

extension Text {
    func scoreLabelStyle() -> Text {
        self
            .foregroundColor(Color.white)
            .font(.system(size: 10, weight: .bold, design: .rounded))
    }
    
    func scoreNumberStyle() -> Text {
        self
            .foregroundColor(Color.white)
            .font(.system(.title, design: .rounded))
            .fontWeight(.heavy)
    }
}
