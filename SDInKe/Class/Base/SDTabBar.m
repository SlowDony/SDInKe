
//
//  SDTabBar.m
//  SDInKe
//
//  Created by slowdony on 2018/1/24.
//  Copyright © 2018年 slowdony. All rights reserved.
//

#import "SDTabBar.h"
@interface SDTabBar()
/**
 背景
 */
@property (nonatomic,strong)  UIImageView *tabBarBJView;
@property (nonatomic,strong)  NSMutableArray *itemArr;
@end
@implementation SDTabBar

-(NSMutableArray *)itemArr{
    if (!_itemArr){
        NSArray *arr = @[@"tab_live",@"tab_me"];
        _itemArr = [NSMutableArray arrayWithArray:arr];
    }
    return _itemArr;
}
-(UIImageView *)tabBarBJView{
    if (!_tabBarBJView){
        _tabBarBJView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"global_tab_bg"]];
    }
    return _tabBarBJView;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tabBarBJView];
        [self setupUI];
    }
    return self;
}

- (void) setupUI{
    for (int i = 0; i < self.itemArr.count; i++) {
        //
        UIButton *itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [itemBtn setImage:[UIImage imageNamed:self.itemArr[i]] forState:UIControlStateNormal];
        [itemBtn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_p",self.itemArr[i]]] forState:UIControlStateNormal];
        [itemBtn  addTarget:self action:@selector(itemBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        itemBtn.tag = TabBarTypeMe+i;
        [self addSubview: itemBtn];
    }
}

- (void)itemBtnClick:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(tabbar:withBtn:)]){
        [self.delegate tabbar:self withBtn:sender.tag];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.tabBarBJView.frame = self.bounds;
    
    CGFloat btnX =0;
    CGFloat btnY =0;
    CGFloat btnW = self.bounds.size.width/self.itemArr.count;
    CGFloat btnH = self.frame.size.height;
    
    for (int i = 0; i<[self subviews].count; i++) {
        UIView *btn = [self subviews][i];
        btnX = (btn.tag-TabBarTypeMe)*btnW;
        if ([btn isKindOfClass:[UIButton class]]) {
            btn.frame = CGRectMake(btnX, btnY, btnW,btnH);
        }
    }
}

@end
