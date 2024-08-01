//
//  TitlePreviewViewController.swift
//  Netflix Clone
//
//  Created by  Samet Eğerci on 31.07.2024.
//

import UIKit
import WebKit






class TitlePreviewViewController: UIViewController {

    private let titlesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "Harry potter"
        
        
        return label
    }()
    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "This is the best movie ever the watch as a kid"
        return label
    }()
    
    private let downloadButton: UIButton = {
       let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("Download", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        
        return button
        
        
        
        
    }()
    
    
    private let webView: WKWebView = {
       let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
        
        
        
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(webView)
        view.addSubview(titlesLabel)
        view.addSubview(downloadButton)
        view.addSubview(overviewLabel)
        
        configureConstrait()
        

    }
    func configureConstrait() {
        let webCiewController = [
        
            webView.topAnchor.constraint(equalTo: view.topAnchor,constant: 50),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.heightAnchor.constraint(equalToConstant: 300)
       
        ]
        
        let titleLabelConstrait = [
            titlesLabel.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 20),
            titlesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        
        ]
        
        
        let overViewLabelConstrait = [
            overviewLabel.topAnchor.constraint(equalTo: titlesLabel.bottomAnchor, constant: 15),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        
        ]
        
        let downloadButtonConstrait = [
            downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadButton.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 25),
            downloadButton.widthAnchor.constraint(equalToConstant: 140),
            downloadButton.heightAnchor.constraint(equalToConstant: 40)
        
        ]
        
        NSLayoutConstraint.activate(webCiewController)
        NSLayoutConstraint.activate(titleLabelConstrait)
        NSLayoutConstraint.activate(overViewLabelConstrait)
        NSLayoutConstraint.activate(downloadButtonConstrait)
        
        
    }
    
    
    func configure(with model: TitlePreviewViewModel) {
        titlesLabel.text = model.title
        overviewLabel.text = model.titleOverview
        
        
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeView.id.videoId)") else {
            return
        }
        webView.load(URLRequest(url: url))
    }
    
    

}
