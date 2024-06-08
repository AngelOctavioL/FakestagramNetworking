//
//  This file is for educational purposes only. It may contain code snippets, examples, images, and explanations
//  intended to help understand concepts and improve programming skills.
//

import UIKit

class SettingsViewController: UIViewController {
    var customView: SettingsView {
        return view as! SettingsView
    }
    weak var router: MainRouter?
    
    init(router: MainRouter? = nil) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
        tabBarItem.image = UIImage(systemName: "gear.circle.fill")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = SettingsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        connectSettingsView()
        setBarButtonItemGroup()
        navigationItem.title = "Settings"
    }
    
    private func connectSettingsView() {
        customView.customText.delegate = self
        customView.customTextSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        customView.showCaptionSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
    }
    
    @objc func switchValueChanged(_ sender: UISwitch) {
        if sender == customView.customText {
            customView.customText.isEditable = sender.isOn
        } else {
            Settings.hideCaptions.toggle()
        }
    }
    
    private func setBarButtonItemGroup() {
        let logoutButton = UIBarButtonItem(title: "Logout", image: UIImage(systemName: "multiply.circle.fill"), target: self, action: #selector(logout))
        let informationButton = UIBarButtonItem(title: "Information", image: UIImage(systemName: "info.circle.fill"), target: self, action: #selector(manualSegueInformation))
        navigationItem.centerItemGroups = [UIBarButtonItemGroup.fixedGroup(items: [informationButton, logoutButton])]
    }
    
    @objc func manualSegueInformation() {
        if customView.customTextSwitch.isOn && (customView.customText.text?.isEmpty ?? true) {
            let alertController = UIAlertController(title: "Add custom text", message: nil, preferredStyle: .alert)
            let dismissAction = UIAlertAction(title: "Ok", style: .cancel) { _ in
                print("Alert controller dismissed")
            }
            alertController.addAction(dismissAction)
            present(alertController, animated: true)
        } else {
            let informationViewController = InformationViewController()
            if customView.customTextSwitch.isOn {
                informationViewController.text = customView.customText.text
            }
            present(informationViewController, animated: true)
        }
    }
    
    @objc func logout() {
        router?.logOut()
    }
}

extension SettingsViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let allowedCharacters = CharacterSet.alphanumerics.union(CharacterSet.whitespacesAndNewlines)
        let maxCharacters = 150
        let currentCharacters = textView.text.count - range.length + text.count
        return text == "" || (currentCharacters <= maxCharacters && CharacterSet(charactersIn: text).isSubset(of: allowedCharacters))
    }
}


