//
//  DetailViewController.swift
//  Example1
//
//  Created by John Haselden on 13/01/2019.
//  Copyright © 2019 John Haselden. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.name
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    var detailItem: Item? {
        didSet {
            // Update the view.
            configureView()
        }
    }

    @IBAction func back(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: {
            
        })
    }
    
}

