//
//  ViewController.swift
//  Animation-8week-practice
//
//  Created by 김수연 on 2021/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var targetView: UIView!
    @IBOutlet weak var targetView2: UIView!
    
    var animator: UIViewPropertyAnimator?

    override func viewDidLoad() {
        super.viewDidLoad()
        initAnimator()
        uiViewPropertyAnimator()
    }

    private func initAnimator() {
        // 가장 간단한 생성자를 사용해서 객체 생성,
        animator = UIViewPropertyAnimator(duration: 3, curve: .easeInOut){
            // 후행클로저 기능
            // targetView의 크기를 가로세로 100으로 조절하고 위치를 화면 중앙으로 오도록 추가
            self.targetView.frame = CGRect(x: self.view.center.x - 50 ,
                                           y: self.view.center.y - 50 ,
                                           width: 100,
                                           height: 100)
        }

        // addanimation을 사용하여 배경색이 변하는 또 다른 애니메이션을 추가해보겠습니다.
        animator?.addAnimations {
            self.targetView.backgroundColor = .orange
        }
        // 해당 애니메이션이 완료된 후 호출될 수 있도록 addCompletion을 추가해보겠습니다!

        animator?.addCompletion { position in
            // 후행클로저로 작성하되, 파라미터가 있는 경우에는 파아미터로 대신할 수 있는 변수명을 사용.
            // 넘겨져올 uiviewAnimatingPositon 타입의 파라미터 = postion
            print(position.rawValue)
        }

        // 클로저에서 파라미터 변수를 지정하지 않으려면 ? 넘겨진 파라미터를 $0으로 사용. 넘겨져온 파라미터 3개면 $0, $1, $2
    }

    private func uiViewPropertyAnimator() {
        // 일회용이 아니라 재사용, 타이밍 조정하고 싶다면 animation 저장 변수를 함수 밖에 정의
        let animation = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 3, delay: 0, options: .curveEaseInOut) {
            self.targetView2.frame = .init(x: 100, y: 300, width: 150, height: 200)
        }

        animation.addAnimations({ self.targetView2.backgroundColor = .blue }, delayFactor: 0.5)

        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            animation.pauseAnimation()
            DispatchQueue.main.asyncAfter(deadline: .now()+0.7) { animation.startAnimation()
                DispatchQueue.main.asyncAfter(deadline: .now()+0.5) { animation.stopAnimation(false)
                animation.finishAnimation(at: .start)
                }
            }
        }

    }

    @IBAction func touchUpToStartAnimation(_ sender: Any) {
        animator?.startAnimation()
        animator?.addAnimations {
            // start를 누른다고 새로 시작되는 게 아니라 애니메이션이 제거되기 때문에 새로 addanimation을 넣어주기
        }
    }

    @IBAction func touchUpToPauseAnimation(_ sender: Any) {
        animator?.pauseAnimation()
    }

    @IBAction func touchUpToStopAnimation(_ sender: Any) {
        // withoutFinishing: true 는 별도의 마무리 없이 정지되며, 애니메이션 제거 후 inactive로 돌아감.
        // false일 경우, 완전히 애니메이션이 제거되지 않는 stopped 상태가 되기 때문에 finishAnimation과 함께 사용됨 -> inactive
        animator?.stopAnimation(true)

//        animator?.stopAnimation(false)
//        animator?.finishAnimation(at: .current)
    }
    


}

