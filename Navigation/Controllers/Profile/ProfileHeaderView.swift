import UIKit

class ProfileViewHeader: UIView {
    
    var statusText: String = "Waiting for something..."

    var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Happy Cat"
        fullNameLabel.frame = CGRect(x: 145, y: 118, width: 100, height: 21)
        fullNameLabel.backgroundColor = .clear
        fullNameLabel.textAlignment = .center
        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        fullNameLabel.textColor = .black
        fullNameLabel.numberOfLines = 1
        return fullNameLabel
    }()
    
    var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.text = "Waiting for something..."
        statusLabel.frame = CGRect(x: 150, y: 185, width: 170, height: 20)
        statusLabel.backgroundColor = .clear
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        statusLabel.numberOfLines = 1
        statusLabel.sizeToFit()
        return statusLabel
    }()
    
    var avatarImageView: UIImageView = {
        let avatar = UIImageView()
        avatar.frame = CGRect(origin: CGPoint(x: 16, y: 107), size: CGSize(width: 130, height: 130))
        avatar.image = UIImage(named: "catAvatar")
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.cornerRadius = avatar.frame.size.width / 2
        avatar.layer.masksToBounds = true
        return avatar
    }()
    
    var statusTextField: UITextField = {
        let placeHolder = UITextField()
        placeHolder.frame = CGRect(x: 150, y: 210, width: 224, height: 45)
        placeHolder.placeholder = "Enter new status :)"
        placeHolder.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        placeHolder.backgroundColor = .white
        placeHolder.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        placeHolder.leftViewMode = .always
        placeHolder.layer.cornerRadius = 12
        placeHolder.layer.borderColor = UIColor.black.cgColor
        placeHolder.layer.borderWidth = 1
        placeHolder.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        return placeHolder
    }()
    
    var setStatusButton: UIButton = {
        var button = UIButton(frame: .zero)
        button.setTitle(Post(title:"Set new status").title, for: .normal)
        button.backgroundColor = .systemPurple
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.frame = CGRect(x: 16, y: 265, width: 358, height: 50)
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(setStatus), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(setStatusButton)
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
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
