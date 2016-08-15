//
//  NSString+YX.m
//  NetEasyVideo
//
//  Created by tarena on 16/7/22.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "NSString+YX.h"

@implementation NSString (YX)
- (NSURL *)yx_URL{
    return [NSURL URLWithString:self];
}
@end
