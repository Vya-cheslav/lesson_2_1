//
//  ViewController.swift
//  lesson_2_1
//
//  Created by Вячеслав Рожнов on 08.05.18.
//  Copyright © 2018 LLC soft-upgrade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        let login = userNameTextField.text!
        let password = passwordTextField.text!
        guard login == "admin" && password == "1" else {
            print("неуспешная авторизация")
            return
        }
            print("успешная авторизация")

    }
    


}

