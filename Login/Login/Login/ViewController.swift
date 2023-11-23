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
    
    // MARK: - Properties
    private let activeColor = UIColor(named: "newColor") ?? UIColor.gray
    private var email: String = "" {
        didSet{
            loginButton.isUserInteractionEnabled = !(email.isEmpty || password.isEmpty)
            loginButton.backgroundColor = !(email.isEmpty || password.isEmpty) ? activeColor : .systemGray5
        }
    }
    private var password: String = "" {
        didSet {
            loginButton.isUserInteractionEnabled = !(email.isEmpty || password.isEmpty)
            loginButton.backgroundColor = !(email.isEmpty || password.isEmpty) ? activeColor : .systemGray5
        }
    }
    
    private let mockPassword = "123456"
    private let mockEmail = "abc@gmail.com"
    
    //MARK: -IBActions
    @IBAction func loginAction(_ sender: Any) {
        emailText.resignFirstResponder()
        passwordText.resignFirstResponder()
        
        if email.isEmpty {
            makeErrorField(textField: emailText)
        }
        
        if password.isEmpty {
            makeErrorField(textField: passwordText)
        }
        
        if email == mockEmail,
           password == mockPassword {
            performSegue(withIdentifier: "goToHomePage", sender: sender)
        } else {
            let alert = UIAlertController(title: "Error_message".localized, message: "Wrong_password_or_e-mail".localized, preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK".localized, style: .default)
            alert.addAction(action)
            
            present(alert, animated: true)
        }
    }
    
    @IBAction func signupAction(_ sender: Any) {
        print("Sign Up")
    }
    
    // MARK: -Private methods
    private func setupLoginButton() {
        loginButton.layer.shadowColor = activeColor.cgColor
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 8)
        loginButton.layer.shadowOpacity = 0.4
        loginButton.layer.shadowRadius = 8
        
        loginButton.isUserInteractionEnabled = false
        loginButton.backgroundColor = .systemGray5
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoginButton()
        
        emailText.delegate = self
        passwordText.delegate = self
        emailText.becomeFirstResponder()
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text  = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              !text.isEmpty else { return }
        switch textField {
        case emailText:
            let isValidEmail = check(email: text)
            
            if isValidEmail {
                email = text
                envelopeImage.tintColor = .systemGray5
                emailLineView.backgroundColor = .systemGray5
            } else {
                email = ""
                makeErrorField(textField: textField)
            }
            
        case passwordText:
            
            let isValidPassword = check(password: text)
            
            if isValidPassword {
                password = text
                lockImage.tintColor = .systemGray5
                passwordLineView.backgroundColor = .systemGray5
            } else {
                password = ""
                makeErrorField(textField: textField)
            }
        default:
            print("unknown textField")
        }
    }
    
    private func check(email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
    
    private func check(password: String) -> Bool {
        return password.count >= 4
    }
    
    private func makeErrorField(textField: UITextField) {
        switch textField {
        case emailText:
            envelopeImage.tintColor = activeColor
            emailLineView.backgroundColor = activeColor
        case passwordText:
            lockImage.tintColor = activeColor
            passwordLineView.backgroundColor = activeColor
        default:
            print("unknown textField")
        }
    }
}
