//
//  VideoModel.m
//  NetEasyVideo
//
//  Created by tarena on 16/7/22.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"videoSidList": [VideoVideosidlistModel class], @"videoList": [VideoVideolistModel class]};
}

@end


@implementation VideoVideosidlistModel

@end


@implementation VideoVideolistModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"tname": @"videoTopic.tname",
             @"alias": @"videoTopic.alias",
             @"tid": @"videoTopic.tid",
             @"ename": @"videoTopic.ename",
             @"desc": @"description", };
}

@end




