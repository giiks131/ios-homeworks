import UIKit

class ProfileViewController: UIViewController {

    let header = ProfileViewHeader()

    var bottomButton: UIButton = {
        let bottomButton = UIButton()
        bottomButton.setTitle(Post(title: "Bottom button").title, for: .normal)
        bottomButton.backgroundColor = .systemCyan
        bottomButton.titleLabel?.textAlignment = .center
        bottomButton.setTitleColor(.white, for: .normal)
        bottomButton.layer.cornerRadius = 4
        bottomButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        bottomButton.layer.shadowRadius = 4
        bottomButton.layer.shadowColor = UIColor.black.cgColor
        bottomButton.layer.shadowOpacity = 0.7
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        return bottomButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = Post(title:"Profile").title
        view.addSubview(header)
        header.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomButton)
        setupConstraints()
    }

    func setupConstraints() {
        let constraints = [
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            header.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),       
            bottomButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
