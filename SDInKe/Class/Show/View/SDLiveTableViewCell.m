//
//  SDLiveTableViewCell.m
//  SDInKe
//
//  Created by slowdony on 2018/4/17.
//  Copyright © 2018年 slowdony. All rights reserved.
//

#import "SDLiveTableViewCell.h"

#define cellMargin
@implementation SDHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //头像
        UIImageView *headImage = [[UIImageView alloc] init];
        [self addSubview:headImage];
        self.headImageView = headImage;
        self.headImageView.layer.cornerRadius = 35/2;
        self.headImageView.layer.masksToBounds = YES;
        [headImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(15);
            make.centerY.equalTo(self.mas_centerY);
            make.width.height.equalTo(@(35));
        }];
        
        //多少人看
        UILabel *numLabel = [[UILabel alloc] init];
        numLabel.backgroundColor = [UIColor clearColor];
        numLabel.textColor = [UIColor orangeColor];
        numLabel.textAlignment = NSTextAlignmentRight;
        numLabel.font = [UIFont systemFontOfSize:13];
        numLabel.numberOfLines = 0;
        self.numLabel = numLabel;
        [self addSubview:numLabel];
        [numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-10);
            make.top.equalTo(self.headImageView.mas_top);
            make.width.equalTo(@(100));
            make.height.equalTo(@(20));
        }];
        
        //昵称
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.backgroundColor = [UIColor clearColor];
        nameLabel.textColor = [UIColor blackColor];
//        nameLabel.text = @"大圣归来";
        nameLabel.textAlignment = NSTextAlignmentLeft;
        nameLabel.font = [UIFont systemFontOfSize:15];
        nameLabel.numberOfLines = 0;
        self.nameLabel = nameLabel;
        [self addSubview:nameLabel];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headImageView.mas_right).offset(10);
            make.top.equalTo(self.headImageView.mas_top);
            make.right.equalTo(self.numLabel.mas_left);
            make.height.equalTo(@(20));
        }];
        
        ///地址
        UILabel *addressLabel = [[UILabel alloc] init];
        addressLabel.backgroundColor = [UIColor clearColor];
        addressLabel.textColor = [UIColor greenColor];
//        addressLabel.text = @"张家界";
        addressLabel.textAlignment = NSTextAlignmentLeft;
        addressLabel.font = [UIFont systemFontOfSize:12];
        addressLabel.numberOfLines = 1;
        self.addressLabel = addressLabel;
        [self addSubview:addressLabel];
        [addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel.mas_left);
            make.top.equalTo(self.nameLabel.mas_bottom);
            make.width.equalTo(self.nameLabel.mas_width);
            make.height.equalTo(self.nameLabel.mas_height);
        }];
        
        
    }
    return self;
}
@end

@implementation SDLiveView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        ///图片
        UIImageView *liveImageView = [[UIImageView alloc] init];
        liveImageView.image = [UIImage imageNamed:@""];
        self.liveImageView = liveImageView;
        [self addSubview:liveImageView];
        [liveImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left);
            make.top.equalTo(self.mas_top);
            make.width.equalTo(self.mas_width);
            make.height.equalTo(self.mas_height);
        }];
        
        ///内容了
        UILabel *contentLabel = [[UILabel alloc] init];
        contentLabel.backgroundColor = [UIColor clearColor];
        contentLabel.textColor = [UIColor whiteColor];
        contentLabel.text = @"来唱歌了";
        contentLabel.textAlignment = NSTextAlignmentLeft;
        contentLabel.font = [UIFont systemFontOfSize:15];
        contentLabel.numberOfLines = 0;
        self.contentLabel = contentLabel;
        [self addSubview:contentLabel];
        [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(10);
            make.bottom.equalTo(self.mas_bottom).offset(-20);
            make.width.equalTo(self.mas_width);
            make.height.equalTo(@(20));
        }];
        ///直播状态
        UILabel *stateLabel = [[UILabel alloc] init];
        stateLabel.backgroundColor = [UIColor clearColor];
        stateLabel.textColor = [UIColor blackColor];
        stateLabel.text = @"直播中";
        stateLabel.textAlignment = NSTextAlignmentCenter;
        stateLabel.font = [UIFont systemFontOfSize:15];
        stateLabel.numberOfLines = 1;
        [self addSubview:stateLabel];
        self.stateLabel = stateLabel;
        [stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-15);
            make.top.equalTo(self.mas_top).offset(15);
            make.width.equalTo(@(100));
            make.height.equalTo(@(20));
        }];
    }
    return self;
}

@end

@implementation SDLiveTableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellId = @"SDLiveTableViewCell";
    SDLiveTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        
        cell =[[SDLiveTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ( self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    SDHeadView *headView = [[SDHeadView alloc] init];
    headView.backgroundColor = [UIColor clearColor];
    [self addSubview:headView];
    self.headView = headView;
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top);
        make.width.equalTo(self.mas_width);
        make.height.equalTo(@(50));
    }];
    
    SDLiveView *liveView = [[SDLiveView alloc] init];
    liveView.backgroundColor = [UIColor clearColor];
    self.liveView = liveView;
    [self addSubview:liveView];
    [liveView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.headView.mas_bottom);
        make.width.height.equalTo(self.mas_width);
    }];
    
    
    
}

- (void)setCellValue:(SDLiveModel *)liveModel{
    
    [self.headView.headImageView sd_setImageWithURL:[NSURL URLWithString:liveModel.creator.portrait]];
    self.headView.nameLabel.text = liveModel.creator.nick;
    self.headView.addressLabel.text = liveModel.creator.location;
    self.headView.numLabel.text = [NSString stringWithFormat:@"%ld在看",liveModel.onlineUsers];
    [self.liveView.liveImageView sd_setImageWithURL:[NSURL URLWithString:liveModel.creator.portrait]];
    self.liveView.contentLabel.text = liveModel.creator.descriptionField;
    self.liveView.stateLabel.text =liveModel.status==1?@"直播中":@"直播";
}
@end
