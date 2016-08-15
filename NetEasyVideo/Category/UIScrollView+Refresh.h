//
//  UIScrollView+Refresh.h
//  NetEasyVideo
//
//  Created by tarena on 16/7/22.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Refresh)

- (void)addHeaderRefresh:(void(^)())block;
- (void)addFooterRefresh:(void(^)())block;

- (void)endHeaderRefresh;
- (void)endFooterRefresh;

- (void)beginHeaderRefresh;

@end












