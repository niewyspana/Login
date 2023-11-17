//
//  ViewController.swift
//  Login
//
//  Created by Viki on 11/11/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailLineView: UIView!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var envelopeImage: UIImageView!
    @IBOutlet weak var passwordLineView: UIView!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var lockImage: UIImageView!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var dontHaveAccountLabel: UILabel!
    
    //MARK: -IBActions
    
    @IBAction func loginAction(_ sender: Any) {
      performSegue(withIdentifier: "goToHomePage", sender: sender)
    }
    
    @IBAction func signupAction(_ sender: Any) {
        print("Sign Up")
    }
    // MARK: -Private methods
    private func setupLoginButton() {
        loginButton.layer.shadowColor = (UIColor(named: "newColor") ?? UIColor.gray).cgColor
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 8)
        loginButton.layer.shadowOpacity = 0.4
        loginButton.layer.shadowRadius = 8
    }
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoginButton()
    }
}
  





















/*
 override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        print("viewWillAppear")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        print("viewWillLayoutSubviews")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("viewDidLayoutSubviews")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("viewDidDisappear")
    }
}
*/
