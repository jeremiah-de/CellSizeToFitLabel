import UIKit

class CalculateViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    @IBOutlet var collectionView: UICollectionView!

    let columnNum: CGFloat = 3 //use number of columns instead of a static maximum cell width
    var cellWidth: CGFloat = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        collectionView.registerNib(UINib(nibName: "LabelCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LabelCell")

        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10) //could not set in storyboard, don't know why
        }
    }
    
    override func viewDidLayoutSubviews()
    {
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (columnNum - 1)
            let totalCellAvailableWidth = collectionView.frame.size.width - flowLayout.sectionInset.left - flowLayout.sectionInset.right - spaceBetweenCells
            cellWidth = floor(totalCellAvailableWidth / columnNum);
        }
    }

    override func viewWillLayoutSubviews()
    {
        super.viewWillLayoutSubviews()
        
        //recalculate the collection view layout when the view layout changes
        collectionView.collectionViewLayout.invalidateLayout()
    }

    //MARK: UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 100
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("LabelCell", forIndexPath: indexPath) as! LabelCollectionViewCell
        cell.configureWithIndexPath(indexPath)
        return cell
    }
    
    //MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        if let cell = LabelCollectionViewCell.fromNib() {
            let cellMargins = cell.layoutMargins.left + cell.layoutMargins.right
            cell.configureWithIndexPath(indexPath)
            cell.label.preferredMaxLayoutWidth = cellWidth - cellMargins
            cell.labelWidthLayoutConstraint.constant = cellWidth - cellMargins //adjust the width to be correct for the number of columns
            return cell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize) //apply auto layout and retrieve the size of the cell
        }
        return CGSizeZero
    }
}

