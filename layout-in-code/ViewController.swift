//
//  ViewController.swift
//  layout-in-code
//
//  Created by Тауекел on 22.11.2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "iOS dev"
        label.textColor = .blue
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        label.numberOfLines = 5
        
        return label
    }()
    
    private lazy var ourButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.clipsToBounds = true
        button.setTitle("Touch me!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(ourButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var ourTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .white
        textField.textAlignment = .center
        textField.placeholder = "Type your text here..."
        textField.backgroundColor = .systemBlue
        
        return textField
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImage(named: "steve_jobs")
        let highlightedImage = UIImage(named: "together")
        let imageView = UIImageView(image: image, highlightedImage: highlightedImage)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.backgroundColor = .systemGreen
        
        return imageView
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.spacing = 30
        stack.addArrangedSubview(imageView)
        
        return stack
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(ourButton)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            ourButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ourButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ourButton.widthAnchor.constraint(equalToConstant: 250),
            ourButton.heightAnchor.constraint(equalToConstant: 70)
        ])
    }

    // MARK: - Actions
    
    @objc private func ourButtonPressed() {
        label.textColor = getRandomColor()
    }
    
    func getRandomColor() -> UIColor {
         // Generate between 0 to 1
         let red: CGFloat = CGFloat(drand48())
         let green: CGFloat = CGFloat(drand48())
         let blue: CGFloat = CGFloat(drand48())

         return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }

}

