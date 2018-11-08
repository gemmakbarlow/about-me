//
//  MoreDetailsViewController.swift
//  Gemma Barlow
//
//  Created by Gemma Barlow on 4/18/15.
//
//

import UIKit

// GB - normally I'd pop this stuff in Core Data, but it felt like overkill for this app.

private let randomFactData = [
    "At the 2011 WWDC Bash, Michael Franti gave Gem his guitar pick. She has it framed in her bedroom.",
    "Gem once received an app for Valentine's Day; it contained puzzles that revealed cheesy ♡-cartoons. #developerdating",
    "Gem shares a name with the most badass character in Sons of Anarchy.",
    "Gemma has found three bugs in her iOS code whilst dreaming; her subconscious frightens her sometimes.",
    "Gemma wrote the Harry's App entirely in Swift, starting at v1.1",
    "At her first WWDC, Gem queued for The Keynote just a few spots behind Johns Siracusa and Gruber.",
    "Gem couldn't apply for a ticket in 2014 as her little sis scheduled her wedding for June 08 *sigh*"
]

private let twitterProfile = "http://www.twitter.com/gemmakbarlow"
private let linkedInProfile = "http://www.linkedin.com/in/gemmakbarlow"
private let githubProfile = "http://github.com/gemmakbarlow"
private let personalSite = "http://gemmakbarlow.com"

private let revealFactAnimationDuration = 0.3

class MoreDetailsViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var randomFactTitleButton: UIButton!
    @IBOutlet weak var randomFactLabel: UILabel!
    @IBOutlet weak var madeWithLoveLabel: UILabel!
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundGrayColor()
        
        setupCloseButton()
        setupRandomFactTitleLabel()
        setupRandomFactLabel()
        setupMadeWithLoveLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - Setup
    
    private func setupCloseButton() {
        closeButton.setTitleColor(.tealColor(), for: UIControl.State())
    }
    
    private func setupRandomFactTitleLabel() {
        randomFactTitleButton.setTitleColor(.tealColor(), for: UIControl.State())
    }
    
    private func setupRandomFactLabel() {
        randomFactLabel.alpha = Alpha.hide.rawValue
        randomFactLabel.textColor = .white
    }
    
    private func setupMadeWithLoveLabel() {
        madeWithLoveLabel.textColor = .paleBlueColor()
    }
    
    // MARK: - Action
    
    @IBAction func revealFactTapped(sender: UIButton) {
        let randomIndex = Int(arc4random_uniform(UInt32(randomFactData.count)))
        randomFactLabel.text = randomFactData[randomIndex]
        randomFactLabel.alpha = Alpha.hide.rawValue
        
        UIView.animate(withDuration: revealFactAnimationDuration) { [weak self] in
            self?.randomFactLabel.alpha = Alpha.show.rawValue
        }
    }
    
    @IBAction func swipeDownOccurred() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeButtonTapped(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func twitterTapped(sender: UIButton) {
        let twitterURL = URL(string: twitterProfile)
        openURL(url: twitterURL)
    }
    
    @IBAction func linkedInTapped(sender: UIButton) {
        let linkedInURL = URL(string: linkedInProfile)
		openURL(url: linkedInURL)
    }
    
	@IBAction func githubTapped(sender: UIButton) {
        let githubURL = URL(string: githubProfile)
		openURL(url: githubURL)
    }
    
    @IBAction func personalWebsiteTapped(sender: UIButton) {
        let site = URL(string: personalSite)
		openURL(url: site)
    }
    
    private func openURL(url: URL?) {
        guard let url = url else { return }
        UIApplication.shared.open(url, completionHandler: nil)
    }
}
