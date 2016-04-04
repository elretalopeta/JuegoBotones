//
//  ViewController.swift
//  practica02
//
//  Created by usu27 on 26/10/15.
//  Copyright © 2015 usu27. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

var puntuacion: Int=0
var numeros: [Int] = []
var valor: Int!
var count = 30
var timer: NSTimer!
var audioPlayer = AVAudioPlayer()
@IBOutlet weak var tiempo: UILabel!
@IBOutlet weak var button1: UIButton!
@IBOutlet weak var button2: UIButton!
@IBOutlet weak var button3: UIButton!
@IBOutlet weak var button4: UIButton!
@IBOutlet weak var button5: UIButton!
@IBOutlet weak var button6: UIButton!
  
    
    func playSound(sound: String){
        do {
            if let bundle =
                NSBundle.mainBundle().pathForResource(sound, ofType: "mp3") {
                    let alertSound = NSURL(fileURLWithPath: bundle)
                    try
                        AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                    try AVAudioSession.sharedInstance().setActive(true)
                    try audioPlayer = AVAudioPlayer(contentsOfURL:
                        alertSound)
                    audioPlayer.prepareToPlay()
                    audioPlayer.play()
            }
        } catch {
            print(error)
        }
    }
    
func addNumeroAndArray(){

    
        valor = Int(arc4random_uniform(200)) - 100
        button1.setTitle(String(valor), forState: .Normal)
        numeros.append(valor)
        
        valor = Int(arc4random_uniform(200)) - 100
        button2.setTitle(String(valor), forState: .Normal)
        numeros.append(valor)
        
        valor = Int(arc4random_uniform(200)) - 100
        button3.setTitle(String(valor), forState: .Normal)
        numeros.append(valor)
        
        valor = Int(arc4random_uniform(200)) - 100
        button4.setTitle(String(valor), forState: .Normal)
        numeros.append(valor)
        
        valor = Int(arc4random_uniform(200)) - 100
        button5.setTitle(String(valor), forState: .Normal)
        numeros.append(valor)
        
        valor = Int(arc4random_uniform(200)) - 100
        button6.setTitle(String(valor), forState: .Normal)
        numeros.append(valor)
        
        numeros.sortInPlace()
    }
    
@IBAction func buttonAction1(sender: AnyObject) {
 if(Int(button1.titleLabel!.text!) == numeros[0]){
        numeros.removeAtIndex(0)
    playSound("Mario_Power_Up")
   puntuacion++
           button1.hidden = true
    }
 else{ playSound("Mario_Pipe")
 puntuacion--
    button1.hidden = false}
    arrayVacio()
}
   
@IBAction func buttonAction2(sender: AnyObject) {
    if(Int(button2.titleLabel!.text!) == numeros[0]){
            numeros.removeAtIndex(0)
        playSound("Mario_Power_Up")
                   button2.hidden = true
        puntuacion++
    }else{ playSound("Mario_Pipe")
 puntuacion--
        button2.hidden = false}
    arrayVacio()
    }


@IBAction func buttonAction3(sender: AnyObject) {
    if(Int(button3.titleLabel!.text!) == numeros[0]){
            numeros.removeAtIndex(0)
        playSound("Mario_Power_Up")
        puntuacion++
            button3.hidden = true
        }else{ puntuacion--
        playSound("Mario_Pipe")
        button3.hidden = false}
    arrayVacio()
    }


@IBAction func buttonAction4(sender: AnyObject) {
    if(Int(button4.titleLabel!.text!) == numeros[0]){
            numeros.removeAtIndex(0)
        playSound("Mario_Power_Up")
        puntuacion++
            button4.hidden = true
        }else{button4.hidden = false
        puntuacion--
        playSound("Mario_Pipe")}
    arrayVacio()
    }
    

@IBAction func buttonAction5(sender: AnyObject) {
    if(Int(button5.titleLabel!.text!) == numeros[0]){
            numeros.removeAtIndex(0)
        playSound("Mario_Power_Up")
        puntuacion++
            button5.hidden = true
        }else{playSound("Mario_Pipe")
        button5.hidden = false
    puntuacion--}
    arrayVacio()
    }
    

@IBAction func buttonAction6(sender: AnyObject) {
    if(Int(button6.titleLabel!.text!) == numeros[0]){
            numeros.removeAtIndex(0)
        playSound("Mario_Power_Up")
        puntuacion++
            button6.hidden = true
        }else{playSound("Mario_Pipe")
        button6.hidden = false
    puntuacion--}
    arrayVacio()
    }
    
    func update() {
        if(count > 0){
            tiempo.text = String(count--)
        }
        else{
            timer.invalidate()
            let alert = UIAlertController(title: "Game Over", message:
                "Tu puntuación es: "+String(puntuacion), preferredStyle: .Alert)
            let aceptar = UIAlertAction(title: "Aceptar", style:
                .Default, handler: nil)
            alert.addAction(aceptar)
            self.presentViewController(alert, animated: true,
                completion: nil)
        }
    }
    
    func arrayVacio(){
        if(numeros.count==0){
            addNumeroAndArray()
            button1.hidden = false
            button2.hidden = false
            button3.hidden = false
            button4.hidden = false
            button5.hidden = false
            button6.hidden = false
            }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        addNumeroAndArray()
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self,
            selector: Selector("update"), userInfo: nil, repeats: true)
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

