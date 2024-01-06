#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic) CGSize screenSize;
@property (nonatomic) CFTimeInterval resizeViewAnimationStartTime;
@property (nonatomic) CFTimeInterval resizeViewAnimationDuration;
@property (nonatomic) CADisplayLink *displayLink;

@end
