//
//  AuthViewController.swift
//  FinalProject
//
//  Created by Luis Javier Canto Hurtado on 25/04/21.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth
import AVFoundation

class AuthViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    
    var email: String?
    
    var audioPlayer = AVAudioPlayer()
    let click = Bundle.main.path(forResource: "click", ofType: "mp3")
    let click2 = Bundle.main.path(forResource: "click2", ofType: "mp3")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Autenticación"
        // Analytics Event
        Analytics.logEvent("InitScreen", parameters: ["message":"Integración de Firebase completa"])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "WelcomeSegue" {
              let vc = segue.destination as! HomeViewController
                vc.email = self.email
         }
     }

    @IBAction func signUpButtonAction(_ sender: Any) {
        
        var url: URL!
        
        UIView.animate(withDuration: 1, delay: 0, animations:
            { () -> Void in
                self.signUpButton.alpha = 0.5
                self.signUpButton.alpha = 1
            
        })
        
        url = URL(fileURLWithPath: click!)
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
        } catch{
            print("Error while playin sound")
        }
        
        
        if let emailtxt = emailTextField.text, let password = passwordTextField.text{
            self.email = emailtxt
            
            Auth.auth().createUser(withEmail: email!, password: password) { result, error in if let result = result, error == nil {
                    // ir a Welcome page - Home ViewController
                self.performSegue(withIdentifier: "WelcomeSegue", sender: self)
                print(result)
                } else {
                    // ocurrio un error, push notificacion de error
                    let alertController = UIAlertController(title: "Error", message: "Se ha producido un error", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    
    @IBAction func logInButtonAction(_ sender: Any) {
        
        var url: URL!
        
        UIView.animate(withDuration: 1, delay: 0, animations:
            { () -> Void in
                self.logInButton.alpha = 0.5
                self.logInButton.alpha = 1
            
        })
        
        url = URL(fileURLWithPath: click2!)
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
        } catch{
            print("Error while playin sound")
        }
        
        if let emailtxt = emailTextField.text, let password = passwordTextField.text{
            self.email = emailtxt
            
            Auth.auth().signIn(withEmail: email!, password: password) { result, error in if let result = result, error == nil {
                    // ir a Welcome page - Home ViewController
                self.performSegue(withIdentifier: "WelcomeSegue", sender: self)
                print(result)
                } else {
                    // ocurrio un error, push notificacion de error
                    let alertController = UIAlertController(title: "Error", message: "Se ha producido un error", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func ReviewsAction(_ sender: Any) {
        performSegue(withIdentifier: "ReviewSegue", sender: self)
    }
    
}

