///
//  HeaderView.swift
//  Avocados
//
//  Created by Luann Marques Luna on 29/05/20.
//  Copyright © 2020 LUNA SOFTWARE DEVELOPMENT. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - PROPERTIES
    
    var header: Header
    
    @State private var showHeadline: Bool = false
    
    var slideInAnimation: Animation {
        Animation.spring(response: 1.5, dampingFraction: 0.5, blendDuration: 0.5)
            .speed(1)
            .delay(0.25)
    }
    
    var body: some View {
        ZStack {
            Image(header.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
            HStack(alignment: .top, spacing: 0) {
                Rectangle()
                    .fill(Colors.lightGreen.color)
                    .frame(width: 3)
                VStack(alignment: .leading, spacing: 0) {
                    Text(header.headline)
                        .font(.system(.title,
                                      design: .serif))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .shadow(radius: 3)
                    Text(header.subheadline)
                        .font(.footnote)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                        .shadow(radius: 3)
                }
                .padding(.vertical, 0)
                .padding(.horizontal, 20)
                .frame(width: 281,
                       height: 105)
                    .background(Colors.transparentLightBlack.color)
            }
            .frame(width: 285,
                   height: 105,
                   alignment: .center)
                .offset(x: -66,
                        y: showHeadline ? 75 : 220)
                .animation(slideInAnimation)
                .onAppear(perform: {
                    self.showHeadline.toggle()
                })
        }
        .frame(width: 480,
               height: 320,
               alignment: .center)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(header: headerData[2])
            .previewLayout(.sizeThatFits)
    }
}
