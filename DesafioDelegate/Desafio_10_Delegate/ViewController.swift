//
//  ViewController.swift
//  Desafio_10_Delegate
//
//  Created by ALYSSON MENEZES on 27/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var adressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addElement()
    }
     
    func addElement(){
        setupNameTextfield()
        setupAdressTextfield()
        setupPassword()
        setupRegisterButton()
    }
    
    func setupNameTextfield(){
        nameTextField.placeholder = "nome:"
        nameTextField.delegate = self
    }
    func setupAdressTextfield(){
        adressTextField.placeholder = "endeço:"
        adressTextField.delegate = self
    }
    func setupPassword(){
        passwordTextField.placeholder = "senha:"
        passwordTextField.delegate = self
    }
    func setupRegisterButton(){
        registerButton.setTitle("cadastrar ", for: .normal)
        registerButton.tintColor = .white  // n usar tint color
        registerButton.backgroundColor = .systemBlue
        registerButton.layer.cornerRadius = 7.0
        registerButton.isEnabled = false
    }
    
    
    @IBAction func tappedButton(_ sender: UIButton) {
        print("informação enviada!")
    }
    
}
// sempre usar delegade separado via  protocolo
extension ViewController: UITextFieldDelegate {
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")// sobe apos clicar
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.systemBlue.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // faz verificacao antes do teclado baixar
        print("textFieldDidEndEditing") // teclado desaparece
        if textField.text == ""{ // ou textField.hasText
            textField.layer.borderWidth = 2
            textField.layer.borderColor = .init(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")// teclado desaparece
        textField.resignFirstResponder()
        
        if nameTextField.text == "" ||
            adressTextField.text == "" ||
            passwordTextField.text == "" {
            
            registerButton.isEnabled = false
            registerButton.tintColor = .darkGray
        } else{
            registerButton.isEnabled = true
            registerButton.tintColor = .white
        }
        return true
    }
}
