//
//  TimelineDetailViewController.swift
//  Gemma Barlow
//
//  Created by Gemma Barlow on 4/18/15.
//
//

import UIKit

private let timelineData = [
    "At the 2011 WWDC Bash, Michael Franti gave Gem his guitar pick. She has it framed in her bedroom.",
    "The only Valentine's Day present Gem has ever received was an app; it contained 10 puzzles that when completed revealed cheesy love-cartoons.",
    "Yep, she shares a name with the character from Sons of Anarchy",
    "Gemma has found three bugs in her iOS code whilst dreaming; her subconscious frightens her sometimes.",
    "Gemma is writing the Harry's App * entirely * in Swift.",
    "Gemma didn't appy for a ticket in 2014 as her little sister got married for June 08 in Australia * sigh *"
]

class TimelineDetailViewController: UIViewController {

    @IBOutlet weak var randomFactLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        randomFactLabel.alpha = 0.0
        view.backgroundColor = UIColor.backgroundGrayColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    @IBAction func revealFactTapped(sender: UIButton) {
        let randomIndex = Int(arc4random_uniform(UInt32(timelineData.count)))
        randomFactLabel.text = timelineData[randomIndex]
        randomFactLabel.alpha = 0.0
        
        UIView.animateWithDuration(0.3, animations: {
            self.randomFactLabel.alpha = 1.0
        })
    }
    
    @IBAction func swipeDownOccurred() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func closeButtonTapped(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
