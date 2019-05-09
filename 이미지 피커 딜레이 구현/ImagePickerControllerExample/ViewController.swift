//
//  ViewController.swift
//  ImagePickerControllerExample
//
//  Created by giftbot on 2019. 5. 3..
//  Copyright © 2019년 giftbot. All rights reserved.
//
import MobileCoreServices
import UIKit

final class ViewController: UIViewController {
    let customView = CustomView()
    var count = 0
    var bool = true
    let label1 = UILabel()
    
    
    @IBOutlet private weak var imageView: UIImageView!
    // 사진첩에서 사진가지고 오거나, 카메라로 사진 찍을때 사용.
    private let imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerController.delegate = self
    }
    
    @IBAction private func pickImage(_ sender: Any) {
        print("\n---------- [ pickImage ] ----------\n")
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true)
    }
    
    
    @IBAction private func takePicture(_ sender: Any) {
        print("\n---------- [ takePicture ] ----------\n")
        // 이구문은 카메라가 없는 곳에서 사용될때, 앱이 오류나지 않게 사용되기 사용하는 메서드임.. 이걸 써줘야 시뮬레이터에서 작동시 오류가 안남...(애플와치도..)
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
        
        
        imagePickerController.sourceType = .camera
        print(imagePickerController.mediaTypes)
        
        // 둘이 같음.. 스트링보다 문자열이 더 있어보이므로 위에껄로 다룸.
        imagePickerController.mediaTypes = [kUTTypeImage as String]
        //    imagePickerController.mediaTypes = ["public.image"]
        
        //    let mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)
        //    imagePickerController.mediaTypes = mediaTypes ?? []
        
        
        
        present(imagePickerController, animated: true)
    }
    
    @IBAction private func takePictureWithDelay(_ sender: Any) {
        print("\n---------- [ takePictureWithDelay ] ----------\n")
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
        
        imagePickerController.sourceType = .camera
        imagePickerController.mediaTypes = [kUTTypeImage as String]
       
        customView.translatesAutoresizingMaskIntoConstraints = false
        imageView.addSubview(customView)
        customView.label.text = "몇회? :"
        customView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        customView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        customView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        customView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        customView.textField.becomeFirstResponder()

        customView.isHidden = false
        
        customView.textField.delegate = self
        
//        present(imagePickerController, animated: true) {
//
//            //        self.imagePickerController.takePicture() //바로사진찍힘
//            // 2초후에 찍는다? timer or 밑
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
//                self.imagePickerController.takePicture()
//            })
//        }
     
    }
    
    
    @IBAction private func recordingVideo(_ sender: Any) {
        print("\n---------- [ recordingVideo ] ----------\n")
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            return }
        imagePickerController.sourceType = .camera
        
        print(imagePickerController.mediaTypes)
        /////    imagePickerController.mediaTypes = [kUTTypeMovie as String]
        // 둘이 같은 말.. 위아래;;
        //    imagePickerController.mediaTypes = ["public.movie"]
        
        /////    imagePickerController.cameraDevice = .front
        
        
        // 사진과 비디오 한ㅇ꺼번에 등장..;; 위에껏만 쓰던지 밑에ㄱ 것만 쓰던짔ㅆ
        let mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)
        imagePickerController.mediaTypes = mediaTypes ?? []
        
        imagePickerController.cameraCaptureMode = .video
        
        present(imagePickerController, animated: true)
        
        
        //만약 imagePickerController.mediaTypes = ["public.movie"]
        //     imagePickerController.cameraCaptureMode = .photo     라고하면 크레쉬 뜸니다^^
        
        //자동촬영
        //    imagePickerController.startVideoCapture()
        //    imagePickerController.stopVideoCapture()
        
    }
    
    @IBAction private func toggleAllowsEditing(_ sender: Any) {
        print("\n---------- [ toggleAllowsEditing ] ----------\n")
        imagePickerController.allowsEditing.toggle()
        
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //따로 커스텀하게 쓸때만 켄슬함수 쓰자.. 구현안해주면 알아서 켄슬됨^^
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("-----------[didFinishPickingMediaWithInfo]")
        let mediaType = info[.mediaType] as! NSString
        
        if UTTypeEqual(mediaType, kUTTypeImage) {
            //originalImage 무조건있기 때문에 as!
            let originalImage = info[.originalImage] as! UIImage
            //        imageView.image = originalImage
            // editedImage 는 있을수도 없을수도 있기때문에 as?
            let editedImage = info[.editedImage] as? UIImage
            let selectedImage = editedImage ?? originalImage
            imageView.image = selectedImage
            // 현재는 앨범들어갔다가 사진선택하고 다시 앨범들어가면 사진 복사됨..UIImageWriteToSavedPhotosAlbum 이코드때문에.. 방지방법!!!!!
            if picker.sourceType == .camera {
            UIImageWriteToSavedPhotosAlbum(selectedImage, nil, nil, nil)
            }
            
        } else if UTTypeEqual(mediaType, kUTTypeMovie) {
            print("Video info :", info)
            if let mediaPath = (info[.mediaURL] as? NSURL)?.path, UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(mediaPath) {
                UISaveVideoAtPathToSavedPhotosAlbum(mediaPath, nil, nil, nil)
            }
        }
        print("11111")
        picker.dismiss(animated: true)
        
    }
    
    
}

//만약 처음 얼럿이 떳을때 허용안하면, 설정들어가면 바꿀수있음.;
extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        return string.rangeOfCharacter(from: invalidCharacters) == nil && updatedText.count <= 1
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
        count = Int(customView.textField.text!) ?? 0
        customView.isHidden = bool
        present(imagePickerController, animated: true) {
        
            _ = Timer.scheduledTimer(timeInterval: TimeInterval(self.count), target: self, selector: #selector(self.picture), userInfo: nil, repeats: false)
            
            DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                self.imagePickerController.view.addSubview(self.label1)
                self.label1.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
                self.label1.text = "\(self.count)"
                self.label1.textAlignment = .center
                self.label1.font = UIFont.boldSystemFont(ofSize: 300)
                for i in 1...self.count {
                    Timer.scheduledTimer(timeInterval: TimeInterval(i), target: self, selector: #selector(self.changeText), userInfo: nil, repeats: false)
                }
                            })
        }
        return true
    }
    @objc func changeText(){
        if self.count == 1 {
            self.label1.text = ""
        }else {
        self.count -= 1
        self.label1.text = "\(self.count)"
        }
    }
    @objc func picture() {
        self.imagePickerController.takePicture()
    }
}
