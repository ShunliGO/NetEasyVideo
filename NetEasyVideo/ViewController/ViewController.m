//
//  ViewController.m
//  NetEasyVideo
//
//  Created by yingxin on 16/7/22.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "ViewController.h"
#import "VideoViewModel.h"
#import "VideoCell.h"
#import "UMSocial.h"

//Cocoa提供的最高级的视频播放api, 使用简单. 所有内容都定制好了. 缺点:无法自定义
@import MediaPlayer; //比较古老

//苹果公司 iOS8之后,推出了一个新的视频播放高级API. 取代旧的
//@import 是Xcode7之后的新式引入系统类库的方式
//旧方式#import <MediaPlayer/MediaPlayer.h> 还需要到工程的build phase下 引入对应的类库
@import AVKit; //AV->AudioVideo 音视频
@import AVFoundation; //功能非常强大: 摄像头,录音. 播放视频音频. 文字和语音转化. 二维码扫描......
//AVKit提供播放控制器的页面 AVFoundation提供播放功能


@interface ViewController ()
@property (nonatomic) VideoViewModel *videoVM;
@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // 75 * 35
    CGFloat height = [UIScreen mainScreen].bounds.size.width * 35 / 75 + 47;
    self.tableView.rowHeight = height;
    self.tableView.sectionFooterHeight = 4;
    self.tableView.sectionHeaderHeight = 4;
    //以下两种方式 都是用于调整group风格的tableView的头部高度
    //self.tableView.contentInset = UIEdgeInsetsMake(-27, 0, 0, 0);
    //两组代码区别在于下拉刷新时, 刷新文字出现的位置. 可以自行注释尝试查看
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 8)];
    headerView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = headerView;
    
    
    [self.tableView registerClass:[VideoCell class] forCellReuseIdentifier:@"VideoCell"];
    __weak typeof(self) weakSelf = self;
    [self.tableView addHeaderRefresh:^{
        [weakSelf.videoVM getDataWithRequestMode:RequestModeRefresh completionHandler:^(NSError *error) {
            [weakSelf.tableView reloadData];
            [weakSelf.tableView endHeaderRefresh];
        }];
    }];
    [self.tableView beginHeaderRefresh];
    [self.tableView addFooterRefresh:^{
        [weakSelf.videoVM getDataWithRequestMode:RequestModeMore completionHandler:^(NSError *error) {
            [weakSelf.tableView reloadData];
            [weakSelf.tableView endFooterRefresh];
        }];
    }];
}
- (VideoViewModel *)videoVM{
    if (!_videoVM) {
        _videoVM = [VideoViewModel new];
    }
    return _videoVM;
}
//group风格的tableview, 好多个分区, 每个分区里就1个cell
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.videoVM.rowNumber;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VideoCell" forIndexPath:indexPath];
    //注意!!! 好多个section 所以要通过section来获取对应的数据. 因为row永远都是0. 每个section只有一个row
    NSInteger row = indexPath.section;
    //placeholder:网络图片加载失败,未完成之前显示的图
    [cell.coverIV setImageWithURL:[self.videoVM coverURLForRow:row] placeholder:[UIImage imageNamed:@"reader_coverdefault"]];
    cell.titleLb.text = [self.videoVM titleForRow:row];
    cell.playLb.text = [[self.videoVM lengthForRow:row] stringByAppendingPathComponent:[self.videoVM playCountForRow:row]];
    [cell.headerIV setImageWithURL:[self.videoVM topicImgURLForRow:row] placeholder:[UIImage imageNamed:@"qa_share_normal"]];
    cell.topicLb.text = [self.videoVM topicNameForRow:row];
    cell.replyLb.text = [self.videoVM replyCountForRow:row];
    [cell setShareBtnClicked:^(VideoCell *cell) {
        NSLog(@"VC 获取cell中的按钮点击事件");
        //indexPathForCell获取某个cell的位置
        NSIndexPath *ip = [tableView indexPathForCell:cell];
        [self share:ip.section];
    }];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //播放视频, 因为是Group风格, 传递是section. 别错了!!!
    //MPMoviePlayerViewController *vc = [[MPMoviePlayerViewController alloc] initWithContentURL:[self.videoVM videoURLForRow:indexPath.section]];
    //iOS8之后的类
    AVPlayerViewController *vc = [AVPlayerViewController new];
    vc.player = [AVPlayer playerWithURL:[self.videoVM videoURLForRow:indexPath.section]];
    //默认不是自动播放的, 手动调用播放的方法
    [vc.player play];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)share:(NSInteger)row{
    //如果需要分享回调，请将delegate对象设置self，并实现下面的回调方法
    [UMSocialData defaultData].extConfig.title = [self.videoVM titleForRow:row];
    [UMSocialData defaultData].extConfig.qqData.url = [self.videoVM videoURLForRow:row].absoluteString;;
    [UMSocialData defaultData].extConfig.wechatSessionData.url = [self.videoVM videoURLForRow:row].absoluteString;
    [UMSocialSnsService presentSnsIconSheetView:self
    appKey:@"5632e65ae0f55a556a0013d9"
    shareText:@"我正在Tedu1604学习第三方分享"
    shareImage:[UIImage imageNamed:@"qqicon"]
    shareToSnsNames:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToQQ,UMShareToQzone, UMShareToSms, UMShareToEmail]
   delegate:nil];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
