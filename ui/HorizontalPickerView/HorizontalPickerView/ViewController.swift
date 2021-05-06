//
//  ViewController.swift
//  HorizontalPickerView
//
//  Created by taehy.k on 2021/05/06.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    // pickerView 회전시키기 위한 각도 담는 변수
    var rotationAngle: CGFloat!
    
    // 더미데이터
    var dummyData1: [String] = ["🍎","🍓","🍋","🍇","🥝"]
    var dummyData2: [String] = ["First","Second","Third","Fourth","Fifth"]
    
    // 넓이, 높이 수치 변경 가능
    let width: CGFloat = 100
    let height: CGFloat = 100
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPickerView()
    }
    
    private func setupPickerView() {
    
        // 델리게이트
        pickerView.delegate = self
        pickerView.dataSource = self
        
        // 회전 - 전체 틀을 horizontal로 돌리기 위함
        rotationAngle = -90 * (.pi/180)
        pickerView.transform = CGAffineTransform(rotationAngle: rotationAngle)
        
        // 프레임
        pickerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 100)
        pickerView.center = self.view.center
        
        // 레이어
        pickerView.layer.borderColor = UIColor.darkGray.cgColor
        pickerView.layer.borderWidth = 1.0
        
    }


}

extension ViewController: UIPickerViewDelegate {}

extension ViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // 데이터 개수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dummyData2.count
    }
    
    // 각 아이템 사이즈 (너비)
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return width
    }
    
    // 각 아이템 사이즈 (높이)
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return height
    }
    
    // 컴포넌트 세팅
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        // 선택 시 배경 색상 있는거 제거
        // - 뭐가 바뀐건지 궁금하면 주석 처리하기
        pickerView.subviews.forEach {
            $0.backgroundColor = .clear
        }
        
        // 회전 - 안에 있는 내용물 회전시키기 위함
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: width, height: height)
        view.transform = CGAffineTransform(rotationAngle: 90 * (.pi/180))
        
        // 라벨 설정
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: width, height: height)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.text = dummyData2[row]
        view.addSubview(label)
        
        return view
    }
}
