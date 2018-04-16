#import <CoreData/CoreData.h>
@class SDLiveModel;

@interface SDHotLiveModel : NSObject

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger dmError;
@property (nonatomic, strong) NSString * errorMsg;
@property (nonatomic, assign) NSInteger expireTime;
@property (nonatomic, strong) NSArray * lives;


@end
