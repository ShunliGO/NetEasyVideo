//
//  VideoCell.h
//  NetEasyVideo
//
//  Created by tarena on 16/7/23.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface VideoCell : UITableViewCell

@property (nonatomic) UIImageView *coverIV;
@property (nonatomic) UILabel *titleLb;
@property (nonatomic) UILabel *playLb;
@property (nonatomic) UIImageView *headerIV;
@property (nonatomic) UILabel *topicLb;
@property (nonatomic) UIImageView *replyIconIV;
@property (nonatomic) UILabel *replyLb;
@property (nonatomic) UIButton *shareBtn;
@property (nonatomic) UIView *bottomView;
/*明确View层的职责:
 就是用于展示内容的. 本人不负责处理任何逻辑操作.
 能够负责逻辑操作的...-> Controller
 
 Controller 中显示Cell. Cell要向Controller传递子视图按钮的点击事件
 下级 向 上级 汇报/请求工作的方式有两种: delegate OR  block
 汇报的内容特别杂: delegate
 如果汇报内容单一,很简单: 就用block(推荐用copy修饰/strong也可以)
 */
//此属性表示cell拥有一个向外部通知按钮被点击的能力.
//至于上级用不用, 是上级的事情
@property (nonatomic, copy) void(^shareBtnClicked)(VideoCell *cell);

@end














