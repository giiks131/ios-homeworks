import UIKit

class LogInViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let customContainerView = UIView()
    
    private lazy var logoImageVK: UIImageView = {
        let logoImageVK = UIImageView()
        logoImageVK.image = UIImage(named: "logo")
        
        logoImageVK.translatesAutoresizingMaskIntoConstraints = false
        
        return logoImageVK
    }()
    
    private lazy var loginTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.placeholder = "Email or phone"
        loginTextField.textColor = .black
        loginTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        loginTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        loginTextField.leftViewMode = .always
        loginTextField.tintColor = UIColor(named: "ColorSet")
        loginTextField.autocapitalizationType = .none
        loginTextField.backgroundColor = .systemGray6
        
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return loginTextField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.textColor = .black
        passwordTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        passwordTextField.leftViewMode = .always
        passwordTextField.tintColor = UIColor(named: "ColorSet")
        passwordTextField.autocapitalizationType = .none
        passwordTextField.isSecureTextEntry = true
        passwordTextField.backgroundColor = .systemGray6

        passwordTextField.translatesAutoresizingMaskIntoConstraints = false

        return passwordTextField
    }()
    
    private lazy var buttonLogIn: UIButton = {
        let buttonLogIn = UIButton()
        buttonLogIn.setTitle("Log In", for: .normal)
        buttonLogIn.setTitleColor(.white, for: .normal)
        buttonLogIn.backgroundColor = .systemBlue
        buttonLogIn.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        buttonLogIn.layer.cornerRadius = 10
        buttonLogIn.clipsToBounds = true
        buttonLogIn.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel"), for: .normal)
        buttonLogIn.addTarget(self, action: #selector(logIn), for: .touchUpInside)
        
        buttonLogIn.translatesAutoresizingMaskIntoConstraints = false
        
        return buttonLogIn
    }()
    
    private lazy var spacerForStackView: UIView = {
        let spacerForStackView = UIView()
        spacerForStackView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        spacerForStackView.backgroundColor = .lightGray
        
        spacerForStackView.translatesAutoresizingMaskIntoConstraints = false
        
        return spacerForStackView
    }()
    
    private lazy var loginAndPasswordStackView: UIStackView = {
        var loginAndPasswordStackView = UIStackView()
        loginAndPasswordStackView.axis = .vertical
        loginAndPasswordStackView.spacing = 0
        loginAndPasswordStackView.distribution = .fillProportionally
        loginAndPasswordStackView.layer.borderWidth = 0.5
        loginAndPasswordStackView.layer.borderColor = UIColor.lightGray.cgColor
        loginAndPasswordStackView.layer.cornerRadius = Constants.CGFloatNumbers.px10
        
        loginAndPasswordStackView.addArrangedSubview(loginTextField)
        loginAndPasswordStackView.addArrangedSubview(spacerForStackView)
        loginAndPasswordStackView.addArrangedSubview(passwordTextField)
        
        loginAndPasswordStackView.translatesAutoresizingMaskIntoConstraints = false
        
        return loginAndPasswordStackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        setupViews()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppeared), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDisappeared), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardAppeared(notification: NSNotification) {
        if let keyboard = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentSize.height = buttonLogIn.frame.maxY
            scrollView.contentInset.bottom = view.safeAreaInsets.bottom + keyboard.height + Constants.CGFloatNumbers.px20
        }
    }
    
    @objc func keyboardDisappeared(notification: NSNotification) {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    @objc func logIn() {
        navigationController?.popViewController(animated: true)
        navigationController?.tabBarController?.tabBar.isHidden = false
        navigationController?.navigationBar.isHidden = false
    }
    
    func setupViews() {
        navigationController?.tabBarController?.tabBar.isHidden = true
        navigationController?.tabBarController?.tabBar.isTranslucent = true
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(scrollView)
        scrollView.addSubview(customContainerView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        customContainerView.translatesAutoresizingMaskIntoConstraints = false
        customContainerView.addSubview(logoImageVK)
        customContainerView.addSubview(loginAndPasswordStackView)
        customContainerView.addSubview(buttonLogIn)
        
        let constraints = [
        
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
            
            customContainerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            customContainerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            customContainerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            customContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            customContainerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                
            logoImageVK.topAnchor.constraint(equalTo: customContainerView.topAnchor, constant: Constants.CGFloatNumbers.px120),
            logoImageVK.heightAnchor.constraint(equalToConstant: Constants.CGFloatNumbers.px100),
            logoImageVK.widthAnchor.constraint(equalToConstant: Constants.CGFloatNumbers.px100),
            logoImageVK.centerXAnchor.constraint(equalTo: customContainerView.centerXAnchor),
            
            loginAndPasswordStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.CGFloatNumbers.px16),
            loginAndPasswordStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constants.CGFloatNumbers.px16),
            loginAndPasswordStackView.topAnchor.constraint(equalTo: logoImageVK.bottomAnchor, constant: Constants.CGFloatNumbers.px120),
            loginAndPasswordStackView.heightAnchor.constraint(equalToConstant: Constants.CGFloatNumbers.px100),
            
            buttonLogIn.topAnchor.constraint(equalTo: loginAndPasswordStackView.bottomAnchor, constant: Constants.CGFloatNumbers.px16),
            buttonLogIn.leadingAnchor.constraint(equalTo: loginAndPasswordStackView.leadingAnchor),
            buttonLogIn.trailingAnchor.constraint(equalTo: loginAndPasswordStackView.trailingAnchor),
            buttonLogIn.heightAnchor.constraint(equalToConstant: Constants.CGFloatNumbers.px50)
        ]
        
        NSLayoutConstraint.activate(constraints)
    
    }
    
}
