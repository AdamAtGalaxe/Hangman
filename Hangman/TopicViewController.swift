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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func setTopic(_ sender: UIButton) {
        selectedTopic = sender.accessibilityLabel!
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let myButton = sender as! UIButton
        selectedTopic = myButton.accessibilityLabel!
        print(selectedTopic)
        
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
