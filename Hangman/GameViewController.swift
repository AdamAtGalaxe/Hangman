//
//  GameViewController.swift
//  Hangman
//
//  Created by Adam Roberts on 2/7/22.
//

import UIKit

class GameViewController: UIViewController {
    var wrongGuesses : Int = 0
    var topic : String?
    var solution : [String]?
    var myTimer: Timer? = nil
    var letterCount : Int = 0

    
    @IBOutlet weak var hangmanImage: UIImageView!
    @IBOutlet var alphabet: [UILabel]!
    @IBOutlet weak var hintStack: UIStackView!
    @IBOutlet weak var keyboard: UIStackView!
    
    var wordArray: [ [UILabel] ] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0.1529411765, green: 0.6666666667, blue: 0.8823529412, alpha: 1).cgColor, #colorLiteral(red: 0.06274509804, green: 0.4470588235, blue: 0.7294117647, alpha: 1).cgColor]
        gradientLayer.shouldRasterize = true
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        solution = Solutions.select(topic!)
        createHint()

        setupLabelTap()
        
    }
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        let myLabel = sender.view as? UILabel
        let id = myLabel!.text!.character(at: 0)

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
            for (index, word) in solution!.enumerated(){
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
            myTimer = Timer.scheduledTimer(timeInterval: 0.75, target: self, selector: #selector(fail), userInfo: nil, repeats: true)
        }
        if letterCount == 0{
            win()
        }
        
    }
    @objc func fail(){
        for (count, word) in solution!.enumerated(){
            for (index, letters) in word.enumerated(){
                if(wordArray[count][index].text == "_"){
                    wordArray[count][index].text = String(letters)
                    return
                }
            }
        }
        hangmanImage.image = UIImage(named: "loser")
        myTimer?.invalidate()
        playAgain()
    }
    func win(){
        alphabet.forEach{
            $0.removeFromSuperview()
        }
        hangmanImage.image = UIImage(named: "winner")
        playAgain()
    }
    func createHint(){
        for words in solution!{
            let horizontalStack = UIStackView()
            horizontalStack.axis = .horizontal
            horizontalStack.alignment = .center
            horizontalStack.distribution = .equalCentering;
            horizontalStack.alignment = .center;
            horizontalStack.spacing = 20;
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
        yes.frame = CGRect(x: self.view.frame.size.width - 60, y: 60, width: 100, height: 50)
        yes.backgroundColor = UIColor.green
        yes.setTitle("Yes", for: .normal)
        yes.addTarget(self, action: #selector(restart), for: .touchUpInside)
        
        let no = UIButton()
        no.frame = CGRect(x: self.view.frame.size.width - 60, y: 60, width: 100, height: 20)
        no.backgroundColor = UIColor.red
        no.setTitle("No", for: .normal)
        no.addTarget(self, action: #selector(quit), for: .touchUpInside)
        
        let horizontalStack = UIStackView()
        horizontalStack.axis = .horizontal
        horizontalStack.alignment = .fill
        horizontalStack.distribution = .fillEqually;
        horizontalStack.alignment = .center;
        horizontalStack.spacing = 10;
        horizontalStack.addArrangedSubview(yes)
        horizontalStack.addArrangedSubview(no)
        
        let label = UILabel()
        label.text = "Play Again?"
        label.font = label.font.withSize(40)
        label.textAlignment = .center
        horizontalStack.addArrangedSubview(label)
        
        let horizontalStack2 = UIStackView()
        horizontalStack2.axis = .horizontal
        horizontalStack2.alignment = .fill
        horizontalStack2.distribution = .fillEqually;
        horizontalStack2.alignment = .center;
        horizontalStack2.spacing = 10;
        horizontalStack2.addArrangedSubview(yes)
        horizontalStack2.addArrangedSubview(no)

        keyboard.addArrangedSubview(label)
        keyboard.addArrangedSubview(horizontalStack2)
        
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
