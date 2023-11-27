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
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var ourButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        button.setTitle("Touch me!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(ourButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var ourTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .white
        textField.textAlignment = .center
        textField.layer.cornerRadius = 5
        textField.placeholder = "Type your text here..."
        textField.backgroundColor = .systemBlue
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImage(named: "steve_jobs")
        let highlightedImage = UIImage(named: "together")
        let imageView = UIImageView(image: image, highlightedImage: highlightedImage)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20
        imageView.backgroundColor = .systemGreen
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.spacing = 30
        stack.addArrangedSubview(imageView)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
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
        view.addSubview(label)
        view.addSubview(ourTextField)
        view.addSubview(stack)
    }

    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            // Constraints for stack
            stack.topAnchor.constraint(equalTo: ourTextField.bottomAnchor, constant: 20),
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            // Constraints for label
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Constraints for ourTextField
            ourTextField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            ourTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ourTextField.widthAnchor.constraint(equalToConstant: 300),
            ourTextField.heightAnchor.constraint(equalToConstant: 50),
            
            // Constraints for imageView
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            // Constraints for ourButton
            ourButton.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 20),
            ourButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ourButton.widthAnchor.constraint(equalToConstant: 300),
            ourButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }


    // MARK: - Actions
    
    @objc private func ourButtonPressed() {
        label.textColor = getRandomColor()
        
        if ourTextField.text != "" {
            label.text = ourTextField.text
            
            if label.text == "Jobs" {
                imageView.isHighlighted = false
            } else if label.text?.lowercased() == "Wozniak".lowercased() {
                imageView.isHighlighted = true
            } else {
                imageView.isHighlighted = false
            }
            
            ourTextField.text = ""
        }
    }
    
    func getRandomColor() -> UIColor {
         // Generate between 0 to 1
         let red: CGFloat = CGFloat(drand48())
         let green: CGFloat = CGFloat(drand48())
         let blue: CGFloat = CGFloat(drand48())

         return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }

}

