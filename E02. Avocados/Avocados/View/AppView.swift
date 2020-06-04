//
//  AppView.swift
//  Avocados
//
//  Created by Luann Marques Luna on 29/05/20.
//  Copyright © 2020 LUNA SOFTWARE DEVELOPMENT. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            AvocadosView()
                .tabItem {
                    Image("tabicon-branch")
                    Text("Avocados")
            }
            ContentView()
                .tabItem {
                    Image("tabicon-book")
                    Text("Recepes")
            }
            RipeningStagesView()
                .tabItem {
                    Image("tabicon-avocado")
                    Text("Ripening")
            }
            SettingsView()
                .tabItem {
                    Image("tabicon-settings")
                    Text("Settings")
            }
        }
        .edgesIgnoringSafeArea(.top)
        .accentColor(Color.primary)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
