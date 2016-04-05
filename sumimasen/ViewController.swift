//
//  ViewController.swift
//  sumimasen
//
//  Created by HIroki Taniguti on 2016/03/13.
//  Copyright © 2016年 HIroki Taniguti. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer: AVAudioPlayer!
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 再生する audio ファイルのパスを取得
        let audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("audio_23001", ofType: "wav")!)
        
        // auido を再生するプレイヤーを作成する
        var audioError: NSError?
        
        //AVAudioPlayerのインスタンス化
        do{
            audioPlayer = try AVAudioPlayer(contentsOfURL: audioPath, fileTypeHint: nil)
        }catch{
            print("Failed AVAudioPlayer Instance")
        }
        
        
        // エラーが起きたとき
        if let error = audioError {
            print("Error \(error.localizedDescription)")
        }
        
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()

    }

    @IBAction func sumimasen(sender: AnyObject) {
        print("ボタン押した")
        if (audioPlayer.playing ){
//            audioPlayer.stop()
            audioPlayer.currentTime = NSTimeInterval(0)
//            button.setTitle("おわりじゃないもん", forState: UIControlState.Normal)
            print("Stop押した")
        }
        else{
            audioPlayer.play()
//            button.setTitle("おわりじゃないもん", forState: UIControlState.Normal)
            print("Play押した")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

