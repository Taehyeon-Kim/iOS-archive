# UIKit에서 Preview 사용하기

<br>

### 목차

- 들어가기전에
- 사용방법
- Device rawValue
- 사용모습 (뷰 컨트롤러, 테이블셀)
- Cell(셀)상태에 대해서 코드를 적용하고 싶으면
- 참고자료

### 링크

|   분류    |                                 링크                                 |
| :-------: | :------------------------------------------------------------------: |
| 노션 원문 | https://www.notion.so/UIKit-Preview-f556da4394874757b3eda5b4c499ed7d |

<br>

### 들어가기전에

```
매번 조금의 UI 수정을 하느라 몇 번의 빌드를 하시나요?

몇 번의 CMD+R 키를 누르시죠?

저는 하나의 프로젝트를 하는데도 정말 많이 시뮬레이터를 돌려보는데요.

바로바로 변화를 볼 수가 없으니까 불편하더라고요...

근데 그거 아시나요? SwiftUI는 코드를 짜면서 바로 옆에 프리뷰를 볼 수가 있죠!

이걸 UIKit에도 적용시켜보는겁니다.

원래 불편한 걸 해결하면서 발전하는거죠~😏

평소에 코드로 ui 개발을 즐겼다면 훨씬 유용한 방법일 것 같습니다 :)
```

---

🍎 **Preview를 조금 더 편하게 사용하기 위한 Extensions**

→ 필요할 때 toPreview() 메서드만 호출해서 사용하면 됩니다.

```swift
// UIViewControllerRepresentable extension
//
//  UIViewController+Preview.swift
//  PreviewPractice
//
//  Created by taehy.k on 2021/05/27.
//

import UIKit

#if DEBUG
import SwiftUI

@available(iOS 13, *)
extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        // this variable is used for injecting the current view controller
        let viewController: UIViewController

        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }

    func toPreview() -> some View {
        // inject self (the current view controller) for the preview
        Preview(viewController: self)
    }
}
#endif
```

**더 나은 Extensions!**

- UIView나 셀 단위 작업할때는 아래에 있는게 더 나아보인다..!

```swift
//
//  UIViewPreview.swift
//  PreviewPractice
//
//  Created by taehy.k on 2021/05/27.
//

#if canImport(SwiftUI) && DEBUG
    import SwiftUI

    public struct UIViewPreview<View: UIView>: UIViewRepresentable {
        public let view: View
        public init(_ builder: @escaping () -> View) {
            view = builder()
        }
        // MARK: - UIViewRepresentable
        public func makeUIView(context: Context) -> UIView {
            return view
        }
        public func updateUIView(_ view: UIView, context: Context) {
            view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
            view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        }
    }

    public struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
        public let viewController: ViewController

        public init(_ builder: @escaping () -> ViewController) {
            viewController = builder()
        }

        // MARK: - UIViewControllerRepresentable
        public func makeUIViewController(context: Context) -> ViewController {
            viewController
        }

        @available(iOS 13.0, tvOS 13.0, *)
        @available(OSX, unavailable)
        @available(watchOS, unavailable)
        public func updateUIViewController(_ uiViewController: ViewController, context: UIViewControllerRepresentableContext<UIViewControllerPreview<ViewController>>) {
            return
        }
    }
#endif
```

### 사용방법

- 변화를 확인하고 싶은 뷰 컨트롤러 하단 부에 해당 코드를 적어주고 사용합니다.

```swift
#if DEBUG
import SwiftUI

@available(iOS 13.0, *)
struct VCPreview: PreviewProvider {
		// Device 배열로 여러 개의 디바이스에 적용된 모습을 같이 확인할 수 있습니다.
		// 저는 지금 3가지의 Device를 사용하고 있죠.
    static var devices = ["iPhone SE", "iPhone 11 Pro Max", "iPhone 12"]

    static var previews: some View {
        ForEach(devices, id: \.self) { deviceName in
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController")
								// 익스텐션에서 만든 toPreview() 메서드를 사용하고 있죠!
                .toPreview()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
#endif
```

