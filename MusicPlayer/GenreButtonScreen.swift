//
//  GenreButtonScreen.swift
//  MusicPlayer
//
//  Created by Lucas Dahl on 10/19/18.
//  Copyright © 2018 Lucas Dahl. All rights reserved.
//

import UIKit
import MediaPlayer

class GenreButtonScreen: UIViewController {
    
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    // This is the main buttons
    @IBAction func genreButtonTapped(_ sender: UIButton) {
        
        // Checks for user permission to play music from library
        MPMediaLibrary.requestAuthorization { (status) in
            
            // Check if the status is authorized
            if status == .authorized {
                
                // plays the button genre that is picked
                self.playGenre(genre: sender.currentTitle!)
                
            }// else statment would be for error handling
            
        }
        
    }
    
    // This is for the stopped button -- changed to pause
    @IBAction func stoppedButtonTapped(_ sender: UIButton) {
        
        // Stops the music
        musicPlayer.stop()
        
        // for pausing music
        var musicPause = true
        
        // changing to pause and unpasue -- Needs work.
        /*if musicPause == false {
            musicPlayer.play()
            print("play")
            musicPause = true
        } else if musicPause == true {
            musicPlayer.pause()
            print("stop")
            musicPause = false
        }*/
        
    }
    
    // This is for the next button
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
        // This plays the next song
        musicPlayer.skipToNextItem()
        
    }
    
    // This plays the genre
    func playGenre(genre: String) {
        
        // Stops the previous music
        musicPlayer.stop()
        
        // Makes a query for music
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        // Adds a filter for genre and applies it
        query.addFilterPredicate(predicate)
        
        // Plays just the genre picked
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        
        // Plays the music
        musicPlayer.play()
        
    }
    
}// End class
