import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo? {
        didSet {
            photoProfile.image = UIImage(imageLiteralResourceName: photo?.image ?? "mops14")
        }
    }
    
    private let photoProfile: UIImageView = {
        let photoProfile = UIImageView()
        photoProfile.contentMode = .scaleToFill
        photoProfile.clipsToBounds = true
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
            width: self.bounds.width,
            height: self.bounds.height
        )
    }
}
