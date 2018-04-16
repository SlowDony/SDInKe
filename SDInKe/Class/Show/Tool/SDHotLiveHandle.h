//
//  SDHotLiveHandle.h
//  SDInKe
//
//  Created by slowdony on 2018/4/14.
//  Copyright © 2018年 slowdony. All rights reserved.
//

#import "SDBaseHandler.h"

@interface SDHotLiveHandle : SDBaseHandler

+(void)getHotLiveTaskSuccess:(SuccessBlock )success failed:(FailedBlock )failed;
@end
