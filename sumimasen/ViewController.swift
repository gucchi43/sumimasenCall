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
    
    var NNAudioPlayer: AVAudioPlayer!
    var NAAudioPlayer: AVAudioPlayer!
    var GNAudioPlayer: AVAudioPlayer!
    var GAAudioPlayer: AVAudioPlayer!

    let pulsator = Pulsator()
    let secondPulastor = Pulsator()

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var pulstorView: UIView!
    
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var secondPulstorView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 再生する audio ファイルのパスを取得
        let audioNNPath = URL(fileURLWithPath: Bundle.main.path(forResource: "NN", ofType: "m4a")!)
        let audioNAPath = URL(fileURLWithPath: Bundle.main.path(forResource: "NA", ofType: "m4a")!)
        let audioGNPath = URL(fileURLWithPath: Bundle.main.path(forResource: "GN", ofType: "wav")!)
        let audioGAPath = URL(fileURLWithPath: Bundle.main.path(forResource: "GA", ofType: "wav")!)


        // auido を再生するプレイヤーを作成する
        var audioError: NSError?
        
        //AVAudioPlayerのインスタンス化
        do{
            NNAudioPlayer = try AVAudioPlayer(contentsOf: audioNNPath, fileTypeHint: nil)
            NAAudioPlayer = try AVAudioPlayer(contentsOf: audioNAPath, fileTypeHint: nil)
            GNAudioPlayer = try AVAudioPlayer(contentsOf: audioGNPath, fileTypeHint: nil)
            GAAudioPlayer = try AVAudioPlayer(contentsOf: audioGAPath, fileTypeHint: nil)
        }catch{
            print("Failed AVAudioPlayer Instance")
        }

        // エラーが起きたとき
        if let error = audioError {
            print("Error \(error.localizedDescription)")
        }
        
        NNAudioPlayer.delegate = self
        NNAudioPlayer.prepareToPlay()
        NAAudioPlayer.delegate = self
        NAAudioPlayer.prepareToPlay()
        GNAudioPlayer.delegate = self
        GNAudioPlayer.prepareToPlay()
        GAAudioPlayer.delegate = self
        GAAudioPlayer.prepareToPlay()

        pulstorView.layer.superlayer?.insertSublayer(pulsator, below: pulstorView.layer)
        setupInitialValues()
        let width = button.frame.width
        button.layer.cornerRadius = width / 2 // サイズの半分の値

        secondPulstorView.layer.superlayer?.insertSublayer(secondPulastor, above: secondPulstorView.layer)
        secondSetupInitialValues()
        let secondWidth = secondButton.frame.width
        secondButton.layer.cornerRadius = secondWidth / 2

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        pulstorView.layer.layoutIfNeeded()
        pulsator.position = pulstorView.layer.position

        secondPulstorView.layer.layoutIfNeeded()
        secondPulastor.position = pulstorView.layer.position
    }

    fileprivate func setupInitialValues() {
        pulsator.numPulse = 3
        pulsator.radius = 800.0
        pulsator.animationDuration = 1
        let pulsatorColor = ColorManager.sharedSingleton.midoriColor().cgColor
//        let pulsatorColor = UIColor.purpleColor().CGColor
        pulsator.backgroundColor = pulsatorColor
    }

    fileprivate func secondSetupInitialValues() {
        secondPulastor.numPulse = 3
        secondPulastor.radius = 800.0
        secondPulastor.animationDuration = 1
        let pulsatorColor = ColorManager.sharedSingleton.pinkColor().cgColor
        //        let pulsatorColor = UIColor.purpleColor().CGColor
        secondPulastor.backgroundColor = pulsatorColor
    }



    @IBAction func sumimasen(_ sender: AnyObject) {
        print("ボタン押した")

        //0から9までの値を取得する(現在5分の１でおこ)
        let random = arc4random_uniform(5)
        print("random", random)
        switch random {
        case 0://secondをPlay
            if NAAudioPlayer.isPlaying || NNAudioPlayer.isPlaying || GNAudioPlayer.isPlaying || GAAudioPlayer.isPlaying{
                print("再生中におしても反応させない")
            }else {
                NAAudioPlayer.play()
                print("second,Play押した")
                startPlustor(1)
            }

//            if NNAudioPlayer.playing {
//                NNAudioPlayer.currentTime = NSTimeInterval(0)
//                NNAudioPlayer.pause()
//                NAAudioPlayer.play()
//                print("one→second,Stop押した")
//            }
//            if NAAudioPlayer.playing {
//                NAAudioPlayer.currentTime = NSTimeInterval(0)
//                print("second→second,Stop押した")
//            }
//            else {
//                NAAudioPlayer.play()
//                print("second,Play押した")
//                startPlustor(1)
//            }
        default://oneをplay
            if NAAudioPlayer.isPlaying || NNAudioPlayer.isPlaying || GNAudioPlayer.isPlaying || GAAudioPlayer.isPlaying{
                print("再生中におしても反応させない")
            }else {
                NNAudioPlayer.play()
                print("second,Play押した")
                startPlustor(1)
            }
//            if NNAudioPlayer.playing {
//                NAAudioPlayer.currentTime = NSTimeInterval(0)
//                print("one→one,Stop押した")
//            }
//            if NAAudioPlayer.playing {
//                NAAudioPlayer.currentTime = NSTimeInterval(0)
//                NAAudioPlayer.pause()
//                NNAudioPlayer.play()
//                print("second→one,Stop押した")
//            }
//            else {
//                NNAudioPlayer.play()
//                print("one,Play押した")
//                startPlustor(1)
//            }
        }
    }

    @IBAction func secondSuimasenn(_ sender: AnyObject) {
        //0から9までの値を取得する(現在5分の１でおこ)
        let random = arc4random_uniform(5)
        print("random", random)
        switch random {
        case 0://secondをPlay
            if NAAudioPlayer.isPlaying || NNAudioPlayer.isPlaying || GNAudioPlayer.isPlaying || GAAudioPlayer.isPlaying{
                print("再生中におしても反応させない")
            }else {
                GAAudioPlayer.play()
                print("second,Play押した")
                startPlustor(2)
            }
//            if GNAudioPlayer.playing {
//                GNAudioPlayer.currentTime = NSTimeInterval(0)
//                GNAudioPlayer.pause()
//                GAAudioPlayer.play()
//                print("one→second,Stop押した")
//            }
//            if GAAudioPlayer.playing {
//                GAAudioPlayer.currentTime = NSTimeInterval(0)
//                print("second→second,Stop押した")
//            }
//            else {
//                GAAudioPlayer.play()
//                print("second,Play押した")
//                startPlustor(2)
//            }
        default://oneをplay
            if NAAudioPlayer.isPlaying || NNAudioPlayer.isPlaying || GNAudioPlayer.isPlaying || GAAudioPlayer.isPlaying{
                print("再生中におしても反応させない")
            }else {
                GNAudioPlayer.play()
                print("second,Play押した")
                startPlustor(2)
            }
//            if GNAudioPlayer.playing {
//                GNAudioPlayer.currentTime = NSTimeInterval(0)
//                print("one→one,Stop押した")
//            }
//            if GAAudioPlayer.playing {
//                GAAudioPlayer.currentTime = NSTimeInterval(0)
//                GAAudioPlayer.pause()
//                GNAudioPlayer.play()
//                print("second→one,Stop押した")
//            }
//            else {
//                GNAudioPlayer.play()
//                print("one,Play押した")
//                startPlustor(2)
//            }
        }
    }


    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        stopPlustor(1)
        stopPlustor(2)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func startPlustor(_ number: Int) {
        switch number {
        case 1:
            print("2:startPlustor呼び出し")
            pulsator.start()
        case 2:
            print("2:startPlustor呼び出し")
            secondPulastor.start()
        default:
            break
        }
    }

    func stopPlustor(_ number: Int) {
        print("stopPlustor呼び出し")
        switch number {
        case 1:
            print("2:startPlustor呼び出し")
            pulsator.stop()
        case 2:
            print("2:startPlustor呼び出し")
            secondPulastor.stop()
        default:
            break
        }



    }
}

