//
//  This file is for educational purposes only. It may contain code snippets, examples, images, and explanations
//  intended to help understand concepts and improve programming skills.
//

import UIKit

class LoginView: UIView {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var usernameTextfield: UITextField = {
       let textfield = UITextField()
        textfield.placeholder = "Username"
        textfield.borderStyle = .roundedRect
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    lazy var passwordTextfield: UITextField = {
       let textfield = UITextField()
        textfield.placeholder = "Password"
        textfield.borderStyle = .roundedRect
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("login", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .light)
        button.translatesAutoresizingMaskIntoConstraints = false
        var configuration = UIButton.Configuration.plain()
        configuration.cornerStyle = .large
        configuration.background.backgroundColor = .systemCyan
        configuration.baseForegroundColor = .systemGray6
        button.configuration = configuration
        return button
    }()
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addElementsToHierarchy()
        setLoginContainerConstraints()
        setTitleLabelConstraints()
        setUsernameLabelConstraints()
        setUsernameTextFieldConstraints()
        setPasswordLabelConstraints()
        setPasswordTextFieldConstraints()
        setLoginButtonConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElementsToHierarchy() {
        addSubview(titleLabel)
        addSubview(containerView)
        containerView.addSubview(userNameLabel)
        containerView.addSubview(usernameTextfield)
        containerView.addSubview(passwordLabel)
        containerView.addSubview(passwordTextfield)
        containerView.addSubview(loginButton)
    }
    // labels no necesitan constraint de altura
    private func setTitleLabelConstraints() {
        titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 32).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -32).isActive = true
    }
    
    private func setLoginContainerConstraints() {
        let centerY = containerView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
        centerY.priority = .defaultLow
        centerY.isActive = true
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(greaterThanOrEqualTo: titleLabel.bottomAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            containerView.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
    }
    
    private func setUsernameLabelConstraints() {
        userNameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor, constant: 0).isActive = true
        userNameLabel.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor, constant: 0).isActive = true
    }
    // labels no necesitan constraint de altura
    private func setUsernameTextFieldConstraints() {
        usernameTextfield.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 8).isActive = true
        usernameTextfield.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor, constant: 0).isActive = true
        usernameTextfield.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor, constant: 0).isActive = true
        usernameTextfield.heightAnchor.constraint(equalTo: loginButton.heightAnchor, multiplier: 1).isActive = true
    }
    // labels no necesitan constraint de altura
    private func setPasswordLabelConstraints() {
        passwordLabel.topAnchor.constraint(equalTo: usernameTextfield.bottomAnchor, constant: 16).isActive = true
        passwordLabel.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor, constant: 0).isActive = true
        passwordLabel.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor, constant: 0).isActive = true
    }
    
    private func setPasswordTextFieldConstraints() {
        passwordTextfield.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8).isActive = true
        passwordTextfield.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor, constant: 0).isActive = true
        passwordTextfield.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor, constant: 0).isActive = true
        passwordTextfield.heightAnchor.constraint(equalTo: loginButton.heightAnchor, multiplier: 1).isActive = true
    }
    
    private func setLoginButtonConstraints() {
        loginButton.topAnchor.constraint(equalTo: passwordTextfield.bottomAnchor, constant: 16).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        loginButton.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.9).isActive = true
        let aspectRatio = loginButton.widthAnchor.constraint(equalTo: loginButton.heightAnchor, multiplier: 5)
        aspectRatio.priority = .defaultLow
        aspectRatio.isActive = true
    }
}
