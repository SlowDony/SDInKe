#import <CoreData/CoreData.h>

@class SDLiveModel;

@interface SDExtraModel : NSObject

@property (nonatomic, strong) SDLiveModel * live;
@property (nonatomic, strong) NSObject * cover;
@property (nonatomic, strong) NSSet * label;

@end


@interface SDCreatorModel : NSObject

@property (nonatomic, strong) SDLiveModel * live;
@property (nonatomic, strong) NSString * birth;
@property (nonatomic, strong) NSString * descriptionField;
@property (nonatomic, strong) NSString * emotion;
@property (nonatomic, assign) NSInteger gender;
@property (nonatomic, assign) NSInteger gmutex;
@property (nonatomic, strong) NSString * hometown;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, assign) NSInteger inkeVerify;
@property (nonatomic, assign) NSInteger level;
@property (nonatomic, strong) NSString * location;
@property (nonatomic, strong) NSString * nick;
@property (nonatomic, strong) NSString * portrait;
@property (nonatomic, strong) NSString * profession;
@property (nonatomic, assign) NSInteger rankVeri;
@property (nonatomic, assign) NSInteger sex;
@property (nonatomic, strong) NSString * thirdPlatform;
@property (nonatomic, strong) NSString * veriInfo;
@property (nonatomic, assign) NSInteger verified;
@property (nonatomic, strong) NSString * verifiedReason;
@end

@interface SDActInfoModel : NSObject

@property (nonatomic, strong) SDActInfoModel * live;
@property (nonatomic, strong) NSString * icon;
@property (nonatomic, assign) NSInteger uid;

@end

@interface SDHotLiveModel : NSObject

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger dmError;
@property (nonatomic, strong) NSString * errorMsg;
@property (nonatomic, assign) NSInteger expireTime;
@property (nonatomic, strong) NSArray * lives;

@end


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
