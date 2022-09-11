//  Created by Daniyar Mamadov on 08.09.2022.

import UIKit
//import Firebase

final class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    internal var messages: [Message] = [Message(sender: "Seller", message: "Здравствуйте!"),
                                        Message(sender: "Seller", message: "Выслал Вам подборку домов"),
                                        Message(sender: "Buyer", message: "Спасибо, изучу"),
                                        Message(sender: "Buyer", message: "Интересный дом из клееного бруса, сколько спален?"),
                                        Message(sender: "Seller", message: "2 на первом этаже и 3 на втором")]
    
    private let chatTableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fill
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let messageTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Message"
        view.clearButtonMode = .never
        view.autocapitalizationType = .sentences
        view.autocorrectionType = .no
        view.spellCheckingType = .no
        view.returnKeyType = .send
        view.borderStyle = .roundedRect
        view.backgroundColor = .white
        view.isSecureTextEntry = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sendButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "SendIcon")?.withTintColor(.blue), for: .normal)
        view.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupConstaints()
        configureChatTableView()
    }
    
    @objc private func sendButtonTapped() {
        if let messageBody = messageTextField.text {
            let newMessage = Message(sender: "Buyer", message: messageBody)
            messages.append(newMessage)
            messageTextField.text = ""
            DispatchQueue.main.async {
                self.chatTableView.reloadData()
            }
        }
    }
    
    private func configureUI() {
        setup(view: view,
              subview: chatTableView, horizontalStackView)
        setup(stackView: horizontalStackView,
              arrangedSubview: messageTextField, sendButton)
    }
    
    private func setupConstaints() {
        NSLayoutConstraint.activate([
            chatTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            chatTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chatTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            chatTableView.bottomAnchor.constraint(equalTo: horizontalStackView.topAnchor, constant: -10),
            
            horizontalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            horizontalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            horizontalStackView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
            
            sendButton.heightAnchor.constraint(equalToConstant: 30),
            sendButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func configureChatTableView() {
        chatTableView.delegate = self
        chatTableView.dataSource = self
        chatTableView.register(MessageCell.self, forCellReuseIdentifier: MessageCell.identifier)
        chatTableView.estimatedRowHeight = 60
        chatTableView.rowHeight = UITableView.automaticDimension
        chatTableView.separatorStyle = .none
    }
    
    private func setup(view: UIView, subview: UIView...) {
        subview.forEach {
            view.addSubview($0)
        }
    }
    
    private func setup(stackView: UIStackView, arrangedSubview: UIView...) {
        arrangedSubview.forEach {
            stackView.addArrangedSubview($0)
        }
    }
}
