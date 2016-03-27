//
//  BubbleCollectionViewLayout.swift
//  Snapclone
//
//  Created by David Wu on 3/23/16.
//  Copyright © 2016 Gofake1. All rights reserved.
//

import UIKit

class BubbleCollectionViewLayout: UICollectionViewFlowLayout {
    var animator: UIDynamicAnimator!
    
    override init() {
        super.init()
        self.animator = UIDynamicAnimator(collectionViewLayout: self)
        print(self.animator)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepareLayout() {
        super.prepareLayout()
        let contentSize = self.collectionView!.collectionViewLayout.collectionViewContentSize()
        let items: NSArray = super.layoutAttributesForElementsInRect(CGRectMake(0.0, 0.0, contentSize.width, contentSize.height))!
        if (self.animator.behaviors.count == 0) {
            items.enumerateObjectsUsingBlock({ (obj, idx, stop) in
                let behavior = UIAttachmentBehavior(item: obj as! UIDynamicItem, attachedToAnchor: obj.center)
                behavior.length = 0.0
                behavior.damping = 0.8
                behavior.frequency = 1.0
                self.animator!.addBehavior(behavior)
            })
        }
    }

    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return self.animator.itemsInRect(rect) as? [UICollectionViewLayoutAttributes]
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        return self.animator.layoutAttributesForCellAtIndexPath(indexPath)
    }

    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        let delta = newBounds.origin.y - self.collectionView!.bounds.origin.y
        let touchLocation = self.collectionView?.panGestureRecognizer.locationInView(self.collectionView)
        for behavior in self.animator.behaviors {
            let springBehavior = behavior as! UIAttachmentBehavior
            let yDistanceFromTouch = CGFloat(fabsf(Float(touchLocation!.y) - Float(springBehavior.anchorPoint.y)))
            let xDistanceFromTouch = CGFloat(fabsf(Float(touchLocation!.x) - Float(springBehavior.anchorPoint.x)))
            let scrollResistance: CGFloat = (yDistanceFromTouch + xDistanceFromTouch) / 1500.0
            let item = springBehavior.items.first!
            var _center = item.center
            if (delta < 0) {
                _center.y += max(delta, delta*scrollResistance)
            } else {
                _center.y += min(delta, delta*scrollResistance)
            }
            item.center = _center
            self.animator.updateItemUsingCurrentState(item)
        }
        
        return false
    }
}