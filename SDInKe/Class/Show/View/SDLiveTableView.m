//
//  SDLiveTableView.m
//  SDInKe
//
//  Created by slowdony on 2018/4/17.
//  Copyright © 2018年 slowdony. All rights reserved.
//

#import "SDLiveTableView.h"
#import "SDLiveTableViewCell.h"
#import "SDLiveModel.h"
@implementation SDLiveTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self){
        
        self.baseDelegate = self;
    }
    return self;
}
#pragma mark ----------UITabelViewDataSource----------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    SDLiveTableViewCell *cell = [SDLiveTableViewCell cellWithTableView:self];
    SDLiveModel *liveModel = self.dataArray[indexPath.row];
    [cell setCellValue:liveModel];
    return cell;
}


#pragma mark ----------UITabelViewDelegate----------

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50+SCREEN_WIDTH;
}

@end
