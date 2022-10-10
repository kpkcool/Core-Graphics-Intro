//
//  SecondViewController.swift
//  Core Graphics Intro
//
//  Created by K Praveen Kumar on 10/10/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    var imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray3
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        drawCircle()
        
    }
    
    func drawCircle(){
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 400, height: 400))
        
        let img = renderer.image { ctx in
            
            let rectangle = CGRect(x: 0, y: 0, width: 400, height: 400).insetBy(dx: 5, dy: 5)
            
            ctx.cgContext.setFillColor(UIColor.white.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(10)
            
            ctx.cgContext.addEllipse(in: rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        
        imageView.image = img
    }
    



}
