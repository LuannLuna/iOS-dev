//
//  ViewController.swift
//  TrailerFlix
//
//  Created by Luann Luna on 31/05/19.
//  Copyright © 2019 luannluna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var trailers: [Trailer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadTrailers()
    }
    
    func loadTrailers() {
        guard let url = Bundle.main.url(forResource: "trailers", withExtension: "json") else { return }
        do {
            let trailersData = try Data(contentsOf: url)
            trailers = try JSONDecoder().decode([Trailer].self, from: trailersData)
            tableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }

    @IBAction func watchRandomTrailer(_ sender: UIButton) {
        let index = Int(arc4random_uniform(UInt32(trailers.count)))
        showTrailer(index: index)
    }
    
    func showTrailer(index: Int) {
        performSegue(withIdentifier: "trailerSegue", sender: trailers[index])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TrailerViewController {
            if let trailer = sender as? Trailer {
                vc.trailer = trailer
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trailers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let trailer = trailers[indexPath.row]
        cell.textLabel?.text = trailer.title
        cell.detailTextLabel?.text = "\(trailer.year)"
        cell.imageView?.image = UIImage(named: trailer.poster)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showTrailer(index: indexPath.row)
    }
    
}
