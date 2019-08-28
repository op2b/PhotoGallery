//
//  ViewController.swift
//  PhotoGallery
//
//  Created by Artem Esolnyak on 27/08/2019.
//  Copyright © 2019 Artem Esolnyak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imagePrewe: UIImageView!
    var currentPhoto : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.imagePrewe.image = currentPhoto
    }


}

