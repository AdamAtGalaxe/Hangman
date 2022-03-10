//
//  GameViewController.swift
//  Hangman
//
//  Created by Adam Roberts on 2/7/22.
//

import UIKit

class GameViewController: UIViewController {
    var wrongGuesses : Int = 0
    let solution = Solutions.select("usPresidents")
    var myTimer: Timer? = nil
    var letterCount : Int = 0
    
    @IBOutlet weak var hangmanImage: UIImageView!
    @IBOutlet var alphabet: [UILabel]!
    @IBOutlet weak var hintStack: UIStackView!
    

    var wordArray: [ [UILabel] ] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        createHint()

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
                    letterCount -= test.count
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
            alphabet.forEach{
                $0.removeFromSuperview()
            }
            //hangmanImage.image = UIImage(named: "loser")
            myTimer = Timer.scheduledTimer(timeInterval: 0.75, target: self, selector: #selector(fail), userInfo: nil, repeats: true)
            //fail()
        }
        if letterCount == 0{
            win()
        }
        
    }
    @objc func fail(){
        for (count, word) in solution.enumerated(){
            for (index, letters) in word.enumerated(){
                if(wordArray[count][index].text == "_"){
                    wordArray[count][index].text = String(letters)
                    return
                }
            }
        }
        hangmanImage.image = UIImage(named: "loser")
        myTimer?.invalidate()
    }
    func win(){
        alphabet.forEach{
            $0.removeFromSuperview()
        }
        hangmanImage.image = UIImage(named: "winner")
    }
    func createHint(){
        for words in solution{
            let horizontalStack = UIStackView()
            horizontalStack.axis = .horizontal
            horizontalStack.alignment = .fill
            horizontalStack.distribution = .equalCentering;
            horizontalStack.alignment = .center;
            horizontalStack.spacing = 30;
            var wordStack : [UILabel] = []
            for _ in words{
                letterCount += 1
                let label = UILabel()
                label.text = "_"
                label.font = label.font.withSize(40)
                horizontalStack.addArrangedSubview(label)
                wordStack.append(label)
            }
            wordArray.append(wordStack)
            hintStack.addArrangedSubview(horizontalStack)
        }

    }
    func playAgain(){
        let yes = UIButton()
        yes.frame = CGRect(x: self.view.frame.size.width - 60, y: 60, width: 50, height: 50)
        yes.backgroundColor = UIColor.green
        yes.setTitle("Yes", for: .normal)
        yes.addTarget(self, action: #selector(restart), for: .touchUpInside)
        
        let no = UIButton()
        no.frame = CGRect(x: self.view.frame.size.width - 60, y: 60, width: 50, height: 50)
        no.backgroundColor = UIColor.green
        no.setTitle("No", for: .normal)
        no.addTarget(self, action: #selector(quit), for: .touchUpInside)
        
        let horizontalStack = UIStackView()
        horizontalStack.axis = .horizontal
        horizontalStack.alignment = .fill
        horizontalStack.distribution = .equalCentering;
        horizontalStack.alignment = .center;
        horizontalStack.spacing = 30;
        horizontalStack.addArrangedSubview(yes)
        horizontalStack.addArrangedSubview(no)

        
    }
    @objc func restart(sender: UIButton!) {
        print("Button tapped")
    }
    @objc func quit(sender: UIButton!) {
        print("Button tapped")
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
