#import <CoreData/CoreData.h>
@class SDHotLiveModel;
@class SDActInfoModel;
@class SDCreatorModel;
@class SDExtraModel;

@interface SDLiveModel : NSObject

@property (nonatomic, strong) SDHotLiveModel * rootClass;
@property (nonatomic, strong) SDActInfoModel * actInfo;
@property (nonatomic, strong) NSString * city;
@property (nonatomic, strong) SDCreatorModel * creator;
@property (nonatomic, strong) NSString * extendType;
@property (nonatomic, strong) SDExtraModel * extra;
@property (nonatomic, assign) NSInteger group;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * image;
@property (nonatomic, assign) NSInteger landscape;
@property (nonatomic, strong) NSSet * like;
@property (nonatomic, assign) NSInteger link;
@property (nonatomic, strong) NSString * liveType;
@property (nonatomic, assign) NSInteger multi;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger onlineUsers;
@property (nonatomic, assign) NSInteger optimal;
@property (nonatomic, assign) NSInteger pubStat;
@property (nonatomic, assign) NSInteger roomId;
@property (nonatomic, assign) NSInteger rotate;
@property (nonatomic, strong) NSString * shareAddr;
@property (nonatomic, assign) NSInteger slot;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString * streamAddr;
@property (nonatomic, assign) NSInteger version;

@end
