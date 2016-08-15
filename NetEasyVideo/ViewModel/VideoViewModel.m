//
//  VideoViewModel.m
//  NetEasyVideo
//
//  Created by tarena on 16/7/22.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "VideoViewModel.h"

@implementation VideoViewModel

- (void)getDataWithRequestMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmpStart = 1;
    if (requestMode == RequestModeMore) {
        tmpStart = _start + 10;
    }
    self.dataTask = [NetManager getVideo:tmpStart completionHandler:^(VideoModel *model, NSError *error) {
        if (!error) {
            if (requestMode == RequestModeRefresh) {
                [self.dataList removeAllObjects];
            }
            [self.dataList addObjectsFromArray:model.videoList];
            _start = tmpStart;
        }
        !completionHandler?:completionHandler(error);
    }];
}

- (NSInteger)rowNumber{
    return self.dataList.count;
}

- (NSMutableArray<VideoVideolistModel *> *)dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray new];
    }
    return _dataList;
}

- (NSString *)titleForRow:(NSInteger)row{
    return self.dataList[row].title;
}
- (NSURL *)coverURLForRow:(NSInteger)row{
    return self.dataList[row].cover.yx_URL;
}
//播放时长
- (NSString *)lengthForRow:(NSInteger)row{
    //99 -> 01:39
    NSInteger length = self.dataList[row].length;
    return [NSString stringWithFormat:@"%02ld:%02ld",length / 60 , length %60];
}

- (NSString *)playCountForRow:(NSInteger)row{
    NSInteger playCount = self.dataList[row].playCount;
    if (playCount >= 10000) {
        return [NSString stringWithFormat:@"%.1f万播放", playCount / 10000.0];
    }else{
        return [NSString stringWithFormat:@"%ld播放", playCount];
    }
}
- (NSURL *)topicImgURLForRow:(NSInteger)row{
    return self.dataList[row].topicImg.yx_URL;
}
- (NSString *)topicNameForRow:(NSInteger)row{
    return self.dataList[row].topicName;
}
- (NSString *)replyCountForRow:(NSInteger)row{
    NSInteger replyCount = self.dataList[row].replyCount;
    if (replyCount >= 10000) {
        return [NSString stringWithFormat:@"%.1f万", replyCount / 10000.0];
    }else{
        return [NSString stringWithFormat:@"%ld", replyCount];
    }
}
- (NSURL *)videoURLForRow:(NSInteger)row{
    return self.dataList[row].mp4_url.yx_URL;
}

@end






