//
//  GameViewController.swift
//  Hangman
//
//  Created by Adam Roberts on 2/7/22.
//

import UIKit

class GameViewController: UIViewController {
    var wrongGuesses : Int = 0
    let solution : [String] = ["HARRY", "S", "TRUMAN"]
    var myTimer: Timer? = nil
    
    @IBOutlet weak var hangmanImage: UIImageView!
    @IBOutlet var alphabet: [UILabel]!
    @IBOutlet var firstWord: [UILabel]!
    @IBOutlet var secondWord: [UILabel]!
    @IBOutlet var thirdWord: [UILabel]!
    var wordArray: [ [UILabel] ] = []
    //[firstWord, secondWord, thirdWord]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        wordArray = [firstWord, secondWord, thirdWord]
        setupLabelTap()
        print("hello")

        // Do any additional setup after loading the view.
        
    }
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        let myLabel = sender.view as? UILabel
        let id = myLabel!.text!.character(at: 0)
        //sender.view.text = " "
        //var myLabel = sender.view as? UILab
        myLabel!.text = " "
        guess(id!)
    }
        
    func setupLabelTap() {
        alphabet.forEach{
            let tap = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
            tap.numberOfTapsRequired = 1
            //tap.view?.restorationIdentifier =  $0.restorationIdentifier
            $0.isUserInteractionEnabled = true
            $0.addGestureRecognizer(tap)
        }
    }
    
    func guess(_ letter: Character){
        var correct = false
        if letter == " "{
            return
        }
        else {
            for (index, word) in solution.enumerated(){
                let test = word.locations(letter)
                if test != []{
                    correct = true
                    for loc in test{
                        wordArray[index][loc].text = String(letter)
                    }
                }
            }
        }
        if correct == false{
            wrongGuesses += 1
            hangmanImage.image = UIImage(named: "Deadman(\(wrongGuesses))")
            print(wrongGuesses)
        }
        if wrongGuesses == 7{
            myTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(fail), userInfo: nil, repeats: true)
            //fail()
        }
        
    }
    @objc func fail(){
        print("here")
        for (count, word) in solution.enumerated(){
            for (index, letters) in word.enumerated(){
                if(wordArray[count][index].text == "_"){
                    wordArray[count][index].text = String(letters)
                    return
                }
            }
        }
        myTimer?.invalidate()
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
