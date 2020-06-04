//
//  RecipeRatingView.swift
//  Avocados
//
//  Created by Luann Marques Luna on 02/06/20.
//  Copyright © 2020 LUNA SOFTWARE DEVELOPMENT. All rights reserved.
//

import SwiftUI

struct RecipeRatingView: View {
    // MARK: - PROPERTIES
    var recipe: Recipe
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            ForEach(1...(recipe.rating), id: \.self) { _ in
                Image(systemName: "star.fill")
                    .font(.body)
                    .foregroundColor(Color.yellow)
            }
        }
    }
}

struct RecipeRatingView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRatingView(recipe: recipesData[0])
            .previewLayout(.fixed(width: 320, height: 60))
    }
}
