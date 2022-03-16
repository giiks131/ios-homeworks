import UIKit
import StorageService

class PhotosTableViewCell: UITableViewCell {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = Post(title: "Photos").title
        label.textColor = .black
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: Constants.CGFloatNumbers.px24, weight: .bold)
        label.numberOfLines = 1
        label.sizeToFit()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var arrow: UIImageView = {
        let arrow = UIImageView()
        arrow.image = UIImage.init(systemName: "arrow.right")
    
        arrow.translatesAutoresizingMaskIntoConstraints = false
        
        return arrow
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        layout.scrollDirection = .horizontal
        
        collectionView.register(PhotosProfileViewCell.self, forCellWithReuseIdentifier: String(describing: PhotosProfileViewCell.self))
        
        collectionView.backgroundColor = .white
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
       
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupViews()
    }
    
    func setupViews() {
        contentView.backgroundColor = .white
        
        contentView.addSubview(label)
        contentView.addSubview(arrow)
        contentView.addSubview(collectionView)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false

        
        let constraints = [
            
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.CGFloatNumbers.px12),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.CGFloatNumbers.px12),
            
            arrow.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            arrow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.CGFloatNumbers.px12),
            
            collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: Constants.CGFloatNumbers.px12),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.CGFloatNumbers.px12),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.CGFloatNumbers.px12),
            collectionView.heightAnchor.constraint(equalToConstant: Constants.CGFloatNumbers.px100),
            
            contentView.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: Constants.CGFloatNumbers.px12)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
}


extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
         1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PhotosProfileViewCell.self), for: indexPath) as! PhotosProfileViewCell
        
        let photo = DataStorage.photosStorage[indexPath.row]
        
        cell.photo = photo
        
        cell.layer.cornerRadius = Constants.CGFloatNumbers.px6
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let sizeOfCell = Constants.CGFloatNumbers.px100
        
        return CGSize(width: sizeOfCell, height: sizeOfCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        Constants.halfSpacer
    }
    
}



class PhotosProfileViewCell: UICollectionViewCell {
    
    var photo: Photo? {
        didSet {
            photoProfile.image = UIImage(imageLiteralResourceName: photo?.image ?? "mops14")
        }
    }
    
    private let photoProfile: UIImageView = {
        let photoProfile = UIImageView()
        photoProfile.contentMode = .scaleToFill
        
        return photoProfile
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupViews()
    }
    
    func setupViews() {
        contentView.addSubview(photoProfile)
        contentView.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        photoProfile.frame = CGRect(
            x: 0,
            y: 0,
            width: contentView.bounds.width,
            height: contentView.bounds.height
        )

    }
    
}
