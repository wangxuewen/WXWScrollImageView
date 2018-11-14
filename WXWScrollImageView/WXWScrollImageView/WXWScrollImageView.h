//
//  WXWScrollImageView.h
//  WXWScrollImageView
//
//  Created by administrator on 2018/11/14.
//  Copyright © 2018年 xuewen.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WXWScrollImageView : UIView<UIScrollViewDelegate>

///网络图片数组
@property (copy, nonatomic) NSArray *imageURLArr;
///本地图片数组
@property (copy, nonatomic) NSArray *imageLocalArr;
///选中的当前图片，默认第一张
@property (assign, nonatomic) NSInteger currentIndex;

@end

NS_ASSUME_NONNULL_END
