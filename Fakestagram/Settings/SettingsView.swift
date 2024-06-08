//
//  This file is for educational purposes only. It may contain code snippets, examples, images, and explanations
//  intended to help understand concepts and improve programming skills.
//

import UIKit

class SettingsView: UIView {
    
    private lazy var stackViewContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 16
        stackView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()

    lazy var showCaptionSwitch: UISwitch = {
        let customSwitch = UISwitch()
        customSwitch.tag = 0
        customSwitch.isOn = !Settings.hideCaptions
        return customSwitch
    }()
    
    lazy var customTextSwitch: UISwitch = {
        let customSwitch = UISwitch()
        customSwitch.tag = 1
        return customSwitch
    }()
    
    lazy var customText: UITextView = {
        let textView = UITextView()
        textView.text = "Custom text"
        return textView
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setStackContainer()
        addConfigurationsToContainer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConfigurationsToContainer() {
        stackViewContainer.addArrangedSubview(createShowCaptionConfiguration())
        stackViewContainer.addArrangedSubview(createCustomTextConfiguration())
        stackViewContainer.addArrangedSubview(customText)
    }
    
    private func setStackContainer() {
        addSubview(stackViewContainer)
        NSLayoutConstraint.activate([
            stackViewContainer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackViewContainer.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            stackViewContainer.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            stackViewContainer.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func createShowCaptionConfiguration() -> UIStackView {
        let stackView = createHorizontalStackView()
        let showCaptionLabel = createBasicLabel(text: "Show caption", useTamic: true)
        stackView.addArrangedSubview(showCaptionLabel)
        stackView.addArrangedSubview(showCaptionSwitch)
        return stackView
    }
    
    private func createCustomTextConfiguration() -> UIStackView {
        let stackView = createHorizontalStackView()
        let customTextLabel = createBasicLabel(text: "Custom text", useTamic: true)
        stackView.addArrangedSubview(customTextLabel)
        stackView.addArrangedSubview(customTextSwitch)
        return stackView
    }
    
    private func createHorizontalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }
    
    private func createBasicLabel(text: String, useTamic: Bool = false) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = useTamic
        label.text = text
        return label
    }
}
