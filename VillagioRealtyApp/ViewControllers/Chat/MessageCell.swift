    //  Created by Daniyar Mamadov on 08.09.2022.

import UIKit

final class MessageCell: UITableViewCell {
        
    static let identifier = "MessageTableViewCellID"
    
    private lazy var verticalStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.spacing = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var messageLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.sizeToFit()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        verticalStackView.layer.cornerRadius = 8
        verticalStackView.clipsToBounds = true
        verticalStackView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        verticalStackView.isLayoutMarginsRelativeArrangement = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = .clear
        addSubview(verticalStackView)
        setup(stackView: verticalStackView,
              arrangedSubview: messageLabel)
    }
    
    private func setupConstraints(isMyMessage: Bool) {
        verticalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2).isActive = true
        
        if isMyMessage {
            verticalStackView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 10).isActive = true
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        } else {
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
            verticalStackView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -10).isActive = true
        }
    }
    
    internal func configureCell(message: String, isMyMessage: Bool) {
        setupConstraints(isMyMessage: isMyMessage)
        messageLabel.text = message
        messageLabel.textAlignment = isMyMessage ? .right : .left
        verticalStackView.backgroundColor = isMyMessage ? .blue : .systemGray6
        messageLabel.textColor = isMyMessage ? .white : .black
    }
    
    private func setup(stackView: UIStackView, arrangedSubview: UIView...) {
        arrangedSubview.forEach {
            stackView.addArrangedSubview($0)
        }
    }
}
