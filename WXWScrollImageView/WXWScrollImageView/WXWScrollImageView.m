//
//  WXWScrollImageView.m
//  WXWScrollImageView
//
//  Created by administrator on 2018/11/14.
//  Copyright © 2018年 xuewen.wang. All rights reserved.
//

#import "WXWScrollImageView.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface WXWScrollImageView () {
    UIScrollView *_scrollView;
}

@end

@implementation WXWScrollImageView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _scrollView.clipsToBounds = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
        [self addSubview:_scrollView];
        
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    _scrollView.clipsToBounds = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    [self addSubview:_scrollView];
}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    return _scrollView;
}

#pragma mark -method
- (void)settingImageView:(NSArray *)imagesArr type:(NSString *)type {
    CGSize size = _scrollView.frame.size;
    
    for (int i = 0; i < imagesArr.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * size.width + 7.5, 0, size.width - 15, size.height)];
        if ([type isEqualToString:@"本地图片"]) {
            UIImage *image = [UIImage imageNamed:imagesArr[i]];
            imageView.image = image;
        } else if ([type isEqualToString:@"网络图片"]) {
            [imageView sd_setImageWithURL:[NSURL URLWithString:imagesArr[i]]];
        }
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.layer.cornerRadius = 30;
        imageView.clipsToBounds = YES;
        imageView.layer.borderWidth = 0.5;
        imageView.layer.borderColor = UIColor.grayColor.CGColor;
        
        [_scrollView addSubview:imageView];
    }
    
    [_scrollView setContentSize:CGSizeMake(size.width * imagesArr.count, size.height)];
}

#pragma mark -SETTER
- (void)setImageURLArr:(NSArray *)imageURLArr {
    if (_imageURLArr != imageURLArr) {
        _imageURLArr = imageURLArr.copy;
        if (_imageLocalArr.count == 0) {
            [self settingImageView:_imageURLArr type:@"网络图片"];
        }
    }
}

- (void)setImageLocalArr:(NSArray *)imageLocalArr {
    if (_imageLocalArr != imageLocalArr) {
        _imageLocalArr = imageLocalArr.copy;
        if (_imageURLArr.count == 0) {
            [self settingImageView:_imageLocalArr type:@"本地图片"];
        }
    }
    
}

- (void)setCurrentIndex:(NSInteger)currentIndex {
    if (_currentIndex != currentIndex && (currentIndex <= _imageLocalArr.count || currentIndex <= _imageURLArr.count)) {
        _scrollView.contentOffset = CGPointMake(_scrollView.frame.size.width * (currentIndex - 1), 0);
    }
}

@end
