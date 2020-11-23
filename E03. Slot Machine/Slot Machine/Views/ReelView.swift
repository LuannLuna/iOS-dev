//
//  ReelView.swift
//  Slot Machine
//
//  Created by Luann Marques Luna on 05/06/20.
//  Copyright © 2020 LUNA SOFTWARE DEVELOPMENT. All rights reserved.
//

import SwiftUI

struct ReelView: View {
    var body: some View {
        Image("gfx-reel")
            .resizable()
            .modifier(ImageModifier())
    }
}

struct ReelView_Previews: PreviewProvider {
    static var previews: some View {
        ReelView()
            .previewLayout(.fixed(width: 220, height: 220))
    }
}
