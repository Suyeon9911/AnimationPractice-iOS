## AnimationPractice-iOS

WE SOPT 29기 8차 세미나 자료 정리 

🥑 Animation
- 사용자와 화면 속의 콘텐츠 사이에 시각적인 연결성을 만들어줌 
- 상황을 전달, 피드백을 제공
- 직접적인 조작감을 향상하고 사용자들의 동작에 대한 결과를 시각화
- 지나친 애니메이션은 산만한 느낌을 줄 수 있음
- 움직임이 물리법칙에 위배되지 않도록
- 일관된 애니메이션 사용

🙋🏻‍♂️ Animation State
- Inactive : 초기 상태, 애니메이션이 완료되면 다시 돌아오는 상태
- active : statAnimation, pauseAnimation을 호출하자마자 애니메이터가 활성화 , 애니메이션이 자연스럽게 끄나거나 stopAnimation 메서드가 호출 될때 까지 이 상태를 유지 
- stopped : 애니메이터는 stopAnimation을 호출하면 이 상태로 들어갑니다 , 애니메이터는 재구성 및 inactive 없이 먼저 active 상태로 돌아올 수 없습니다. 

👀 UIPropertyAnimator 
- iOS10부터 지원, 애니메이션을 실행하는 클래스
- 애니메이션 시작, 중지, 일시정지 , 완료 등을 설정가능
- 해당 클래스는 UIViewAnimating 프로토콜을 채택한 UIViewImplicitlyAnimating 프로토콜을 다시 채택한 클래스 
- 애니메이션이 완료 되기 전에 동적으로 수정 가능
- 처음부터 끝까지 동작시키던가 도중에 인터렉션 애니메이션으로 전환해서 타이밍 조절 

📌 init 
- duration : 애니메이션 지속 시간
- curve : 애니메이션 곡선 지정
- animations : 실제로 애니메이션 될 closure 

🫒 애니메이션이 가능한 속성
- frame/bounds/center: 뷰의 위치와 크기 
- transform: 좌표행렬값
- alpha: 투명도
- backgroundColor: 배경색
- contentStretch: 확대/축소영역

hidden과 같이 중간값 계산이 불가능한 속성은 애니메이션이 안됨.

✨ runningPropertyAnimator 
- duration
- delay : 애니매이션을 시작하기 전에 대기할 시간
- options : 애니메이션에 적용할 옵션 
- animations : 실제로 애니메이션이 될 closure
- completion : 애니메이션이 끝나면 실행할 closure



