//
//  VideoCell.m
//  NetEasyVideo
//
//  Created by tarena on 16/7/23.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "VideoCell.h"

//苹果手机iphone4 是1倍像素
//iphone5 ~iphone6s  都是2倍像素
//iphone 的 plus都是3倍像素
//所以通过手机截屏的方式获取图片之后, 量像素大小时要除以对应的倍数. 得到对应的编程像素.

@implementation VideoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self titleLb];
        [self topicLb];
        [self playLb];
        [self replyIconIV];
    }
    return self;
}

- (UIImageView *)coverIV {
    if(_coverIV == nil) {
        _coverIV = [[UIImageView alloc] init];
        _coverIV.contentMode = UIViewContentModeScaleAspectFill;
        _coverIV.clipsToBounds = YES;
        [self.contentView addSubview:_coverIV];
        [_coverIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(0);
        }];
    }
    return _coverIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.coverIV addSubview:_titleLb];
        _titleLb.font = [UIFont systemFontOfSize:16];
        _titleLb.textColor = [UIColor whiteColor];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.top.equalTo(15);
            make.right.equalTo(-10);
        }];
    }
    return _titleLb;
}

- (UILabel *)playLb {
    if(_playLb == nil) {
        _playLb = [[UILabel alloc] init];
        [self.coverIV addSubview:_playLb];
        _playLb.textColor = [UIColor whiteColor];
        _playLb.font = [UIFont systemFontOfSize:13];
        [_playLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(-10);
            make.right.equalTo(-10);
        }];
    }
    return _playLb;
}

- (UIView *)bottomView {
    if(_bottomView == nil) {
        _bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_bottomView];
        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.top.equalTo(self.coverIV.mas_bottom);
            make.height.equalTo(47);
        }];
    }
    return _bottomView;
}

- (UIImageView *)headerIV {
    if(_headerIV == nil) {
        _headerIV = [[UIImageView alloc] init];
        _headerIV.layer.cornerRadius = 3;
        _headerIV.clipsToBounds = YES;
        _headerIV.contentMode = UIViewContentModeScaleAspectFill;
        [self.bottomView addSubview:_headerIV];
        [_headerIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.centerY.equalTo(0);
            make.width.height.equalTo(26);
        }];
    }
    return _headerIV;
}

- (UILabel *)topicLb {
    if(_topicLb == nil) {
        _topicLb = [[UILabel alloc] init];
        _topicLb.font = [UIFont systemFontOfSize:14];
        [self.bottomView addSubview:_topicLb];
        [_topicLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headerIV.mas_right).equalTo(7);
            make.centerY.equalTo(0);
            //防止文字过长, 一般来说 美工会有说明
            make.width.lessThanOrEqualTo(150);
        }];
        
    }
    return _topicLb;
}

- (UIImageView *)replyIconIV {
    if(_replyIconIV == nil) {
        _replyIconIV = [[UIImageView alloc] init];
        _replyIconIV.image =[UIImage imageNamed:@"qa_comment_icon"];
        [self.bottomView addSubview:_replyIconIV];
        [_replyIconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.replyLb.mas_left).equalTo(-3);
            make.centerY.equalTo(0);
            make.size.equalTo(CGSizeMake(20, 18));
        }];
    }
    return _replyIconIV;
}

- (UILabel *)replyLb {
    if(_replyLb == nil) {
        _replyLb = [[UILabel alloc] init];
        _replyLb.font = [UIFont systemFontOfSize:13];
        _replyLb.textColor = [UIColor grayColor];
        [self.bottomView addSubview:_replyLb];
        [_replyLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.shareBtn.mas_left).equalTo(-20);
            make.centerY.equalTo(0);
        }];
        
    }
    return _replyLb;
}

- (UIButton *)shareBtn {
    if(_shareBtn == nil) {
        //如果美工提供了高亮和普通状态的图片, 那么就要使用custom风格了. 因为system风格会自动为高亮图片添加渐变效果.
        _shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareBtn setBackgroundImage:[UIImage imageNamed:@"readercell_share_highlight"] forState:UIControlStateNormal];
        [_shareBtn setBackgroundImage:[UIImage imageNamed:@"night_readercell_share_highlight"] forState:UIControlStateHighlighted];
        [self.bottomView addSubview:_shareBtn];
        [_shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(-13);
            make.width.height.equalTo(20);
        }];
        [_shareBtn addTarget:self action:@selector(shareBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shareBtn;
}
- (void)shareBtnClicked:sender{
    NSLog(@"分享按钮被点击");
    !_shareBtnClicked ?: _shareBtnClicked(self);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
