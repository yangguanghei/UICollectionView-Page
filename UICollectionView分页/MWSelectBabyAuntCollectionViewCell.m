//
//  MWSelectBabyAuntCollectionViewCell.m
//  MumwayC
//
//  Created by apple on 2020/8/13.
//  Copyright © 2020 李晁宇. All rights reserved.
//

#import "MWSelectBabyAuntCollectionViewCell.h"



@implementation MWSelectBabyAuntCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.nameLbl];
        self.nameLbl.frame = CGRectMake(0, 10, 100, 30);
    }
    return self;
}

#pragma mark --- 懒加载
- (UILabel *)nameLbl{
  if (_nameLbl == nil) {
    _nameLbl = [UILabel new];
      _nameLbl.textColor = [UIColor blackColor];
  }
  return _nameLbl;;
}

@end
