import UIKit

class ProfileViewController: UIViewController {
    
    static var profileTableView = UITableView(frame: .zero, style: .grouped)
    
    enum CellReuseID: String {
        case `default` = "TableViewCellReuseID"
        case photos = "PhotosCellReuseID"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        view.addSubview(ProfileViewController.profileTableView)
        setupConstraints()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    func setupTableView() {
        ProfileViewController.profileTableView.register(PostTableViewCell.self, forCellReuseIdentifier: CellReuseID.default.rawValue)
        ProfileViewController.profileTableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: CellReuseID.photos.rawValue)
        ProfileViewController.profileTableView.register(ProfileTableHeaderView.self, forHeaderFooterViewReuseIdentifier: "header")
        ProfileViewController.profileTableView.dataSource = self
        ProfileViewController.profileTableView.delegate = self
        ProfileViewController.profileTableView.rowHeight = UITableView.automaticDimension
    }

    func setupConstraints() {
        ProfileViewController.profileTableView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            ProfileViewController.profileTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            ProfileViewController.profileTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            ProfileViewController.profileTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            ProfileViewController.profileTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }
}


extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return 1
        } else {
       return DataStorage.profileTableViewPosts.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section) == 0 {
            let photoSectionTableViewCell = tableView.dequeueReusableCell(withIdentifier:  CellReuseID.photos.rawValue, for: indexPath) as! PhotosTableViewCell
            
            return photoSectionTableViewCell
        } else {
            let cell = ProfileViewController.profileTableView.dequeueReusableCell(withIdentifier: CellReuseID.default.rawValue, for: indexPath) as! PostTableViewCell
                cell.post = DataStorage.profileTableViewPosts[indexPath.row]
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ProfileViewController.profileTableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section == 0) {
            return view.bounds.width * 0.3 + 100
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if (indexPath.section == 0) {
            let rootVC = PhotosViewController()
            navigationController?.pushViewController(rootVC, animated: true)
        }
    }
}
