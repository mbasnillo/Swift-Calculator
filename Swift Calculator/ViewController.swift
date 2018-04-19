//
//  ViewController.swift
//  Swift Calculator
//
//  Created by Miles R. Basnillo on 19/04/2018.
//  Copyright © 2018 Miles R. Basnillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var number:Double = 0;
    var prevNumber:Double = 0;
    var operation = 0;
    
    var operatorPressed = false;

    @IBOutlet weak var outputLabel: UILabel!
    
    @IBAction func numberPressed(_ sender: UIButton) {
        if (operatorPressed == true) {
            prevNumber = number;
            outputLabel.text = "";
            operatorPressed = false;
        }
        
        outputLabel.text = outputLabel.text! + String(sender.tag);
        number = Double(outputLabel.text!)!;
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if (outputLabel.text != "" && sender.tag != 11 && sender.tag != 16) {
            operatorPressed = true;
            switch sender.tag {
            case 12: //divide
                outputLabel.text = outputLabel.text! + " /";
                break;
            case 13: //multiply
                outputLabel.text = outputLabel.text! + " x";
                break;
            case 14: //subract
                outputLabel.text = outputLabel.text! + " -";
                break;
            case 15: //add
                outputLabel.text = outputLabel.text! + " +";
                break;
            default:
                break;
            }
            
            operation = sender.tag;
        } else if (sender.tag == 11) {
            operatorPressed = true;
            number = 0;
            prevNumber = 0;
            outputLabel.text = "";
        } else if (sender.tag == 16) {
            switch operation {
            case 12:
                outputLabel.text = String(prevNumber / number);
                break;
            case 13:
                outputLabel.text = String(prevNumber * number);
                break;
            case 14:
                outputLabel.text = String(prevNumber - number);
                break;
            case 15:
                outputLabel.text = String(prevNumber + number);
                break;
            default:
                break;
            }
            operatorPressed = true;
            number = Double(outputLabel.text!)!;
            prevNumber = 0;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

