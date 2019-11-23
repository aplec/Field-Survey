//
//  FieldSurveyViewController.swift
//  Field Survey
//
//  Created by Ante Plecas on 11/22/19.
//  Copyright © 2019 Ante Plecas. All rights reserved.
//

import UIKit

class FieldSurveyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var dateFormatter = DateFormatter()
    
    @IBOutlet weak var fieldSurveyTableView: UITableView!
  
    let jsonFileName = "sports_events"
    var observations: ObservationEvents?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium

        observations = FieldSurveyLoader.load(jsonFileName: jsonFileName)
        
        if observations == nil {
            presentMessage(message: "Unable to load and parse \(jsonFileName).json")
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return observations?.observations.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fieldSurveyTableView.dequeueReusableCell(withIdentifier: "sportsEventCell", for: indexPath)
        
        if let cell = cell as? FieldSurveyTableViewCell,
            let observation = observations?.observations[indexPath.row] {
            cell.titleLabel.text = observation.title
            cell.dateLabel.text = dateFormatter.string(from: observation.date)
            cell.observationImageView.image = UIImage(named: observation.observation.rawValue)
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FieldSurveyDetailViewController,
            let selectedIndexPath = fieldSurveyTableView.indexPathForSelectedRow {
            destination.observation = observations?.observations[selectedIndexPath.row]
        }
    }
    
    func presentMessage(message: String) {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
