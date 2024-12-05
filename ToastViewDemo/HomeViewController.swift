//
//  HomeViewController.swift
//  ToastViewDemo
//
//  Created by Ateeq Ahmed on 05/12/24.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func showToast(image: UIImage?, message: String, action: @escaping () -> Void)
    {
        // Load the toast from the XIB
        let toastView = Bundle.main.loadNibNamed("ToastView", owner: nil, options: nil)?.first as? ToastView
        toastView?.configure(image: image, message: message, action: action)
        
        // Add toastView to the main view
        self.view.addSubview(toastView!)
        
        // Set constraints for toastView (you can change these as per your layout)
        //        toastView?.translatesAutoresizingMaskIntoConstraints = false
        //                    NSLayoutConstraint.activate([
        //                        toastView!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
        //                        toastView!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
        //                        toastView!.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
        //                        toastView!.heightAnchor.constraint(equalToConstant: 60),
        //                    ])
        
        if let window = UIApplication.shared.keyWindow {
            window.addSubview(toastView!)
            
            toastView?.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                toastView!.leadingAnchor.constraint(equalTo: window.leadingAnchor, constant: 10),
                toastView!.trailingAnchor.constraint(equalTo: window.trailingAnchor, constant: -10),
                toastView!.topAnchor.constraint(equalTo: window.safeAreaLayoutGuide.topAnchor, constant: 0),
                toastView!.heightAnchor.constraint(equalToConstant: 60)
            ])
            
            // Animate the toastView in
            toastView?.alpha = 0.0
            UIView.animate(withDuration: 0.5, animations: {
                toastView?.alpha = 1.0
            }) { _ in
                // Remove the toast after 3 seconds
                UIView.animate(withDuration: 0.5, delay: 3.0, options: .curveEaseOut, animations: {
                    toastView?.alpha = 0.0
                }) { _ in
                    toastView?.removeFromSuperview()
                }
            }
        }
        
    }
}
