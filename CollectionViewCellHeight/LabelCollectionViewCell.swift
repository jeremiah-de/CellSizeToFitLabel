import UIKit

class LabelCollectionViewCell: UICollectionViewCell
{
    @IBOutlet var label: UILabel!
    @IBOutlet var labelWidthLayoutConstraint: NSLayoutConstraint! //used for setting the width via constraint

    class func fromNib() -> LabelCollectionViewCell?
    {
        var cell: LabelCollectionViewCell?
        let nibViews = NSBundle.mainBundle().loadNibNamed("LabelCollectionViewCell", owner: nil, options: nil)
        for nibView in nibViews {
            if let cellView = nibView as? LabelCollectionViewCell {
                cell = cellView
            }
        }
        return cell
    }
    
    func configureWithIndexPath(indexPath: NSIndexPath)
    {
        layer.borderWidth = 1
        layer.borderColor = UIColor.blackColor().CGColor
        backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        label.text = labelTextWithNum(indexPath.item + 1)
        label.preferredMaxLayoutWidth = 50
    }
    
    private func labelTextWithNum(num: Int) -> String
    {
        var text = "1"
        if (num > 1) {
            for t in 2...num {
                text = text.stringByAppendingString(" \(t)")
            }
        }
        return text
    }
    
//    override func preferredLayoutAttributesFittingAttributes(layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes
//    {
//        let attr = layoutAttributes.copy() as! UICollectionViewLayoutAttributes
//        attr.frame.size = self.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
//        return attr
//    }
}
