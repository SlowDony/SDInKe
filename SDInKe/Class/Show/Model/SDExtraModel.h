#import <CoreData/CoreData.h>
@class SDLiveModel;

@interface SDExtraModel : NSObject

@property (nonatomic, strong) SDLiveModel * live;
@property (nonatomic, strong) NSObject * cover;
@property (nonatomic, strong) NSSet * label;


@end
