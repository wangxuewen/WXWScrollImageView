//
//  ViewController.m
//  WXWScrollImageView
//
//  Created by administrator on 2018/11/14.
//  Copyright © 2018年 xuewen.wang. All rights reserved.
//

#import "ViewController.h"
#import "WXWScrollImageView.h"

#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    WXWScrollImageView *scrollImageView = [[WXWScrollImageView alloc] initWithFrame:CGRectMake(20, 90, SCREEN_WIDTH - 40, SCREEN_HEIGHT - 150)];
    
    scrollImageView.imageURLArr = @[@"http://pi4m1fli8.bkt.clouddn.com/%E5%AD%A6%E4%B9%A0.png",
                                         @"http://pi4m1fli8.bkt.clouddn.com/%E7%81%AB%E6%8E%8C.png",
                                         @"http://pi4m1fli8.bkt.clouddn.com/%E7%8E%8B%E4%B9%9F.png",
                                         @"http://pi4m1fli8.bkt.clouddn.com/%E4%B8%89%E7%AC%A0.png",
                                         @"http://pi4m1fli8.bkt.clouddn.com/%E5%86%AF%E5%AE%9D%E5%AE%9D.png",
                                         @"http://pi4m1fli8.bkt.clouddn.com/%E5%A4%A7%E6%89%8B%E7%89%B5%E5%B0%8F%E6%89%8B.png",
                                         @"http://pi4m1fli8.bkt.clouddn.com/%E7%8E%8B%E4%B9%9F%E9%81%93%E9%95%BF.png",
                                         @"http://pi4m1fli8.bkt.clouddn.com/%E9%81%93%E9%95%BF.png",
                                         @"http://pi4m1fli8.bkt.clouddn.com/%E5%B0%8F%E9%81%93%E9%95%BF.png"];
    
    [self.view addSubview:scrollImageView];
    
    
}


@end
