import UIKit
import StorageService
import SnapKit

class ProfileTableHeaderView: UITableViewHeaderFooterView {
    
    var defaultAvatarCenter: CGPoint = CGPoint(x: 0, y: 0)
    var defaultAvatarCorner: CGFloat = CGFloat()
    
    private lazy var statusText: String = "Waiting for something..."
    
    private lazy var backgroundFrame: UIView = {
        let backgroundFrame = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        backgroundFrame.backgroundColor = .black
        backgroundFrame.alpha = 0
        return backgroundFrame
    }()

    private lazy var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Happy Cat"
        fullNameLabel.backgroundColor = .clear
        fullNameLabel.textAlignment = .center
        fullNameLabel.font = UIFont.systemFont(ofSize: Constants.CGFloatNumbers.px18, weight: .bold)
        fullNameLabel.textColor = .black
        fullNameLabel.numberOfLines = 1
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
        return statusLabel
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.image = UIImage(named: "catAvatar")
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.masksToBounds = true
        avatarImageView.isUserInteractionEnabled = true
        return avatarImageView
    }()
    
    private lazy var crossImage: UIImageView = {
        let crossImage = UIImageView()
        crossImage.image = UIImage(systemName: "multiply.square")
        crossImage.tintColor = .lightGray
        crossImage.alpha = 0
        crossImage.isUserInteractionEnabled = true
        return crossImage
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
        return statusTextField
    }()
    
    private lazy var setStatusButton: UIButton = {
        var setStatusButton = UIButton(frame: .zero)
        setStatusButton.setTitle(Post(title:"Set new status").title, for: .normal)
        setStatusButton.backgroundColor = .systemPurple
        setStatusButton.titleLabel?.textAlignment = .center
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.layer.cornerRadius = Constants.CGFloatNumbers.px8
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowRadius = Constants.CGFloatNumbers.px4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.addTarget(self, action: #selector(setStatus), for: .touchUpInside)
        return setStatusButton
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.size.height / 2
    }
    
    func setupViews() {

        contentView.addSubview(fullNameLabel)
        contentView.addSubview(statusLabel)
        contentView.addSubview(setStatusButton)
        contentView.addSubview(statusTextField)
        contentView.addSubview(backgroundFrame)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(crossImage)
        
        fullNameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide.snp.top).offset(Constants.CGFloatNumbers.px27)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(Constants.CGFloatNumbers.px16).priority(.high)
        }
        
        avatarImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide.snp.top).offset(Constants.CGFloatNumbers.px16)
            make.leading.equalTo(contentView.safeAreaLayoutGuide.snp.leading).offset(Constants.CGFloatNumbers.px16)
            make.width.lessThanOrEqualTo(Constants.CGFloatNumbers.px110)
            make.height.equalTo(avatarImageView.snp.width)
        }
        
        crossImage.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide.snp.top).offset(Constants.CGFloatNumbers.px30)
            make.leading.equalTo(contentView.safeAreaLayoutGuide.snp.trailing).offset(-Constants.CGFloatNumbers.px60)
            make.width.height.equalTo(Constants.CGFloatNumbers.px45)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(-Constants.CGFloatNumbers.px36)
            make.leading.equalTo(fullNameLabel.snp.leading)
            make.trailing.greaterThanOrEqualTo(contentView.snp.trailing).offset(-Constants.CGFloatNumbers.px16)
        }
        
        statusTextField.snp.makeConstraints { make in
            make.top.equalTo(statusLabel.snp.top).offset(Constants.CGFloatNumbers.px20)
            make.leading.equalTo(statusLabel.snp.leading).offset(Constants.CGFloatNumbers.px3)
            make.width.equalTo(setStatusButton.snp.width).multipliedBy(0.5)
            make.height.equalTo(Constants.CGFloatNumbers.px35)
        }
        
        setStatusButton.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(Constants.CGFloatNumbers.px32)
            make.leading.equalTo(contentView.snp.leading).offset(Constants.CGFloatNumbers.px16)
            make.height.equalTo(Constants.CGFloatNumbers.px50)
            make.width.equalTo(contentView.snp.width).offset(-Constants.CGFloatNumbers.px32).priority(.high)
        }
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
        layoutIfNeeded()
        
        let avatarGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(avatarTapGesture)
        )
        avatarImageView.addGestureRecognizer(avatarGesture)

        let crossGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(crossTapGesture)
        )
        crossImage.addGestureRecognizer(crossGesture)
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
    
    @objc private func avatarTapGesture(gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: []
        ) {
            self.defaultAvatarCenter = self.avatarImageView.center
            self.defaultAvatarCorner = self.avatarImageView.layer.cornerRadius
            self.avatarImageView.center = CGPoint(
               x: UIScreen.main.bounds.midX,
               y: UIScreen.main.bounds.midY
           )
            self.avatarImageView.transform = CGAffineTransform(scaleX: self.contentView.frame.width / self.avatarImageView.frame.width, y: self.contentView.frame.width / self.avatarImageView.frame.width)
            self.avatarImageView.layer.cornerRadius = 0
            self.backgroundFrame.alpha = 0.8
            
            ProfileViewController.profileTableView.isScrollEnabled = false
            ProfileViewController.profileTableView.cellForRow(at: IndexPath(item: 0, section: 0))?.isUserInteractionEnabled = false
           
            UIView.animate(
                withDuration: 0.3,
                delay: 0.5,
                options: []
            ) {
                self.crossImage.alpha = 1
            }
        }
    }
    
    @objc private func crossTapGesture(gesture: UITapGestureRecognizer) {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: []
        ){
            self.crossImage.alpha = 0
            self.avatarImageView.center = self.defaultAvatarCenter
            self.avatarImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.avatarImageView.layer.cornerRadius = self.defaultAvatarCorner
            self.backgroundFrame.alpha = 0
            
            ProfileViewController.profileTableView.isScrollEnabled = true
            ProfileViewController.profileTableView.cellForRow(at: IndexPath(item: 0, section: 0))?.isUserInteractionEnabled = true
        }
    }
   
}
