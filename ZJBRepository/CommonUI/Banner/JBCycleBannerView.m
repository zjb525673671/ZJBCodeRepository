//
//  JBCycleBannerView.m
//  ZJBRepository
//
//  Created by zhoujiebing on 2018/9/19.
//  Copyright © 2018年 ZJBCode. All rights reserved.
//

#import "JBCycleBannerView.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation JBCycleBannerModel

@end

@interface JBMaskView : UIView

@property (assign, nonatomic) CGFloat maskRadius;
@property (assign, nonatomic) JBBannerSrollDirection direction;

@end

@implementation JBMaskView

#pragma mark - ♻️life cycle

- (void)setRadius:(CGFloat)radius direction:(JBBannerSrollDirection)dir {
    self.maskRadius = radius;
    self.direction = dir;
    if (self.direction != JBBannerSrollDirectionUnknow) {
        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect {
    self.backgroundColor = [UIColor clearColor];
    if (self.direction != JBBannerSrollDirectionUnknow) {
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        if (self.direction == JBBannerSrollDirectionLeft) {
            CGContextAddArc(ctx, self.center.x + rect.size.width/2, self.center.y, self.maskRadius, 0, M_PI * 2, NO);
        } else {
            CGContextAddArc(ctx, self.center.x - rect.size.width/2, self.center.y, self.maskRadius, 0, M_PI * 2, NO);
        }
        CGContextSetFillColorWithColor(ctx, [[UIColor whiteColor] CGColor]);
        CGContextFillPath(ctx);
    }
}

#pragma mark - 🎬event response

#pragma mark - ☸getter and setter



@end

@interface JBCycleBannerCell : UICollectionViewCell

/**
 图片
 */
@property(nonatomic, strong) UIImageView *imageView;


@end

@implementation JBCycleBannerCell

#pragma mark - ♻️life cycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    self.imageView.frame = CGRectMake(10, 0, self.frame.size.width - 20, self.frame.size.height);
    [self.contentView addSubview:self.imageView];
}

#pragma mark - 🎬event response

#pragma mark - ☸getter and setter

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

@end


@interface JBCycleBannerView() <UICollectionViewDelegate, UICollectionViewDataSource>

@property(nonatomic, assign) CGFloat navH;

@property(nonatomic, strong) UIImageView *topImageView;
@property(nonatomic, strong) UIImageView *bottomImageView;

@property(nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

@property(nonatomic, strong) UICollectionView *collectionView;


@property(nonatomic, strong) UIView *bannerMaskView;

@property(nonatomic, strong) UIPageControl *pageControl;

@property(nonatomic, strong) JBMaskView *leftView;
@property(nonatomic, strong) JBMaskView *rightView;

@property(nonatomic, strong) NSTimer *timer;

@property(nonatomic, assign) CGFloat lastContentOffsetX;//记录上次偏移量x
@property(nonatomic, assign) NSInteger totalItemCount;//总的轮播
@property(nonatomic, assign) NSInteger draggingIndex;//拖拽的cell标识
@property(nonatomic, assign) NSInteger currentScrollIndex;//目前滚动的标识

@end

@implementation JBCycleBannerView

#pragma mark - ♻️life cycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    [self addSubview:self.bottomImageView];
    [self addSubview:self.topImageView];
    [self addSubview:self.collectionView];
    [self addSubview:self.pageControl];
    self.topImageView.maskView = self.bannerMaskView;
    [self.bannerMaskView addSubview:self.rightView];
    [self.bannerMaskView addSubview:self.leftView];
}

- (void)startTimer {
    [self invalidateTimer];
    self.currentScrollIndex = [self currentItemIndex];
    self.timer = [NSTimer timerWithTimeInterval:3 target:self selector:@selector(timer_cycleScroll) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)invalidateTimer {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

//获取当前轮播的位置
- (NSInteger)currentItemIndex {
    if (self.collectionView.frame.size.width == 0 || self.collectionView.frame.size.height == 0) {
        return 0;
    }
    NSInteger index;
    index = (self.collectionView.contentOffset.x + self.flowLayout.itemSize.width/2)/self.flowLayout.itemSize.width;
    return MAX(0, index);
}

- (void)scrollToItemIndex:(NSInteger)toIndex {
    if (toIndex > self.totalItemCount) {
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.totalItemCount/2 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    } else {
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:toIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    }
}

#pragma mark - UIScrollviewDelegate

//开始拖拽
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    self.draggingIndex = [self currentItemIndex];
    [self invalidateTimer];
}

//结束拖拽
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self startTimer];
}

