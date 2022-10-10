//
//  ViewController.swift
//  Core Graphics Intro
//
//  Created by K Praveen Kumar on 10/10/22.
//

import UIKit

class FirstViewController: UIViewController {
    
    let drawRectView = MyView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray4
        view.addSubview(drawRectView)
        
        drawRectView.translatesAutoresizingMaskIntoConstraints = false
        drawRectView.backgroundColor = .systemGray2

        
        NSLayoutConstraint.activate([
                   drawRectView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   drawRectView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                   drawRectView.widthAnchor.constraint(equalToConstant: 400),
                   drawRectView.heightAnchor.constraint(equalToConstant: 400),
               ])
        
        print(UIScreen.main.bounds.size)
    }
    


}

class MyView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        //Everything in core graphics is driven by context. Context is the state which contains all the details. So always we need to start with a context
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        //MARK: - Rectangle
        //Define your canvas or painting area
        let rectangle = CGRect(x: 0, y: 0, width: 300, height: 180).insetBy(dx: 10, dy: 10)
        //when core graphics paints/strokes a line, half of the paint goes on one side and half goes on the other. That's why images looks like the border is clipped or missing. Some of he paint is outside the CGRect.
        // The way to fix this is to inset your CGRect by half the setLineWidth(20)
        
        context.setFillColor(UIColor.systemBrown.cgColor) // we have to go one layer down to get the color because when core graphics was created UIKit was not there.
        context.setStrokeColor(UIColor.white.cgColor)
        context.setLineWidth(20)
        context.addRect(rectangle)
        context.drawPath(using: .fillStroke)
        context.fill(rectangle)
        
        
        //MARK: - Painters Model (we are drawing one above another)
        let rectangle2 = CGRect(x: 256, y: 256, width: 128, height: 128)
        
        context.setFillColor(UIColor.darkGray.cgColor)
        context.setStrokeColor(UIColor.white.cgColor)
        context.setLineWidth(10)
        context.addEllipse(in: rectangle2)
        context.drawPath(using: .fillStroke)
        
    }
}
