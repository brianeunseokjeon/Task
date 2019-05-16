//
//  NameWSViewController.swift
//  slack
//
//  Created by brian은석 on 16/05/2019.
//  Copyright © 2019 brian. All rights reserved.
//
import UIKit
import AudioToolbox.AudioServices


class NameWSViewController: UIViewController {
    private let nextButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
//        button.setTitleColor(.init(red: 18/255, green: 90/255, blue: 153/255, alpha: 1.0), for: .selected)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.addTarget(self, action: #selector(didTapNextButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .custom)
        let closeImage = UIImage(named: "btnClose")!
        button.setImage(closeImage, for: .normal)
        button.addTarget(self, action: #selector(didTapCloseButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private let wsNameTextField: UITextField = {
        let textField = UITextField()
        let attrString = NSAttributedString(
            string: "Name your workspace",
            attributes: [.foregroundColor: UIColor.darkText.withAlphaComponent(0.5)]
        )
        
        //placeholder는 기본색깔이 라이트 그레이 인데 이렇게 커스텀?해서 사용가능.
        textField.attributedPlaceholder = attrString
        
        //weight 폰트체를 자세히 다루기 위해 일반폰트보다 가늘게?
        textField.font = UIFont.systemFont(ofSize: 22, weight: .light)
        //입력안하면 리턴키 작용안함.
        textField.enablesReturnKeyAutomatically = true
        textField.borderStyle = .none
        
        // 리턴키를 go라고 바굼.
        textField.returnKeyType = .go
        // 키보드의 자동완성위에 뜨는거 없애주는 것.
        textField.autocorrectionType = .no
        // 첫문자 대문자 귀찮음.
        textField.autocapitalizationType = .none
        return textField
    }()
    
    private let floatingLabel: UILabel = {
        let label = UILabel()
        label.text = "Name your workspace"
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.alpha = 0
        return label
    }()
    private var floatingCenterYConsdt: NSLayoutConstraint!
    
    private let activityIndicatorView: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView(style: .gray)
        indicatorView.hidesWhenStopped = true
        return indicatorView
    }()
    private var indicatorViewLeadingConst: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wsNameTextField.delegate = self
        wsNameTextField.becomeFirstResponder()
    }
    
    private func setupConstraints() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
         nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.centerYAnchor.constraint(equalTo: nextButton.centerYAnchor).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        
        wsNameTextField.layout
            .leading(constant: 16)
            .trailing( constant: -16)
            .centerY(constant: -115)
        
        floatingLabel.layout
        .leading(equalTo: wsNameTextField.leadingAnchor)
        
        
        let defaultCenterYConst = floatingLabel.centerYAnchor.constraint(equalTo: wsNameTextField.centerYAnchor)
        defaultCenterYConst.priority = UILayoutPriority(500)
        defaultCenterYConst.isActive = true
        
        floatingCenterYConsdt = floatingLabel.centerYAnchor.constraint(equalTo: wsNameTextField.centerYAnchor, constant: -30)
        
        floatingCenterYConsdt.priority = .defaultLow //우선순위250
        floatingCenterYConsdt.isActive = true
        
        activityIndicatorView.layout
        .centerY(equalTo: wsNameTextField.centerYAnchor)
        
        indicatorViewLeadingConst = activityIndicatorView.leadingAnchor.constraint(equalTo: wsNameTextField.leadingAnchor)
        indicatorViewLeadingConst.isActive = true
        
    }

    private func setupViews() {
        view.backgroundColor = .white
        //UIViewExtension 코드 사용
        view.addSubviews([nextButton,closeButton])
        view.addSubviews([wsNameTextField,floatingLabel,activityIndicatorView])
        
        navigationController?.navigationBar.isHidden = true
    }

    private func vibration() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
    
    @objc func didTapNextButton(_ sender:UIButton) {
        guard nextButton.isSelected, let text = wsNameTextField.text else { return vibration()}
        guard !activityIndicatorView.isAnimating else { return }
        
        //텍스트 필드 옆에서 작동하는 인디케이터.. 글자수 바로 옆에서 작동..
        let textSize = (text as NSString).size(withAttributes: [.font: wsNameTextField.font!])
        
        indicatorViewLeadingConst.constant = textSize.width + 8
        activityIndicatorView.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.activityIndicatorView.stopAnimating()
          let vc = NextViewController()
            self.present(vc, animated: true)
            vc.textField.text = self.wsNameTextField.text!
            vc.pointSlack()
        }
            
        print(text)
    }
   
    
    
    
    @objc func didTapCloseButton(_ sender:UIButton) {
        dismiss(animated: true)
    }

}

extension NameWSViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        didTapNextButton(nextButton)
        return true
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = textField.text ?? ""
        let replacedText = (text as NSString).replacingCharacters(in: range, with: string)
        
        nextButton.isSelected = !replacedText.isEmpty
        
        
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: {
            if replacedText.isEmpty {
                self.floatingCenterYConsdt.priority = .defaultLow
                self.floatingLabel.alpha = 0.0
            } else {
                self.floatingCenterYConsdt.priority = .defaultHigh
                self.floatingLabel.alpha = 1.0
            }
            //ㅂ ㄹ록에서 변화를 줬는데, priority처럼 오토레이아웃 적용되는 알수없음.. 바로 변화내용 적용시켜라 라는 매소드
            self.view.layoutIfNeeded()
        })
        return true
    }
}
