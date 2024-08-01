//
//  HeroHeaderUIView.swift
//  Netflix Clone
//
//  Created by  Samet Eğerci on 29.07.2024.
//

import UIKit

class HeroHeaderUIView: UIView {
    
    private let downloadButton: UIButton =  {
        let button = UIButton()
        button.setTitle("Downloads", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        
        
    return button
    }()
    
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        
        
    return button
    }()

    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "ınterstellar")
        return imageView
        
        
    }()
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        
        ]
        gradientLayer.frame = bounds
        
        layer.addSublayer(gradientLayer)
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(downloadButton)
        addSubview(playButton)
        applyConstraints()

        
    }
    
    


    private func applyConstraints() {
        let playButtonConstrait = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            playButton.widthAnchor.constraint(equalToConstant: 120)
        ]
        
        let downloadButtonConstrait = [
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            downloadButton.widthAnchor.constraint(equalToConstant: 120)
        
        ]
        
        NSLayoutConstraint.activate(playButtonConstrait)
        NSLayoutConstraint.activate(downloadButtonConstrait)
    }
    
    public func configure(with model: TitleViewModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {
            return
        }
        
        heroImageView.sd_setImage(with: url,completed: nil)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
        
    }

    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
