//
//  BaseViewModel.h
//  NetEasyVideo
//
//  Created by tarena on 16/7/22.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger, RequestMode) {
    RequestModeRefresh,
    RequestModeMore,
};
@interface BaseViewModel : NSObject
- (void)getDataWithRequestMode:(RequestMode)requestMode completionHandler:(void(^)(NSError *error))completionHandler;
@property (nonatomic) NSURLSessionDataTask *dataTask;
@end









