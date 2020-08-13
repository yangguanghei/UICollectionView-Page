//
//  PagingEnableLayout.m
//  MumwayC
//
//  Created by apple on 2020/8/13.
//  Copyright © 2020 李晁宇. All rights reserved.
//

#import "PagingEnableLayout.h"


#import <objc/message.h>

#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@implementation PagingEnableLayout

- (instancetype)init {
   self = [super init];
   if (self) {
       [self initSettings];
   }
   return self;
}
- (void)initSettings {
   //默认flowLayout,可在collectionView自定义以下参数
//   self.itemSize = CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds));
//   self.minimumInteritemSpacing = 10.0;
//   self.minimumLineSpacing = 10.0;
//   self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//   self.sectionInset = UIEdgeInsetsMake(0, 20.0, 0, 20.0);
}

- (CGFloat)pageWidth {
   return self.itemSize.width + self.minimumLineSpacing;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
   CGFloat rawPageValue = self.collectionView.contentOffset.x / self.pageWidth;
   CGFloat currentPage = (velocity.x > 0.0) ? floor(rawPageValue) : ceil(rawPageValue);
   CGFloat nextPage = (velocity.x > 0.0) ? ceil(rawPageValue) : floor(rawPageValue);
   BOOL pannedLessThanAPage = fabs(1 + currentPage - rawPageValue) > 0.5;
   BOOL flicked = fabs(velocity.x) > [self flickVelocity];
   if (pannedLessThanAPage && flicked) {
       proposedContentOffset.x = nextPage * self.pageWidth;
   } else {
       proposedContentOffset.x = round(rawPageValue) * self.pageWidth;
   }
   return proposedContentOffset;
}

- (CGFloat)flickVelocity {
//   return 0.3;
    return 0.01;
}

@end
