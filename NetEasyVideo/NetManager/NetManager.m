//
//  NetManager.m
//  NetEasyVideo
//
//  Created by tarena on 16/7/22.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "NetManager.h"

#define kVideoPath @"http://c.m.163.com/nc/video/home/%ld-10.html"

@implementation NetManager
+ (id)getVideo:(NSInteger)start completionHandler:(void (^)(VideoModel *, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:kVideoPath, start];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([VideoModel parse:responseObj], error);
    }];
}
@end






