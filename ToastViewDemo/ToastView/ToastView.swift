//
//  ToastView.swift
//  ToastViewDemo
//
//  Created by Ateeq Ahmed on 05/12/24.
//

import UIKit

class ToastView: UIView {

    @IBOutlet weak var mainToastView: UIView!
    @IBOutlet weak var checkmarkImage: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    
    func configure(image: UIImage?, message: String, action: @escaping () -> Void)
    {
        mainToastView.layer.cornerRadius = 10
        self.checkmarkImage.image = image
        self.statusLabel.text = message
    }
    
    var actionButtonAction: (() -> Void)?
    
    static func fromNib() -> ToastView? {
           // This assumes ToastView.xib is in the main bundle and that the class name matches the XIB name
           let nib = UINib(nibName: "ToastView", bundle: nil)  // nil will default to the main bundle
           return nib.instantiate(withOwner: nil, options: nil).first as? ToastView
       }
}
