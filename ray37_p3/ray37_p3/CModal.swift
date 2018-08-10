//
//  CModal.swift
//  ray37_p3
//
//  Created by Raheel Yanful on 3/18/18.
//  Copyright © 2018 Raheel Yanful. All rights reserved.
//

import UIKit

protocol ModalDelegate {
    func pressSaveM(withName new: String)
}

class CModal: UIViewController {
    
    var done: UIButton!
    
    var label: UILabel!
    var name: UITextField!
    var save: UIButton!
    
    var delegate: ModalDelegate?
    
    var cir: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .orange
        
        done = UIButton(type: .system)
        done.translatesAutoresizingMaskIntoConstraints = false
        done.setTitle("Done", for: .normal)
        done.addTarget(self, action: #selector(pressDone), for: .touchUpInside)
        view.addSubview(done)
        
        //label
        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Arena Name:"
        view.addSubview(label)
        
        //change name
        name = UITextField()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Blue Circle Arena"
        name.backgroundColor = .white
        name.layer.cornerRadius = 10
        //name.delegate = self
        view.addSubview(name)
        
        //save name change
        save = UIButton(type: .system)
        save.translatesAutoresizingMaskIntoConstraints = false
        //save.backgroundColor = .red
        save.layer.cornerRadius = 10
        save.setTitle("Save", for: .normal)
        save.addTarget(self, action: #selector(pressSaveM), for: .touchUpInside)
        view.addSubview(save)
        
        setUpConstraints()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        cir = UIView(frame: CGRect(x: 50, y: 50, width: 25, height: 25))
        cir.layer.cornerRadius = 12.5
        cir.backgroundColor = .blue
        cir.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cir)
        cir.center = touches.first!.location(in: view)
    }
    
    @objc func pressSaveM(){
        if let new = name.text{
            if new != "" {
                delegate?.pressSaveM(withName: new)
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    @objc func pressDone(){
        dismiss(animated: true, completion: nil)
    }
    
    func setUpConstraints(){
        
        NSLayoutConstraint.activate([
            done.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            done.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
            ])
        
        //label constraints
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label.topAnchor.constraint(equalTo: done.bottomAnchor, constant: 32),
            ])
        
        //change name constraints
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 16),
            name.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            name.heightAnchor.constraint(equalToConstant: 32),
            name.widthAnchor.constraint(equalToConstant: 168)
            ])
        
        //save change constraints
        NSLayoutConstraint.activate([
            save.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            save.centerYAnchor.constraint(equalTo: done.centerYAnchor),
            //save.heightAnchor.constraint(equalToConstant: 44),
            //save.heightAnchor.constraint(equalToConstant: 88)
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