//结束减速
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.lastContentOffsetX = scrollView.contentOffset.x;
    self.currentScrollIndex = [self currentItemIndex];
    
    UICollectionViewCell *cell1 = [self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:self.currentScrollIndex inSection:0]];
    UICollectionViewCell *cell2 = [self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:(self.currentScrollIndex + 1 >= self.totalItemCount) ? self.totalItemCount/2 : self.currentScrollIndex + 1 inSection:0]];
    UICollectionViewCell *cell3 = [self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:(self.currentScrollIndex - 1 < 0) ? self.totalItemCount : self.currentScrollIndex - 1 inSection:0]];
    
    [UIView animateWithDuration:0.2 animations:^{
        cell1.transform = CGAffineTransformMakeScale(1, 1);
        cell2.transform = CGAffineTransformMakeScale(1, 1);
        cell3.transform = CGAffineTransformMakeScale(1, 1);
    }];
}

//动画完成
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    self.currentScrollIndex = [self currentItemIndex];
    UICollectionViewCell *cell1 = [self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:self.currentScrollIndex inSection:0]];
    UICollectionViewCell *cell2 = [self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:(self.currentScrollIndex + 1 >= self.totalItemCount) ? self.totalItemCount/2 : self.currentScrollIndex + 1 inSection:0]];
    UICollectionViewCell *cell3 = [self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:(self.currentScrollIndex - 1 < 0) ? self.totalItemCount : self.currentScrollIndex - 1 inSection:0]];
    
    [UIView animateWithDuration:0.2 animations:^{
        cell1.transform = CGAffineTransformMakeScale(1, 1);
        cell2.transform = CGAffineTransformMakeScale(1, 1);
        cell3.transform = CGAffineTransformMakeScale(1, 1);
    }];
}

