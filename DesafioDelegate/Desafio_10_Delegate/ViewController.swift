//
//  ViewController.swift
//  Desafio_10_Delegate
//
//  Created by ALYSSON MENEZES on 27/09/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
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
    
    func setupNameTextfield (){
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
        registerButton.tintColor = .white
        registerButton.backgroundColor = .systemBlue
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")// sobe apos clicar
    
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
        if textField.text == ""{
            textField.layer.borderWidth = 2
            textField.layer.borderColor = .init(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
        }else {
            textField.layer.borderWidth = 2
            textField.layer.borderColor = .init(red: 0/255, green: 0/255, blue: 255/255, alpha: 1)
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")//
        textField.resignFirstResponder()
        
        if textField.text == "" {
            registerButton.isEnabled = false
            registerButton.tintColor = .darkGray
        } else{
            registerButton.isEnabled = true
            registerButton.tintColor = .white
        }
        return true
    }
    
}

