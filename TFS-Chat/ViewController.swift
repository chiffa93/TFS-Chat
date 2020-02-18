//
//  ViewController.swift
//  Lifecycle Logger
//
//  Created by a.kramerov on 14.02.2020.
//  Copyright © 2020 a.kramerov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        debugVersion ? print(#function) : ()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        debugVersion ? print(#function) : ()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        debugVersion ? print(#function) : ()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        debugVersion ? print(#function) : ()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        debugVersion ? print(#function) : ()
    }


}