//滚动中
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat currentOffsetX = scrollView.contentOffset.x;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    if (scrollView.isDragging || scrollView.isDecelerating) {
        NSInteger itemIndex = self.draggingIndex%self.bannerModelArray.count;
        if (self.lastContentOffsetX > currentOffsetX) {
            //往右划动
            UICollectionViewCell *cell1 = [self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:self.draggingIndex inSection:0]];
            UICollectionViewCell *cell2 = [self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:(self.draggingIndex - 1 < 0) ? self.totalItemCount : self.draggingIndex - 1 inSection:0]];
            
            [UIView animateWithDuration:0.1 animations:^{
                cell1.transform = CGAffineTransformMakeScale(0.85, 0.85);
                cell2.transform = CGAffineTransformMakeScale(0.85, 0.85);
            }];
            
            NSInteger topIndex = (itemIndex - 1 < 0) ? self.bannerModelArray.count - 1 : itemIndex - 1;
            NSInteger bottomIndex = itemIndex;
            
            JBCycleBannerModel *model1 = self.bannerModelArray[topIndex];
            [self.topImageView sd_setImageWithURL:[NSURL URLWithString:model1.bottomImageUrl]];
            JBCycleBannerModel *model2 = self.bannerModelArray[bottomIndex];
            [self.bottomImageView sd_setImageWithURL:[NSURL URLWithString:model2.bottomImageUrl]];
            
            [UIView animateWithDuration:0.5 animations:^{
                [self.leftView setRadius:(width * self.draggingIndex - currentOffsetX)*2  direction:JBBannerSrollDirectionRight];
                [self.rightView setRadius:0  direction:JBBannerSrollDirectionLeft];
            }];
        } else {
            //往左划动
            UICollectionViewCell *cell1 = [self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:self.draggingIndex inSection:0]];
            UICollectionViewCell *cell2 = [self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:(self.draggingIndex + 1 >= self.totalItemCount) ? self.totalItemCount/2 : self.draggingIndex + 1 inSection:0]];
            
            [UIView animateWithDuration:0.1 animations:^{
                cell1.transform = CGAffineTransformMakeScale(0.85, 0.85);
                cell2.transform = CGAffineTransformMakeScale(0.85, 0.85);
            }];
            
            NSInteger topIndex = (itemIndex + 1 >= self.bannerModelArray.count) ? 0 : itemIndex + 1;
            NSInteger bottomIndex = itemIndex;
            
            JBCycleBannerModel *model1 = self.bannerModelArray[topIndex];
            [self.topImageView sd_setImageWithURL:[NSURL URLWithString:model1.bottomImageUrl]];
            JBCycleBannerModel *model2 = self.bannerModelArray[bottomIndex];
            [self.bottomImageView sd_setImageWithURL:[NSURL URLWithString:model2.bottomImageUrl]];
            
            [UIView animateWithDuration:0.5 animations:^{
                [self.leftView setRadius:0 direction:JBBannerSrollDirectionRight];
                [self.rightView setRadius:(width * self.draggingIndex - currentOffsetX)*2   direction:JBBannerSrollDirectionLeft];
            }];
        }
    } else {
        NSInteger itemIndex = self.currentScrollIndex%self.bannerModelArray.count;
        if (self.lastContentOffsetX > currentOffsetX) {
            //上一个cell
            UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:(self.currentScrollIndex - 1 < 0) ? self.totalItemCount : self.currentScrollIndex inSection:0]];
            
            [UIView animateWithDuration:0.1 animations:^{
                cell.transform = CGAffineTransformMakeScale(0.85, 0.85);
            }];
            
            NSInteger topIndex = (itemIndex - 1 < 0) ? self.bannerModelArray.count - 1 : itemIndex - 1;
            NSInteger bottomIndex = itemIndex;
            
            JBCycleBannerModel *model1 = self.bannerModelArray[topIndex];
            [self.topImageView sd_setImageWithURL:[NSURL URLWithString:model1.bottomImageUrl]];
            JBCycleBannerModel *model2 = self.bannerModelArray[bottomIndex];
            [self.bottomImageView sd_setImageWithURL:[NSURL URLWithString:model2.bottomImageUrl]];
            
            [UIView animateWithDuration:0.5 animations:^{
                [self.leftView setRadius:(currentOffsetX - width * self.currentScrollIndex)*2  direction:JBBannerSrollDirectionRight];
                [self.rightView setRadius:0  direction:JBBannerSrollDirectionLeft];
            }];
        } else {
            UICollectionViewCell *cell2 = [self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:(self.currentScrollIndex + 1 >= self.totalItemCount) ? self.totalItemCount/2 : self.currentScrollIndex + 1 inSection:0]];
            
            [UIView animateWithDuration:0.1 animations:^{
                cell2.transform = CGAffineTransformMakeScale(0.85, 0.85);
            }];
            
            NSInteger topIndex = (itemIndex + 1 >= self.bannerModelArray.count) ? 0 : itemIndex + 1;
            NSInteger bottomIndex = itemIndex;
            
            JBCycleBannerModel *model1 = self.bannerModelArray[topIndex];
            [self.topImageView sd_setImageWithURL:[NSURL URLWithString:model1.bottomImageUrl]];
            JBCycleBannerModel *model2 = self.bannerModelArray[bottomIndex];
            [self.bottomImageView sd_setImageWithURL:[NSURL URLWithString:model2.bottomImageUrl]];
            
            [UIView animateWithDuration:0.5 animations:^{
                [self.leftView setRadius:0 direction:JBBannerSrollDirectionRight];
                [self.rightView setRadius:(currentOffsetX - width * self.currentScrollIndex)*2   direction:JBBannerSrollDirectionLeft];
            }];
        }
        self.lastContentOffsetX = currentOffsetX;
    }
}

