//
//  ShakeyBellView.swift
//  Bank
//
//  Created by Asadullah Behlim on 24/01/23.
//

import Foundation

import UIKit

class ShakeyBellView: UIView  {
    
    let imageView = UIImageView()
    let buttonView = UIButton()
    let buttonHeight : CGFloat = 16
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 48, height: 48)
    }
}


extension ShakeyBellView {
    func style()
    {
       translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "bell.fill")!.withTintColor(.white, renderingMode: .alwaysOriginal)
        imageView.image = image
        
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.backgroundColor = .systemRed
        buttonView.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        buttonView.layer.cornerRadius = buttonHeight/2
        buttonView.setTitle("9", for: .normal)
        buttonView.setTitleColor(.white, for: .normal)
        
    }
    
    
    func layout() {
        addSubview(imageView)
        addSubview(buttonView)
        //ImageView Constraint
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 27),
            imageView.widthAnchor.constraint(equalToConstant: 27),
       
        ])
        
        //ButtonView Constraint
        NSLayoutConstraint.activate([
            buttonView.topAnchor.constraint(equalTo: imageView.topAnchor),
            buttonView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -9),
            buttonView.heightAnchor.constraint(equalToConstant: 16),
            buttonView.widthAnchor.constraint(equalToConstant: 16),
       
        ])
        
    }
    
    
}


extension ShakeyBellView {
    
    func setup() {
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_: )))
        imageView.addGestureRecognizer(singleTap)
        imageView.isUserInteractionEnabled = true
    }
}

// MARK: - Actions
extension ShakeyBellView {
    @objc func imageViewTapped(_ recognizer: UITapGestureRecognizer) {
        shakeWith(duration: 1, angle: .pi/8, yOffset: 0.0)
    }
    
    private func shakeWith(duration: Double, angle: Float, yOffset: CGFloat) {
        let noofFrames: Double = 6
        let frameDuration = Double(1/noofFrames)
        
      //  imageView.setAnchorPoint(CGPoint(x: 0.5, y: yOffset)
        
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: [],
        animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: frameDuration)
            {
                self.imageView.transform = CGAffineTransform(rotationAngle: CGFloat(-angle))
            }
            UIView.addKeyframe(withRelativeStartTime: frameDuration, relativeDuration: frameDuration) {
                self.imageView.transform = CGAffineTransform(rotationAngle: CGFloat( +angle))
            }
            
            UIView.addKeyframe(withRelativeStartTime: frameDuration*2, relativeDuration: frameDuration) {
                self.imageView.transform = CGAffineTransform(rotationAngle: CGFloat( -angle))
            }
           
            UIView.addKeyframe(withRelativeStartTime: frameDuration*3, relativeDuration: frameDuration) {
                self.imageView.transform = CGAffineTransform(rotationAngle: CGFloat( +angle))
            }
            UIView.addKeyframe(withRelativeStartTime: frameDuration*4, relativeDuration: frameDuration) {
                self.imageView.transform = CGAffineTransform(rotationAngle: CGFloat( -angle))
            }
            
            UIView.addKeyframe(withRelativeStartTime: frameDuration*5, relativeDuration: frameDuration) {
                self.imageView.transform = CGAffineTransform.identity
            }
        },
        completion: nil
        )
    }
}
