//
//  AddTaskViewController.swift
//  GoodList
//
//  Created by Luann Luna on 13/08/21.
//

import UIKit
import RxSwift

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var prioritySegmentedControl: UISegmentedControl!
    @IBOutlet weak var taskTitleTextField: UITextField!
    
    private let taskSubject = PublishSubject<Task>()
    var taskSubjectObservable: Observable<Task> {
        taskSubject.asObserver()
    }
    
    @IBAction func save() {
        guard let priority = Priority(rawValue: self.prioritySegmentedControl.selectedSegmentIndex),
              let title = taskTitleTextField.text else { return }
        
        let task = Task(title: title, priority: priority)
        
        taskSubject.onNext(task)
        
        self.dismiss(animated: true, completion: nil)
        
    }

}
