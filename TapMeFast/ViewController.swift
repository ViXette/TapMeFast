//
//  ViewController.swift
//  TapMeFast
//
//  Created by VX on 07/12/2016.
//  Copyright © 2016 VXette. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var timer_label: UILabel!
	@IBOutlet weak var score_label: UILabel!
	@IBOutlet weak var tapMe_button: UIButton!
	@IBOutlet weak var startGame_button: UIButton!
	
	var timer = Timer()
	
	var timeInt = 0
	var tapInt = 0
	

	override func viewDidLoad() {
		super.viewDidLoad()
		
		startingSetup()
		
		tapMe_button.isEnabled = false
		tapMe_button.alpha = 0.5
	}
	
	
	func startingSetup() {
		timeInt = 10
		tapInt = 0
		
		timer_label.text = String(timeInt)
		score_label.text = String(tapInt)
	}


	@IBAction func tapMe(_ sender: UIButton) {
		tapInt += 1
		score_label.text = String(tapInt)
	}
	
	
	@IBAction func startGame(_ sender: UIButton) {
		if timeInt == 10 {
			tapInt = 0
			score_label.text = String(tapInt)
			
			tapMe_button.isEnabled = true
			tapMe_button.alpha = 1
			
			startGame_button.isEnabled = false
			startGame_button.alpha = 0.5
			
			timer = Timer.scheduledTimer(timeInterval: 1,
			                             target: self,
			                             selector: #selector(ViewController.startCounter),
			                             userInfo: nil,
			                             repeats: true)
		}
		
		if timeInt == 0 {
			startingSetup()
			
			startGame_button.setTitle("START GAME", for: [])
		}
	}
	
	
	func startCounter() {
		timeInt -= 1
		timer_label.text = String(timeInt)
		
		if timeInt == 0 {
			timer.invalidate()
			
			tapMe_button.isEnabled = false
			tapMe_button.alpha = 0.5
			
			startGame_button.isEnabled = true
			startGame_button.alpha = 1
			
			startGame_button.setTitle("RESTART", for: [])
		}
	}
	
}

