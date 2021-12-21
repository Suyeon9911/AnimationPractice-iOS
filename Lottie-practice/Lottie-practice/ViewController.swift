//
//  ViewController.swift
//  Lottie-practice
//
//  Created by 김수연 on 2021/12/21.
//

import UIKit

import Lottie

class ViewController: UIViewController {

    // 로티를 사용할 뷰에 대한 정의
    // 로티라이브러리 내에 있는 animationView를 이용하여 JSON파일 재생
    private lazy var lottieView: AnimationView = {
        let animationView = AnimationView(name: "christmas-tree")
        animationView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFit
        animationView.stop()
        animationView.isHidden = true

        return animationView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(lottieView)
    }

    @IBAction func touchUpToStartAnimation(_ sender: Any) {
        lottieView.isHidden = false
        lottieView.play()
    }

    @IBAction func touchUpToPauseAnimation(_ sender: Any) {
        lottieView.pause()
    }

    @IBAction func touchUpToStopAnimation(_ sender: Any) {
        lottieView.isHidden = true
        lottieView.stop()
    }



}

