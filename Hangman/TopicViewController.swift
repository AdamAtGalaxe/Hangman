//
//  TopicViewController.swift
//  Hangman
//
//  Created by Adam Roberts on 3/11/22.
//

import UIKit

class TopicViewController: UIViewController {
    var selectedTopic : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0.1529411765, green: 0.6666666667, blue: 0.8823529412, alpha: 1).cgColor, #colorLiteral(red: 0.06274509804, green: 0.4470588235, blue: 0.7294117647, alpha: 1).cgColor]
        gradientLayer.shouldRasterize = true
        self.view.layer.insertSublayer(gradientLayer, at: 0)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func setTopic(_ sender: UIButton) {
        selectedTopic = sender.accessibilityLabel!
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let myButton = sender as! UIButton
        selectedTopic = myButton.accessibilityLabel!
        
        let gameViewController = segue.destination as! GameViewController
        gameViewController.topic = selectedTopic


    }

  /*
    // MARK: - Navigation
          case "usPresidents":
              let mySelection = usPresidents[Int.random(in: 1..<myArray.count)].uppercased()
              return mySelection.components(separatedBy: " ")
          case "composers":
              
          case "rockBands":
              
          case "usCities"
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
