//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Emma Bradford on 1/12/21.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var gridLabel0: GridLabel!
    @IBOutlet weak var gridLabel1: GridLabel!
    @IBOutlet weak var gridLabel2: GridLabel!
    @IBOutlet weak var gridLabel3: GridLabel!
    @IBOutlet weak var gridLabel4: GridLabel!
    @IBOutlet weak var gridLabel5: GridLabel!
    @IBOutlet weak var gridLabel6: GridLabel!
    @IBOutlet weak var gridLabel7: GridLabel!
    @IBOutlet weak var gridLabel8: GridLabel!
    var labelsArray = [GridLabel]()
    var xTurn = true
    var oTurn = false
    var gameOver = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelsArray.append(gridLabel0)
        labelsArray.append(gridLabel1)
        labelsArray.append(gridLabel2)
        labelsArray.append(gridLabel3)
        labelsArray.append(gridLabel4)
        labelsArray.append(gridLabel5)
        labelsArray.append(gridLabel6)
        labelsArray.append(gridLabel7)
        labelsArray.append(gridLabel8)
    }
    
    @IBAction func onTappedGridLabel(_ sender: UITapGestureRecognizer)
    {
        
        print("I have been tapped on!!! who DARES!!!!!")
        if gameOver
        {
            return
        }
        var canPlay = false
        for label in labelsArray
        {
            if label.canTap
            {
                if label.frame.contains(sender.location(in: backgroundView))
                {
                    if xTurn
                    {
                        label.text = "X"
                    }
                    else
                    {
                        label.text = "O"
                    }
                    xTurn = !xTurn
                    label.canTap = false
                    checkForWinner()
                }
                
            }
            if label.canTap
            {
                canPlay = true
            }
            
        }
        if !canPlay && !gameOver
        {
            displayWinningMessege(message: "Cat's game (tie)")
        }
        
    }
    
    func checkForWinner()
    {
        //winning cells combinations: 012, 345, 678, 036, 147, 258, 048, 246
        checkLine(a: 0, b: 1, c: 2)
        checkLine(a: 3, b: 4, c: 5)
        checkLine(a: 6, b: 7, c: 8)
        checkLine(a: 0, b: 3, c: 6)
        checkLine(a: 1, b: 4, c: 7)
        checkLine(a: 5, b: 8, c: 2)
        checkLine(a: 0, b: 4, c: 8)
        checkLine(a: 4, b: 6, c: 2)
    }
    
    func checkLine(a :Int, b : Int, c: Int)
    {
        if ((labelsArray[a].text != "" && labelsArray[b].text != "" && labelsArray[c].text != "" ) && (labelsArray[a].text == labelsArray[b].text && labelsArray[b].text == labelsArray[c].text))
        {
            displayWinningMessege(message: "\(labelsArray[a].text!) is the winner")
        }
    }
    
    func displayWinningMessege(message: String)
    {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Reset", style: .default)
        {
            (action) -> Void in self.resetGame()
        }
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        gameOver = true
    }
    
    func resetGame()
    {
        for label in labelsArray
        {
            label.text = ""
            label.canTap = true
        }
        xTurn = true
        gameOver = false
    }
}

