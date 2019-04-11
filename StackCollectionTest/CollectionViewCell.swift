import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var colorView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func set(color: UIColor) {
        colorView.backgroundColor = color
    }
}
