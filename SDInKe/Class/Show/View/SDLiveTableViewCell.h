//
//  SDLiveTableViewCell.h
//  SDInKe
//
//  Created by slowdony on 2018/4/17.
//  Copyright © 2018年 slowdony. All rights reserved.
//

#import "SDBaseTableViewCell.h"
#import "SDLiveModel.h"
#import "SDCreatorModel.h"
@interface SDHeadView :UIView
///头像
@property (nonatomic,strong)  UIImageView *headImageView;
///昵称
@property (nonatomic,strong)  UILabel *nameLabel;
///多少人看
@property (nonatomic,strong)  UILabel *numLabel;
///地址
@property (nonatomic,strong)  UILabel *addressLabel;

@end

@interface SDLiveView :UIView

///图片
@property (nonatomic,strong)  UIImageView *liveImageView;
///内容
@property (nonatomic,strong)  UILabel *contentLabel;
///直播状态
@property (nonatomic,strong)  UILabel *stateLabel;

@end

@interface SDLiveTableViewCell : SDBaseTableViewCell
///头部view
@property (nonatomic,strong)  SDHeadView  *headView;

///直播view
@property (nonatomic,strong)  SDLiveView *liveView;
+(instancetype)cellWithTableView:(UITableView *)tableView;
- (void)setCellValue:(SDLiveModel *)liveModel;
@end
