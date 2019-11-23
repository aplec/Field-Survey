//
//  FieldSurveyDetailViewController.swift
//  Field Survey
//
//  Created by Ante Plecas on 11/22/19.
//  Copyright © 2019 Ante Plecas. All rights reserved.
//

import UIKit

class FieldSurveyDetailViewController: UIViewController {
    @IBOutlet weak var observationImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    let dateFormatter = DateFormatter()
    
    var observation: ObservationEvent?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium

        if let observation = observation {
            titleLabel.text = observation.title
            dateLabel.text = dateFormatter.string(from: observation.date)
            observationImageView.image = UIImage(named: observation.classification)
        }
    }
}
