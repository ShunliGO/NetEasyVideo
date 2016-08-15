//
//  VideoViewModel.h
//  NetEasyVideo
//
//  Created by tarena on 16/7/22.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "BaseViewModel.h"
#import "NetManager.h"

@interface VideoViewModel : BaseViewModel

//UI
@property (nonatomic, readonly) NSInteger rowNumber;
- (NSString *)titleForRow:(NSInteger)row;
- (NSURL *)coverURLForRow:(NSInteger)row;
//播放时长
- (NSString *)lengthForRow:(NSInteger)row;
- (NSString *)playCountForRow:(NSInteger)row;
- (NSURL *)topicImgURLForRow:(NSInteger)row;
- (NSString *)topicNameForRow:(NSInteger)row;
- (NSString *)replyCountForRow:(NSInteger)row;

//Model
@property (nonatomic) NSMutableArray<VideoVideolistModel *> *dataList;
@property (nonatomic, readonly) NSInteger start;
//需求
- (NSURL *)videoURLForRow:(NSInteger)row;

@end













