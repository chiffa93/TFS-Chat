//
//  SecondViewController.swift
//  TFS-Chat
//
//  Created by a.kramerov on 23.02.2020.
//  Copyright © 2020 a.kramerov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var changeProfilePictureButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        print(editButton.frame)
//    } приложение падает т.к. свойство frame неизвестно для приложения - editButton ещё не используется
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(editButton.frame)
        editButton.layer.cornerRadius = 10
        editButton.layer.borderWidth = 2
        editButton.layer.borderColor = UIColor.black.cgColor
        if let image = getSavedImage(named: "profilePicture") {
            profilePicture.image = image
        }
    }
    
    override func viewDidLayoutSubviews() {
        changeProfilePictureButton.layer.cornerRadius = changeProfilePictureButton.frame.width / 2
        profilePicture.layer.cornerRadius = changeProfilePictureButton.layer.cornerRadius
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(editButton.frame) //frame различаются потому что во viewDidLoad отображаются размеры фрейма по сторибоарду, а во viewDidAppear эти размеры уже соотносятся со всем текущим лэйаутом девайса, на котором запущено приложение. Поэтому, не стоит использовать расчёты, связанные с фреймами финальных объектов во viewDidLoad
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let presenter = presentingViewController as? MainViewController {
            presenter.profileButton.setImage(profilePicture.image, for: .normal)
        }
    }
    
    
    @IBAction func closePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changePicturePressed(_ sender: Any) {
        let acionSheet = UIAlertController(title: "Выберите источник фотографии", message: nil, preferredStyle: .actionSheet)
        acionSheet.addAction(UIAlertAction(title: "Сделать фото", style: .default, handler: { (UIAlertAction) in
            self.chooseImage(choosenSource: .camera)
        }))
        acionSheet.addAction(UIAlertAction(title: "Выбрать из галереи", style: .default, handler: { (UIAlertAction) in
            self.chooseImage(choosenSource: .photoLibrary)
        }))
        acionSheet.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        self.present(acionSheet, animated: true, completion: nil)
    }
    
    func chooseImage (choosenSource: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(choosenSource) {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = choosenSource
            imagePicker.delegate = self
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func saveImage(image: UIImage) {
        guard let data = image.jpegData(compressionQuality: 1) ?? image.pngData() else {
            return 
        }
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return
        }
        do {
            try data.write(to: directory.appendingPathComponent("profilePicture.png")!)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getSavedImage(named: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
}

extension ProfileViewController {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.profilePicture.image = image
            saveImage(image: image)
            dismiss(animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Ошибка", message: "Что-то пошло не так", preferredStyle: .alert)
            present(alert, animated: true, completion: nil)
        }
    }
}
