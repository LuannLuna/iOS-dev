//
//  ContentView.swift
//  GetStartAsyncAwait
//
//  Created by Luann Luna on 11/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var currentDateListVM = CurrentDateListViewModel()
    
    
    var body: some View {
        NavigationView {
            List(currentDateListVM.currentDates) { currentDate in
                Text("\(currentDate.date)")
            }.listStyle(.plain)
                .navigationTitle("Dates")
                .navigationBarItems(trailing: Button(action: {
                    async {
                        await currentDateListVM.populateDates()
                    }
                }, label: {
                    Image(systemName: "arrow.clockwise.circle")
                }))
                .task {
                    await currentDateListVM.populateDates()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
