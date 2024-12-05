//
//  ViewController.swift
//  ToastViewDemo
//
//  Created by Ateeq Ahmed on 05/12/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginClicked(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        
        homeVC?.showToast(image: UIImage(systemName: "checkmark.circle"), message: "Success") {
            print("Retry button tapped")
        }
            
            self.navigationController?.pushViewController(homeVC!, animated: true)
    }
    
}

