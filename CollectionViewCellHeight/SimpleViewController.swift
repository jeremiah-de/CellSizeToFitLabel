import UIKit

class SimpleViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSizeMake(1, 1) //use auto layout for the collection view
        }
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
}
