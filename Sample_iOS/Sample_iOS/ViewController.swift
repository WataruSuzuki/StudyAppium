//
//  ViewController.swift
//  Sample_iOS
//
//  Created by 鈴木航 on 2017/11/10.
//  Copyright © 2017年 WataruSuzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var (・ω・): UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapButton(sender: UIButton) {
        if let url = URL(string: "https://github.com/WataruSuzuki/StudyAppium") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

}

