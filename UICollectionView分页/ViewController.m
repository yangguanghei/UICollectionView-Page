//
//  ViewController.m
//  UICollectionView分页
//
//  Created by apple on 2020/8/13.
//  Copyright © 2020 apple. All rights reserved.
//

#import "ViewController.h"

#import "PagingEnableLayout.h"
#import "MWSelectBabyAuntCollectionViewCell.h"


#define COLOR_WITH_RGB(R,G,B,A) [UIColor colorWithRed:R green:G blue:B alpha:A]
static const CGFloat itemH = 270;

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView * collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
  return 12;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
  MWSelectBabyAuntCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MWSelectBabyAuntCollectionViewCell" forIndexPath:indexPath];
  cell.backgroundColor = COLOR_WITH_RGB(arc4random()%255/255.0, arc4random()%255/255.0, arc4random()%255/255.0, 1);
  cell.nameLbl.text = [NSString stringWithFormat:@"%lu", indexPath.row];
  return cell;
}

- (UICollectionView *)collectionView{
  if (_collectionView == nil) {
//    UICollectionViewFlowLayout * layout = [UICollectionViewFlowLayout new];
    PagingEnableLayout * layout = [PagingEnableLayout new];
    layout.minimumLineSpacing = 0.0;
    layout.minimumInteritemSpacing = 0.0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
      layout.itemSize = CGSizeMake(self.view.frame.size.width - 40,itemH / 3);
//    layout.itemSize = CGSizeMake(SCREEN_WIDTH,itemH / 3);
      _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, itemH) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
//    _collectionView.pagingEnabled = YES;
    [_collectionView registerClass:[MWSelectBabyAuntCollectionViewCell class] forCellWithReuseIdentifier:@"MWSelectBabyAuntCollectionViewCell"];
    _collectionView.backgroundColor = [UIColor whiteColor];
      
      // UIScrollViewDecelerationRateFast
      // UIScrollViewDecelerationRateNormal
      _collectionView.decelerationRate = UIScrollViewDecelerationRateFast;
      _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 40);
  }
  return _collectionView;
}


@end
