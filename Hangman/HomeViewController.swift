//
//  HomeViewController.swift
//  Hangman
//
//  Created by Adam Roberts on 3/11/22.
//

import UIKit

class HomeViewController: UIViewController {
    var myTimer: Timer? = nil
    @IBOutlet weak var animation: UIImageView!
    var mainTitle : [UILabel] = []
    @IBOutlet weak var myStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0.1529411765, green: 0.6666666667, blue: 0.8823529412, alpha: 1).cgColor, #colorLiteral(red: 0.06274509804, green: 0.4470588235, blue: 0.7294117647, alpha: 1).cgColor]
        gradientLayer.shouldRasterize = true
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        var frames = [UIImage]()
        var frame: UIImage


        for index in 0..<23 {
            frame = UIImage(named: "frame_\(index)")!
            for _ in 0..<24 {
                frames.append(frame)
            }
        }
        animation.image = UIImage.animatedImage(with: frames, duration: 5.5)
        myTimer = Timer.scheduledTimer(timeInterval: 5.5, target: self, selector: #selector(load), userInfo: nil, repeats: false) //5.5

    }
    
    @objc func load(){
        //var title : [UILabel] = []

        
        animation.removeFromSuperview()
        let horizontalStack = UIStackView()
        horizontalStack.axis = .horizontal
        horizontalStack.alignment = .leading
        horizontalStack.distribution = .equalSpacing;
        horizontalStack.alignment = .center;
        horizontalStack.spacing = 10;
        horizontalStack.addArrangedSubview(UIImageView(image: UIImage(named: "final")))
        for _ in 0...6{
            let label = UILabel()
            label.text = "_"
            label.font = label.font.withSize(40)
            mainTitle.append(label)
            horizontalStack.addArrangedSubview(label)
        }
        myStack.addArrangedSubview(horizontalStack)
        myTimer = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(displayTitle), userInfo: nil, repeats: true)
        
    }
    @objc func displayTitle(){
        for (index,letters) in "HANGMAN".enumerated(){
            if(mainTitle[index].text == "_"){
                mainTitle[index].text = String(letters)
                return
            }
        }
        myTimer = nil
        return
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
