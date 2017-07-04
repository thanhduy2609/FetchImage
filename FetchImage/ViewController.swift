//
//  ViewController.swift
//  FetchImage
//
//  Created by Duy Bùi on 7/4/17.
//  Copyright © 2017 Duy Bùi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var txtLink: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func imgFetch(_ sender: Any) {
        let imageUrl: URL = URL(string: txtLink.text!)!
        (URLSession(configuration: URLSessionConfiguration.default)).dataTask(with: imageUrl, completionHandler: {(imageData, response, error) in
            if let data = imageData {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
            }
            
        }).resume()
    }

}

