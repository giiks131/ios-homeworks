import UIKit

class ProfileTableHeaderView: UITableViewHeaderFooterView {
    
    private lazy var statusText: String = "Waiting for something..."

    private lazy var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Happy Cat"
        fullNameLabel.backgroundColor = .clear
        fullNameLabel.textAlignment = .center
        fullNameLabel.font = UIFont.systemFont(ofSize: Constants.CGFloatNumbers.px18, weight: .bold)
        fullNameLabel.textColor = .black
        fullNameLabel.numberOfLines = 1
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return fullNameLabel
    }()
    
    private lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.text = "Waiting for something..."
        statusLabel.backgroundColor = .clear
        statusLabel.font = UIFont.systemFont(ofSize: Constants.CGFloatNumbers.px14, weight: .regular)
        statusLabel.textColor = .gray
        statusLabel.numberOfLines = 1
        statusLabel.sizeToFit()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.image = UIImage(named: "catAvatar")
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.masksToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        return avatarImageView
    }()
    
    private lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.placeholder = "Enter new status :)"
        statusTextField.font = UIFont.systemFont(ofSize: Constants.CGFloatNumbers.px15, weight: .regular)
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
    
    private lazy var setStatusButton: UIButton = {
        var setStatusButton = UIButton(frame: .zero)
        setStatusButton.setTitle(Post(title:"Set new status").title, for: .normal)
        setStatusButton.backgroundColor = .systemPurple
        setStatusButton.titleLabel?.textAlignment = .center
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.layer.cornerRadius = Constants.CGFloatNumbers.px4
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowRadius = Constants.CGFloatNumbers.px4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.addTarget(self, action: #selector(setStatus), for: .touchUpInside)
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        return setStatusButton
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.size.width / 2
    }
    
    func setupViews() {

        contentView.addSubview(fullNameLabel)
        contentView.addSubview(statusLabel)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(setStatusButton)
        contentView.addSubview(statusTextField)
        
        
        let buttonWidth = setStatusButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -Constants.CGFloatNumbers.px32)
        buttonWidth.priority = .defaultHigh
        
        let fullNameLeading =
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Constants.CGFloatNumbers.px16)
        fullNameLeading.priority = .defaultHigh
        
        let constraints = [
            fullNameLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: Constants.CGFloatNumbers.px27),
            fullNameLeading,
          
            avatarImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: Constants.CGFloatNumbers.px16),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: Constants.CGFloatNumbers.px16),
            avatarImageView.widthAnchor.constraint(lessThanOrEqualToConstant: Constants.CGFloatNumbers.px110),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),

            statusLabel.topAnchor.constraint(greaterThanOrEqualTo: avatarImageView.centerYAnchor, constant: Constants.CGFloatNumbers.px20),
            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),

            statusTextField.topAnchor.constraint(equalTo: statusLabel.topAnchor, constant: Constants.CGFloatNumbers.px20),
            statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor, constant: Constants.CGFloatNumbers.px3),
            statusTextField.widthAnchor.constraint(equalTo: setStatusButton.widthAnchor, multiplier: 0.5),
            statusTextField.heightAnchor.constraint(equalToConstant: Constants.CGFloatNumbers.px35),

            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: Constants.CGFloatNumbers.px10),
            setStatusButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.CGFloatNumbers.px16),
            setStatusButton.heightAnchor.constraint(equalToConstant: Constants.CGFloatNumbers.px50),
            buttonWidth,
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
        layoutIfNeeded()
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
   
}
