import UIKit

class ProfileViewHeader: UIView {
    
    var statusText: String = "Waiting for something..."

    var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Happy Cat"
        fullNameLabel.backgroundColor = .clear
        fullNameLabel.textAlignment = .center
        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        fullNameLabel.textColor = .black
        fullNameLabel.numberOfLines = 1
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return fullNameLabel
    }()
    
    var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.text = "Waiting for something..."
        statusLabel.backgroundColor = .clear
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        statusLabel.numberOfLines = 1
        statusLabel.sizeToFit()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()
    
    var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.image = UIImage(named: "catAvatar")
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.masksToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        return avatarImageView
    }()
    
    var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.placeholder = "Enter new status :)"
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.backgroundColor = .white
        statusTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        statusTextField.leftViewMode = .always
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.borderWidth = 1
        statusTextField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        return statusTextField
    }()
    
    var setStatusButton: UIButton = {
        var setStatusButton = UIButton(frame: .zero)
        setStatusButton.setTitle(Post(title:"Set new status").title, for: .normal)
        setStatusButton.backgroundColor = .systemPurple
        setStatusButton.titleLabel?.textAlignment = .center
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.layer.cornerRadius = 4
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.addTarget(self, action: #selector(setStatus), for: .touchUpInside)
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        return setStatusButton
    }()
    
    func setupViews() {
       
        // MARK: - Если не ставить high priority к buttonWidth, то почему-то xCode ругается в консоли. Гугл не сильно помог в теории, только как решить проблему. Если подскажете, почему так надо делать, то буду благодарен
        
        let buttonWidth = setStatusButton.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -32)
        buttonWidth.priority = .defaultHigh

        
        let constraints = [
            fullNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            fullNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 100),
            
            avatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImageView.trailingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor, constant: -30),
            avatarImageView.widthAnchor.constraint(lessThanOrEqualToConstant: 110),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            statusLabel.topAnchor.constraint(greaterThanOrEqualTo: avatarImageView.centerYAnchor, constant: 20),
            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),

            statusTextField.topAnchor.constraint(equalTo: statusLabel.topAnchor, constant: 20),
            statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor, constant: 3),
            statusTextField.widthAnchor.constraint(equalTo: setStatusButton.widthAnchor, multiplier: 0.5),
            statusTextField.heightAnchor.constraint(equalToConstant: 35),
           
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 10),
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            buttonWidth,
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        ]
        
        self.layoutIfNeeded()
        self.setNeedsLayout()
        NSLayoutConstraint.activate(constraints)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(avatarImageView)
        addSubview(setStatusButton)
        addSubview(statusTextField)
        setupViews()
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    @objc func setStatus() {
        statusLabel.text = String(statusText)
        print("Status: \(statusLabel.text ?? "nil")")
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = statusTextField.text ?? "Empty"
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.size.width / 2
    }
}
