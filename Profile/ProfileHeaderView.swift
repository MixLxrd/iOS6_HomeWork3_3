//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Михаил Ильченко on 06.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {
    
    //var avatarWidht: Double
    
    private let nicknameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Hipster Waiter"
        return label
    }()
    
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textField.textColor = .gray
        textField.text = "Waiting for something..."
        //textField.addTarget(self, action: #selector(nicknameChanged(_ :)), for: .editingChanged)
        return textField
    }()

    private lazy var changeTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.text = "  Waiting for something"
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 12
        return textField
    }()
    
    private lazy var showStatusButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.layer.cornerRadius = 4 //закругление
        button.layer.shadowOffset = CGSize(width: 4, height: 4) //??
        button.layer.shadowRadius = 4 //тень закруглений?
        button.layer.shadowColor = UIColor.black.cgColor // цвет тени
        button.layer.shadowOpacity = 0.7 //прозрачность тени
        
        button.backgroundColor = .blue
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        button.addTarget(self, action: #selector(showStatusButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var avatarImage: UIImageView = {
        var image = UIImageView()
        image.layer.borderWidth = 3
        //image.layer.cornerRadius = CGFloat(avatarWidht/2)
        image.layer.cornerRadius = 75
        image.clipsToBounds = true
        image.layer.borderColor = UIColor.white.cgColor
        //print(image.frame.width)
        return image
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
        }

        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupViews()
        }
    
    @objc private func showStatusButtonPressed() {
        statusTextField.text = changeTextField.text
        //print("You tap the button. I'm do nothing")
    }
    
    @objc private func nicknameChanged(_ textField: UITextField) {
        nicknameLabel.text = statusTextField.text
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
            
        nicknameLabel.sizeToFit()
        nicknameLabel.frame = CGRect(
            x: self.center.x - (nicknameLabel.frame.height),
            y: self.safeAreaInsets.top + 27,
            width: showStatusButton.frame.maxX - self.safeAreaInsets.right - 16,
            height: nicknameLabel.frame.height)
        
        //не знаю как исправить ширину label
        
        
        statusTextField.sizeToFit()
        statusTextField.frame = CGRect(
            x: self.center.x - (nicknameLabel.frame.height),
            y: nicknameLabel.frame.maxY + 27*2,
            width: statusTextField.frame.width,
            height: statusTextField.frame.height)
        
        showStatusButton.sizeToFit()
        showStatusButton.frame = CGRect(
            x: 16,
            y: changeTextField.frame.maxY + 34,
            width: self.frame.width - 16*2,
            height: 50)
        
        changeTextField.sizeToFit()
        changeTextField.frame = CGRect(
            x: self.center.x - (nicknameLabel.frame.height),
            y: statusTextField.frame.maxY + 27,
            width: 200,
            height: 40)
        
        avatarImage.sizeToFit()
        avatarImage.frame = CGRect(
            x: safeAreaInsets.left + 16,
            y: safeAreaInsets.top + 16,
            width: changeTextField.frame.maxY - self.safeAreaInsets.top - 16*2,
            height: changeTextField.frame.maxY - self.safeAreaInsets.top - 16*2)
        
       
        //avatarWidht = Double(nicknameLabel.frame.width)
        //print(showStatusButton.frame.maxY)
        //print(showStatusButton.frame.minY)
    }
    
    
    private func setupViews() {
        self.addSubview(nicknameLabel)
        self.addSubview(statusTextField)
        self.addSubview(showStatusButton)
        self.addSubview(changeTextField)
        self.addSubview(avatarImage)
            
        avatarImage.image = #imageLiteral(resourceName: "waiter")
        }
    
    
}
