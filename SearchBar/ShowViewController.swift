//
//  ShowViewController.swift
//  SearchBar
//
//  Created by Teodik Abrami on 7/19/18.
//  Copyright © 2018 Teodik Abrami. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var name = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = name
    }
    override func viewDidAppear(_ animated: Bool) {
        label.text = name
    }

    

}
