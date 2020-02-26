//
//  ViewController.swift
//  Lifecycle Logger
//
//  Created by a.kramerov on 14.02.2020.
//  Copyright © 2020 a.kramerov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    

    @IBOutlet weak var profileButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        profileButton.clipsToBounds = true
        profileButton.layer.borderWidth = 1
        profileButton.layer.borderColor = UIColor.gray.cgColor
        if let image = getSavedImage(named: "profilePicture") {
            profileButton.setImage(image, for: .normal)
        }
        profileButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFill
        
    }
    
    override func viewDidLayoutSubviews() {
        profileButton.layer.cornerRadius =  profileButton.frame.width / 2
    }
    

    @IBAction func openProfile(_ sender: Any) {
        performSegue(withIdentifier: "ProfileSeguey", sender: self)
    }
    
    func getSavedImage(named: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
    
}