#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.totalItemCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JBCycleBannerCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JBCycleBannerCell" forIndexPath:indexPath];
    NSInteger index = indexPath.item % self.bannerModelArray.count;
    JBCycleBannerModel *model = self.bannerModelArray[index];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.topImageUrl]];
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(clickActionCycleBanner_index:)]) {
        [self.delegate clickActionCycleBanner_index:indexPath.item%self.bannerModelArray.count];
    }
}


#pragma mark - 🎬event response

- (void)timer_cycleScroll {
    if (self.totalItemCount == 0) {
        return;
    }
    NSInteger currentIndex = [self currentItemIndex];
    NSInteger toIndex = currentIndex + 1;
    UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:currentIndex inSection:0]];
    [UIView animateWithDuration:0.2 animations:^{
        cell.transform = CGAffineTransformMakeScale(0.85, 0.85);
    } completion:^(BOOL finished) {
        [self scrollToItemIndex:toIndex];
    }];
    
}

#pragma mark - ☸getter and setter

- (void)setBannerModelArray:(NSArray *)bannerModelArray {
    if (bannerModelArray.count == 0) {
        return;
    }
    [self invalidateTimer];
    if (bannerModelArray.count == 1) {
        self.totalItemCount = 1;
    } else {
        self.totalItemCount = bannerModelArray.count * 100;
    }
    _bannerModelArray = bannerModelArray;
    [self.collectionView reloadData];
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.totalItemCount/2 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    
    NSInteger index = [self currentItemIndex]%bannerModelArray.count;
    
    
    if (index + 1 > bannerModelArray.count - 1){
        JBCycleBannerModel *model = bannerModelArray[0];
        [self.bottomImageView sd_setImageWithURL:[NSURL URLWithString:model.bottomImageUrl]];
    }else{
        JBCycleBannerModel *model = bannerModelArray[index + 1];
        [self.bottomImageView sd_setImageWithURL:[NSURL URLWithString:model.bottomImageUrl]];
    }
    JBCycleBannerModel *model = bannerModelArray[index];
    [self.topImageView sd_setImageWithURL:[NSURL URLWithString:model.bottomImageUrl]];
    if (bannerModelArray.count > 1) {
        [self startTimer];
    }
}

- (CGFloat)navH {
    
    return 64;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 10 + self.navH, self.frame.size.width, self.frame.size.height - 10 - self.navH) collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[JBCycleBannerCell class] forCellWithReuseIdentifier:@"JBCycleBannerCell"];
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)flowLayout {
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _flowLayout.itemSize = CGSizeMake(self.frame.size.width, self.frame.size.height - self.navH - 10);
        _flowLayout.minimumLineSpacing = 0;
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return _flowLayout;
}

- (UIImageView *)topImageView {
    if (!_topImageView) {
        _topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - 30)];
    }
    return _topImageView;
}

- (UIImageView *)bottomImageView {
    if (!_bottomImageView) {
        _bottomImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - 30)];
    }
    return _bottomImageView;
}

- (JBMaskView *)leftView {
    if (!_leftView) {
        _leftView = [[JBMaskView alloc] initWithFrame:CGRectMake(-10, 0, self.frame.size.width + 10, self.frame.size.height - 30)];
    }
    return _leftView;
}

- (JBMaskView *)rightView {
    if (!_rightView) {
        _rightView = [[JBMaskView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width + 10, self.frame.size.height - 30)];
    }
    return _rightView;
}

- (UIView *)bannerMaskView {
    if (!_bannerMaskView) {
        _bannerMaskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - 30)];
    }
    return _bannerMaskView;
}

@end
