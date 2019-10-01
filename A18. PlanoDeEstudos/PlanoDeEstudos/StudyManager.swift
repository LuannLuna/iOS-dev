//
//  StudyManager.swift
//  PlanoDeEstudos
//
//  Created by Luann Marques Luna on 08/07/19.
//  Copyright © 2019 Eric Brito. All rights reserved.
//
import UserNotifications
import Foundation
class StudyManager {
    static let shared = StudyManager()
    let ud = UserDefaults.standard
    var studyPlanes: [StudyPlane] = []
    
    private init() {
        if let data = ud.data(forKey: "studyPlans"), let plans = try? JSONDecoder().decode([StudyPlane].self, from: data) {
            self.studyPlanes = plans
        }
    }
    
    func savePans() {
        if let data = try? JSONEncoder().encode(studyPlanes) {
            ud.set(data, forKey: "studyPlans")
        }
    }
    
    func addPlane(_ studyPlane: StudyPlane) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [studyPlane.id])
        
        studyPlanes.append(studyPlane)
        savePans()
    }
    
    func removePlane(at index: Int) {
        studyPlanes.remove(at: index)
        savePans()
    }
    
    func setPlaneDone(id: String) {
        if let studyPlane = studyPlanes.first(where: {$0.id == id}) {
            studyPlane.done = true
            savePans()
        }
    }
}
