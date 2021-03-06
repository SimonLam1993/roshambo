//
//  File.swift
//  roshambo
//
//  Created by simon on 7/5/16.
//  Copyright © 2016 simon. All rights reserved.
//

import UIKit
enum Shape: String {
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"
    
    // This function randomly generates an opponent's play
    static func randomShape() -> Shape {
        let shapes = ["Rock", "Paper", "Scissors"]
        let randomChoice = Int(arc4random_uniform(3))
        return Shape(rawValue: shapes[randomChoice])!
    }
}
class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    var userChoice: Shape!
    private let opponentChoice: Shape = Shape.randomShape()
    
    override func viewWillAppear(animated: Bool){
        super.viewWillAppear(animated)
        displayResult()
    }
    
    private func displayResult(){
        var imageName: String
        var text: String
        let matchup = "\(userChoice.rawValue) vs. \(opponentChoice.rawValue)"
        
        // Why is an exclamation point necessary? :)
        switch (userChoice!, opponentChoice) {
        case let (user, opponent) where user == opponent:
            text = "\(matchup): it's a tie!"
            imageName = "tie"
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            text = "You win with \(matchup)!"
            imageName = "\(userChoice.rawValue)-\(opponentChoice.rawValue)"
        default:
            text = "You lose with \(matchup) :(."
            imageName = "\(opponentChoice.rawValue)-\(userChoice.rawValue)"
        }
        
        imageName = imageName.lowercaseString
        resultImage.image = UIImage(named: imageName)
        resultLabel.text = text
    }
    

    @IBAction private func playAgain() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

