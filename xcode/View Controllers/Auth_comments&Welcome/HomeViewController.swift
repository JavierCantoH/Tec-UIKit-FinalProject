//
//  HomeViewController.swift
//  FinalProject
//
//  Created by Luis Javier Canto Hurtado on 25/04/21.
//

import UIKit
import FirebaseAuth
import AVFoundation

class HomeViewController: UIViewController {
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var closeSessionButton: UIButton!
    @IBOutlet weak var MenuButton: UIButton!
    
    var audioPlayer = AVAudioPlayer()
    let click = Bundle.main.path(forResource: "click", ofType: "mp3")
    let click2 = Bundle.main.path(forResource: "click2", ofType: "mp3")
    
    var email: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Service2GO"
        print(email!)
        emailLabel?.text = email
    }
    
    @IBAction func closeSessionButtonAction(_ sender: Any) {
        var url: URL!
        
        UIView.animate(withDuration: 1, delay: 0, animations:
            { () -> Void in
                self.closeSessionButton.alpha = 0.5
                self.closeSessionButton.alpha = 1
            
        })
        
        url = URL(fileURLWithPath: click!)
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
        } catch{
            print("Error while playin sound")
        }
        
            do{
                // cierra sesion correctamente, ir a AuthVC
                try Auth.auth().signOut()
                navigationController?.popViewController(animated: true)
            } catch {
                // ocurrio un error, push notificacion de error
                let alertController = UIAlertController(title: "Error", message: "Se ha producido un error", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                self.present(alertController, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func MenuButtonAction(_ sender: Any) {
        // ir a menu
        var url: URL!
        
        UIView.animate(withDuration: 1, delay: 0, animations:
            { () -> Void in
                self.MenuButton.alpha = 0.5
                self.MenuButton.alpha = 1
            
        })
        
        url = URL(fileURLWithPath: click2!)
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
        } catch{
            print("Error while playin sound")
        }
        
        self.performSegue(withIdentifier: "MenuSegue", sender: self)
    }
}
