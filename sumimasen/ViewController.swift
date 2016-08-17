//
//  ViewController.swift
//  sumimasen
//
//  Created by HIroki Taniguti on 2016/03/13.
//  Copyright © 2016年 HIroki Taniguti. All rights reserved.
//

import UIKit
import AVFoundation
import Pulsator

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer: AVAudioPlayer!
    let pulsator = Pulsator()

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var pulstorView: UIView!
    
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

        pulstorView.layer.superlayer?.insertSublayer(pulsator, below: pulstorView.layer)
        setupInitialValues()
        let width = button.frame.width
        button.layer.cornerRadius = width / 2 // サイズの半分の値

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        pulstorView.layer.layoutIfNeeded()
        pulsator.position = pulstorView.layer.position
    }

    private func setupInitialValues() {
        pulsator.numPulse = 3
        pulsator.radius = 500.0
        let pulsatorColor = UIColor.purpleColor().CGColor
        pulsator.backgroundColor = pulsatorColor
    }

    @IBAction func sumimasen(sender: AnyObject) {
        print("ボタン押した")
        if (audioPlayer.playing ){
            audioPlayer.currentTime = NSTimeInterval(0)
            print("Stop押した")
        }
        else{
            audioPlayer.play()
            print("Play押した")
            startPlustor()
        }
    }

    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        stopPlustor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func startPlustor() {
        print("startPlustor呼び出し")
        pulsator.start()
    }

    func stopPlustor() {
        print("stopPlustor呼び出し")
        pulsator.stop()
    }
}