```swift
//
//  BorderedButton.swift
//  PreviewPractice
//
//  Created by taehy.k on 2021/05/27.
//

import UIKit

class MyBaseButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    func setupView() {
        layer.cornerRadius = 4
        clipsToBounds = true
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13.0, *)
struct BorderedButton_Preview: PreviewProvider {
    static var previews: some View {
				// 이런식으로 사용합니다‼️
        UIViewPreview {
            let button = MyBaseButton(frame: .zero)
            button.setTitle("Follow", for: .normal)
            button.setTitleColor(.blue, for: .normal)
            return button

        }
        .previewLayout(.sizeThatFits)
        .padding(10)
    }
}
#endif
```

### Device rawValue

- 지원하는 rawValue 입니다.
- 아까 만들어두었던 Device 배열에 추가해서 사용하세요!

```swift
// The following values are supported:
//
//     "iPhone 8"
//     "iPhone 8 Plus"
//     "iPhone SE"
//     "iPhone 11"
//     "iPhone 11 Pro"
//     "iPhone 11 Pro Max"
//     "iPad mini 4"
//     "iPad Air 2"
//     "iPad Pro (9.7-inch)"
//     "iPad Pro (12.9-inch)"
//     "iPad (5th generation)"
//     "iPad Pro (12.9-inch) (2nd generation)"
//     "iPad Pro (10.5-inch)"
//     "iPad (6th generation)"
//     "iPad Pro (11-inch)"
//     "iPad Pro (12.9-inch) (3rd generation)"
//     "iPad mini (5th generation)"
//     "iPad Air (3rd generation)"
//     "Apple TV"
//     "Apple TV 4K"
//     "Apple TV 4K (at 1080p)"
//     "Apple Watch Series 2 - 38mm"
//     "Apple Watch Series 2 - 42mm"
//     "Apple Watch Series 3 - 38mm"
//     "Apple Watch Series 3 - 42mm"
//     "Apple Watch Series 4 - 40mm"
//     "Apple Watch Series 4 - 44mm"
```

- 전체코드가 궁금하면 아래를 펼쳐서 확인하세요.
  - 전체코드

### 사용모습 (뷰 컨트롤러, 테이블셀)

<img width="400" alt="스크린샷 2021-05-27 오후 1 59 32" src="https://user-images.githubusercontent.com/61109660/119785258-020e4580-bf0a-11eb-9d30-cd83b05fc19d.png">

[Preview 사용모습 1] 프리뷰로 실시간 변화하는 모습을 확인할 수 있습니다.

### Cell(셀) 상태에 대해서 코드를 적용하고 싶으면

```swift
// XIB로 따로 빼서 셀을 제작한다면 반드시 이런식으로 접근해줘야 화면에 잘 나옵니다.

UINib(nibName: "InstagramDMTVC", bundle: nil)
	.instantiate(withOwner: nil, options: nil).first as! InstagramDMTVC
```

```swift
#if DEBUG
import SwiftUI

struct InstagramDMTVCRepresentable: UIViewRepresentable {
    typealias UIViewType = InstagramDMTVC

    func makeUIView(context: Context) -> InstagramDMTVC {
        return UINib(nibName: "InstagramDMTVC", bundle: nil)
							.instantiate(withOwner: nil, options: nil).first as! InstagramDMTVC
    }

    func updateUIView(_ uiView: InstagramDMTVC, context: Context) {
        uiView.setData(imageName: "profile",
                       name: "test_account",
                       message: "Sounds good 😂😂😂",
                       time: ".now")
    }
}

@available(iOS 13.0, *)
struct InstagramDMTVCPreview: PreviewProvider {
    static var previews: some View {
        Group {
            InstagramDMTVCRepresentable()
                .frame(width: 375, height: 72)
            InstagramDMTVCRepresentable()
                .frame(width: 320, height: 100)
            InstagramDMTVCRepresentable()
                .frame(width: 320, height: 100)
        }
        .previewLayout(.sizeThatFits)
        .padding(10)
    }
}
#endif
```

### 참고자료

[[4월 우아한테크세미나] 만화경 앱 개발기](https://www.youtube.com/watch?v=W_1FoBtaV7A)

[Use Xcode Previews with UIKit](https://fluffy.es/xcode-previews-uikit/)

[SwiftUI 없이 Xcode Preview 사용하기](https://nshipster.co.kr/swiftui-previews/)

[https://gist.github.com/Koze/d7ad0b172794fd3b55fb76ebc6f03051](https://gist.github.com/Koze/d7ad0b172794fd3b55fb76ebc6f03051)
