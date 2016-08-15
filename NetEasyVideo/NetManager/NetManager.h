//
//  NetManager.h
//  NetEasyVideo
//
//  Created by tarena on 16/7/22.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "BaseNetworking.h"
#import "VideoModel.h"

@interface NetManager : BaseNetworking
+ (id)getVideo:(NSInteger)start completionHandler:(void(^)(VideoModel *model, NSError *error))completionHandler;
@end
