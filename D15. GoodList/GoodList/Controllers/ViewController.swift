//
//  ViewController.swift
//  GoodList
//
//  Created by Luann Luna on 13/08/21.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var prioritysegmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    private var tasks = BehaviorRelay<[Task]>(value: [])
    private var filteredTasks = [Task]()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navC = segue.destination as? UINavigationController,
           let vc = navC.viewControllers.first as? AddTaskViewController {
            vc.taskSubjectObservable.subscribe(onNext:{ [unowned self] task in
                
                let priority = Priority(rawValue: self.prioritysegmentedControl.selectedSegmentIndex - 1)
                
                var existingTask = self.tasks.value
                existingTask.append(task)
                self.tasks.accept(existingTask)
                self.filterTasks(by: priority)
            }).disposed(by: disposeBag)
        }
    }
    
    private func filterTasks(by priority: Priority?) {
        if priority == nil {
            filteredTasks = tasks.value
            updateTableView()
        } else {
            tasks.map { tasks in
                return tasks.filter { $0.priority == priority! }
            }.subscribe(onNext: { [weak self] tasks in
                self?.filteredTasks = tasks
                self?.updateTableView()
            }).disposed(by: disposeBag)
        }
    }
    
    private func updateTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    @IBAction func priorityValueChanged(segmentedControl: UISegmentedControl) {
        let priority = Priority(rawValue: segmentedControl.selectedSegmentIndex)
        filterTasks(by: priority)
    }
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = filteredTasks[indexPath.row].title
        
        return cell
    }
    
}
