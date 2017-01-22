//
//  ColorsManger.swift
//  
//
//  Created by HIroki Taniguti on 2016/08/17.
//
//

import UIKit
import Colours

final class ColorManager {
    private init() {
    }
    static let sharedSingleton = ColorManager()
    //ピンク
    func pinkColor() -> UIColor {
        return UIColor.init(hex: "E21F7E")
    }
    //ムラサキ
    func murasakiColor() -> UIColor {
        return UIColor.init(hex: "7E4494")
    }
    //ミドリ
    func midoriColor() -> UIColor {
        return UIColor.init(hex: "7DBD00")
    }

    //既存のよくあるボタンの水色のやつ
    func defaultButtonColor() -> UIColor { //skyBuleColor
        return UIColor(red: 19/255.0, green:144/255.0, blue:255/255.0, alpha:1.0)

    }
    
}

