//
//  ViewController.swift
//  ray37_p3
//
//  Created by Raheel Yanful on 3/17/18.
//  Copyright © 2018 Raheel Yanful. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SaveDelegate, ModalDelegate {

    var square: UIButton!
    var circle: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        
        //red square BUTTON
        square = UIButton(type: .system)
        square.setTitle("Red Square Arena", for: .normal)
        square.addTarget(self, action: #selector(pressSNav), for: .touchUpInside)
        square.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(square)
        
        //blue circles Button
        circle = UIButton(type: .system)
        circle.setTitle("Blue Circle Arena", for: .normal)
        circle.addTarget(self, action: #selector(pressCModal), for: .touchUpInside)
        circle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(circle)
        
        self.navigationItem.title = "Drawing Arena";
        
        setUpContraints()
    }
    
    func pressSave(withName new: String) {
        square.setTitle(new, for: .normal)
    }
    
    func pressSaveM(withName new: String) {
        circle.setTitle(new, for: .normal)
    }
    
    @objc func pressSNav(){
        let nav = SNav()
        nav.delegate = self
        navigationController?.pushViewController(nav, animated: true)
        //if let navtext = square.currentTitle {
       //     nav.name.text = nav text
        //}
    }
    
    @objc func pressCModal(){
        let mod = CModal()
        mod.delegate = self
        present(mod, animated: true, completion: nil)
        //mod.name.text = circle.currentTitle
    }
    
    func setUpContraints(){
        
        //red square button activation
        NSLayoutConstraint.activate([
            square.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            square.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -16)
            ])
        
        //blue circle button activation
        NSLayoutConstraint.activate([
            circle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circle.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 16)
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

