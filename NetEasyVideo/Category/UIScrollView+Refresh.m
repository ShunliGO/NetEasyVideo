//
//  UIScrollView+Refresh.m
//  NetEasyVideo
//
//  Created by tarena on 16/7/22.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "UIScrollView+Refresh.h"

@implementation UIScrollView (Refresh)

- (void)addHeaderRefresh:(void(^)())block{
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:block];
}
- (void)addFooterRefresh:(void(^)())block{
    self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:block];
}

- (void)endHeaderRefresh{
    [self.mj_header endRefreshing];
}
- (void)endFooterRefresh{
    [self.mj_footer endRefreshing];
}

- (void)beginHeaderRefresh{
    [self.mj_header beginRefreshing];
}
@end








