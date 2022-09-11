//  Created by Daniyar Mamadov on 08.09.2022.

import UIKit

final class LoginViewController: UIViewController {
        
    private lazy var verticalStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var loginAsBuyer: UIButton = {
        getButton(title: "Войти как покупатель",
                         titleColor: .blue,
                         backgroundColor: .white,
                         target: self,
                         action: #selector(buttonTapped(_:)))
    }()
    
    private lazy var loginAsSeller: UIButton = {
        getButton(title: "Войти как риэлтор",
                         titleColor: .white,
                         backgroundColor: .blue,
                         target: self,
                         action: #selector(buttonTapped(_:)))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.99, green: 0.98, blue: 0.96, alpha: 1.00)
        configureUI()
        setupConstraints()
    }
    
    private func configureUI() {
        view.addSubview(verticalStackView)
        setup(stackView: verticalStackView,
              arrangedSubview: loginAsBuyer, loginAsSeller)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        let chatVC = ChatViewController()
        chatVC.modalTransitionStyle = .flipHorizontal
        chatVC.modalPresentationStyle = .fullScreen
        present(chatVC, animated: true)
    }
    
    private func setup(stackView: UIStackView, arrangedSubview: UIView...) {
        arrangedSubview.forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    private func getButton(title: String, titleColor: UIColor, backgroundColor: UIColor, target: Any?, action: Selector) -> UIButton {
        let view = UIButton()
        view.setTitle(title, for: .normal)
        view.setTitleColor(titleColor, for: .normal)
        view.backgroundColor = backgroundColor
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.titleLabel?.font = .systemFont(ofSize: 24, weight: .medium)
        view.titleLabel?.textAlignment = .center
        view.addTarget(target, action: action, for: .touchUpInside)
        return view
    }
}


