//
//  DetailWorkerViewController.swift
//  FinalProject
//
//  Created by Luis Javier Canto Hurtado on 02/05/21.
//

import UIKit
import Cosmos
import TinyConstraints
import AVFoundation

class DetailWorkerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var pickerData = NSMutableArray()
    let path = Bundle.main.path(forResource: "Data", ofType: "plist")

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var horarioLbl: UILabel!
    @IBOutlet weak var dineroLbl: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var selectService: UIButton!
    
    var audioPlayer = AVAudioPlayer()
    let click = Bundle.main.path(forResource: "click", ofType: "mp3")
    
    var image = UIImage()
    var name = ""
    
    lazy var cosmosView: CosmosView = {
        var view = CosmosView()
        //view.settings.updateOnTouch = false
        //view.settings.totalStars = 10
        view.settings.starSize = 20
        view.settings.starMargin = 3.3
        view.settings.fillMode = .full
        view.text = "Calificación de Usuarios"
        view.settings.textColor = .red
        view.settings.textMargin = 10
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        lbl.text = "You selected \(name) for this"
        lbl.text = name
        img.image = image
        pickerData = NSMutableArray(contentsOfFile: path!)!
        picker.dataSource = self
        picker.delegate = self
        view.addSubview(cosmosView)
        cosmosView.centerInSuperview()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return (pickerData[row] as! String)
    }
    
    @IBAction func selectService(_ sender: Any) {
        
        var url: URL!
        
        UIView.animate(withDuration: 1, delay: 0, animations:
            { () -> Void in
                self.selectService.alpha = 0.5
                self.selectService.alpha = 1
        })
        
        url = URL(fileURLWithPath: click!)
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
        } catch{
            print("Error while playin sound")
        }
        
        let alert = UIAlertController(title: "Selected", message: (pickerData[picker.selectedRow(inComponent: 0)] as! String), preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        dineroLbl.text = "$\(String(Int(sender.value)))"
    }
}
