import UIKit

class TopView: UIView {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var labelView: FlexibleLabelView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(text: String) {
        labelView.set(text: text)
    }
}
