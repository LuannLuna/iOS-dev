//
//  CurrentDateViewModel.swift
//  GetStartAsyncAwait
//
//  Created by Luann Luna on 11/11/21.
//

import Foundation

class CurrentDateListViewModel: ObservableObject {
    
    @Published var currentDates: [CurrentDateViewModel] = []
    
    func populateDates() async {
        do {
            if let currentDate = try await Webservice().getDate() {
                let currentDateViewModel = CurrentDateViewModel(currentDate: currentDate)
                DispatchQueue.main.async {
                    self.currentDates.append(currentDateViewModel)
                }
            }
        } catch {
            print(error)
        }
    }
}

struct CurrentDateViewModel: Identifiable {
    let currentDate: CurrentDate
    var id: UUID {
        currentDate.id
    }
    
    var date: String {
        currentDate.date
    }
}
