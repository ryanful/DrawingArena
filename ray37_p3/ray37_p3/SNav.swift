//
//  SNav.swift
//  ray37_p3
//
//  Created by Raheel Yanful on 3/18/18.
//  Copyright © 2018 Raheel Yanful. All rights reserved.
//

import UIKit

protocol SaveDelegate {
    func pressSave(withName new: String)
}

class SNav: UIViewController {
    
    var label: UILabel!
    var name: UITextField!
    var save: UIBarButtonItem!
    
    var delegate: SaveDelegate?
    
    var rec: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .green
        
        //label
        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Arena Name:"
        view.addSubview(label)
        
        //change name
        name = UITextField()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Red Square Arena"
        name.backgroundColor = .white
        name.layer.cornerRadius = 10
        //name.delegate = self
        view.addSubview(name)
        
        //save name change
        save = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(pressSave))
        self.navigationItem.rightBarButtonItem = save
        
        
        setUpConstraints()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        rec = UIView(frame: CGRect(x: 50, y: 50, width: 25, height: 25))
        rec.backgroundColor = .red
        rec.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rec)
        rec.center = touches.first!.location(in: view)
    }
    
    @objc func pressSave(){
        if let new = name.text{
            if new != "" {
                delegate?.pressSave(withName: new)
            }
        }
        navigationController?.popViewController(animated: true)
    }
    
    func setUpConstraints() {
        
        //label constraints
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            ])
        
        //change name constraints
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 16),
            name.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            name.heightAnchor.constraint(equalToConstant: 32),
            name.widthAnchor.constraint(equalToConstant: 168)
            ])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
