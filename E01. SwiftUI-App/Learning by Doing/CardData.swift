//
//  CardData.swift
//  Learning by Doing
//
//  Created by Luann Marques Luna on 28/05/20.
//  Copyright © 2020 LUNA SOFTWARE DEVELOPMENT. All rights reserved.
//

import SwiftUI

// MARK: - CARD DATA

let cardData: [Card] = [
    Card(title: "SwiftUI",
         headline: "Better Apps. Less code",
         imageName: "developer-no1",
         callToAction: "Desing",
         message: "Introducing a modern way to design interfaces for any Apple devices",
         gradientColors: [
            Colors.color01.color,
            Colors.color02.color]),
    Card(
      title: "iOS 13",
      headline: "Dramatic new look.",
      imageName: "developer-no2",
      callToAction: "Discover",
      message: "Get ready for iOS 13 and learn about the new Dark Mode.",
      gradientColors: [Colors.color03.color, Colors.color04.color]
    ),
    Card(
      title: "Swift",
      headline: "Everyone can code.",
      imageName: "developer-no3",
      callToAction: "Implement",
      message: "A modern yet powerful programming language that is also easy to learn.",
      gradientColors: [Colors.color05.color, Colors.color06.color]
    ),
    Card(
      title: "Catalyst",
      headline: "Bring Your iPad App to Mac.",
      imageName: "developer-no4",
      callToAction: "Distribute",
      message: "Now it’s incredibly simple to start building a native Mac app from your iPad app.",
      gradientColors: [Colors.color07.color, Colors.color08.color]
    ),
    Card(
      title: "Playgrounds",
      headline: "Engaging way to learn coding.",
      imageName: "developer-no5",
      callToAction: "Experiment",
      message: "A new way to create code. On the best device for learning.",
      gradientColors: [Colors.color09.color, Colors.color10.color]
    ),
    Card(
      title: "Xcode",
      headline: "The best tool you need to build apps.",
      imageName: "developer-no6",
      callToAction: "Develop",
      message: "Bring your ideas to life and build awesome apps for all platforms.",
      gradientColors: [Colors.color11.color, Colors.color12.color]
    )
]
