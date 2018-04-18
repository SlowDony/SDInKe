//
//  SDHotLiveHandle.m
//  SDInKe
//
//  Created by slowdony on 2018/4/14.
//  Copyright © 2018年 slowdony. All rights reserved.
//

#import "SDHotLiveHandle.h"
#import "SDHttpTool.h"
#import "SDLiveModel.h"
@implementation SDHotLiveHandle

+(void)getHotLiveTaskSuccess:(SuccessBlock )success failed:(FailedBlock )failed{
    
    [SDHttpTool getWithPath:API_HotLive params:nil success:^(id json) {
        if ([json[@"dm_error"] integerValue]!=0) {
            failed(json[@"error_msg"]);
        }else{
         NSArray *lives =   [SDLiveModel mj_objectArrayWithKeyValuesArray:json[@"lives"]];
         DLog(@"json:%@",[json mj_JSONString]);
           success(lives);
            
        }
       
    } failure:^(NSError *error) {
        failed(error);
    }];
    
}
@end
