//
//  VideoModel.h
//  NetEasyVideo
//
//  Created by tarena on 16/7/22.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VideoVideosidlistModel,VideoVideolistModel;
@interface VideoModel : NSObject

@property (nonatomic, copy) NSString *videoHomeSid;

@property (nonatomic, strong) NSArray<VideoVideosidlistModel *> *videoSidList;

@property (nonatomic, strong) NSArray<VideoVideolistModel *> *videoList;

@end
@interface VideoVideosidlistModel : NSObject

@property (nonatomic, copy) NSString *sid;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *imgsrc;

@end

@interface VideoVideolistModel : NSObject

@property (nonatomic, copy) NSString *ptime;

@property (nonatomic, copy) NSString *videosource;

@property (nonatomic, copy) NSString *topicImg;

@property (nonatomic, copy) NSString *topicSid;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *sectiontitle;

@property (nonatomic, copy) NSString *vid;

@property (nonatomic, copy) NSString *m3u8_url;

@property (nonatomic, assign) NSInteger playersize;

@property (nonatomic, copy) NSString *topicName;

@property (nonatomic, assign) NSInteger replyCount;

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, copy) NSString *replyBoard;

@property (nonatomic, assign) NSInteger playCount;

@property (nonatomic, assign) NSInteger length;

@property (nonatomic, copy) NSString *topicDesc;

@property (nonatomic, copy) NSString *mp4Hd_url;

@property (nonatomic, copy) NSString *replyid;

//@property (nonatomic, strong) Videotopic *videoTopic;

@property (nonatomic, copy) NSString *m3u8Hd_url;

@property (nonatomic, copy) NSString *mp4_url;
//description -> desc
@property (nonatomic, copy) NSString *desc;

//@end
//@interface Videotopic : NSObject

@property (nonatomic, copy) NSString *tname;

@property (nonatomic, copy) NSString *alias;

@property (nonatomic, copy) NSString *tid;

@property (nonatomic, copy) NSString *ename;

@end

