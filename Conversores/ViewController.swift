//
//  ViewController.swift
//  Conversores
//
//  Created by Guilherme Santos on 12/04/19.
//  Copyright © 2019 Guilherme Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var btUnit1: UIButton!
    @IBOutlet weak var btUnit2: UIButton!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var lbResultUnit: UILabel!
    @IBOutlet weak var lbUnit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showNext(_ sender: UIButton) {
        switch lbUnit.text! {   
            case "Temperatura":
                lbUnit.text = "Peso"
                btUnit1.setTitle("Kilograma", for: .normal)
                btUnit2.setTitle("Libra", for: .normal)
            case "Peso":
                lbUnit.text = "Moeda"
                btUnit1.setTitle("Real", for: .normal)
                btUnit2.setTitle("Dólar", for: .normal)
            case "Moeda":
                lbUnit.text = "Distância"
                btUnit1.setTitle("Metro", for: .normal)
                btUnit2.setTitle("Kilômetro", for: .normal)
            default:
                lbUnit.text = "Temperatura"
                btUnit1.setTitle("Celcius", for: .normal)
                btUnit2.setTitle("Farenheint", for: .normal)
        }
        convert(nil)
    }
    
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender{
            if sender == btUnit1{
                btUnit2.alpha = 0.5
            } else{
                btUnit1.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        switch lbUnit.text! {
        case "Temperatura":
            calcTemperature()
        case "Peso":
            calcWeight()
        case "Moeda":
            calcCurrenty()
        default:
            calcDistance()
        }
        view.endEditing(true)
        let result = Double(lbResult.text!)!
        lbResult.text = String(format: "%.2f", result)
    }
    
    func calcTemperature(){
        guard let temperature = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0{
            lbResultUnit.text = "Farenheint"
            lbResult.text = String(temperature * 1.8 + 32.0)
        } else{
            lbResultUnit.text = "Celcius"
            lbResult.text = String((temperature - 32.0) / 1.8)
        }
    }
    func calcWeight(){
        guard let weight = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0{
            lbResultUnit.text = "libra"
            lbResult.text = String(weight / 2.2046)
        } else{
            lbResultUnit.text = "kilôgrama"
            lbResult.text = String(weight * 2.2046)
        }
    }
    func calcCurrenty(){
        guard let currency = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0{
            lbResultUnit.text = "Dólar"
            lbResult.text = String(currency / 3.5)
        } else{
            lbResultUnit.text = "Real"
            lbResult.text = String(currency * 3.5)
        }
    }
    func calcDistance(){
        guard let distancia = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0{
            lbResultUnit.text = "Kilômetro"
            lbResult.text = String(distancia / 1000.0)
        } else{
            lbResultUnit.text = "Metros"
            lbResult.text = String(distancia * 1000.0)
        }
    }
}
