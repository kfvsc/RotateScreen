#import "ViewController.h"
#include "main.h"

@implementation ViewController

- (void)runEntryPoint {
    char* argv[] = {const_cast<char*>(NSBundle.mainBundle.executablePath.fileSystemRepresentation)};
    appEntryPoint(1, argv);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [self runEntryPoint];
}

- (void)viewDidLoad {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

-(void) deviceOrientationDidChange:(NSNotification *)notification {
    UIDevice* device = notification.object;

    switch(device.orientation) {
        case UIDeviceOrientationPortrait:
            self.currentOrientation = UIInterfaceOrientationMaskPortrait;
            break;

        // case UIDeviceOrientationPortraitUpsideDown:
        //     self.currentOrientation = UIInterfaceOrientationMaskPortraitUpsideDown;
        //     break;

        case UIDeviceOrientationLandscapeLeft:
            self.currentOrientation = UIInterfaceOrientationMaskLandscapeRight;
            break;

        case UIDeviceOrientationLandscapeRight:
            self.currentOrientation = UIInterfaceOrientationMaskLandscapeLeft;
            break;

        case UIDeviceOrientationPortraitUpsideDown:
        case UIDeviceOrientationUnknown:
        case UIDeviceOrientationFaceUp:
        case UIDeviceOrientationFaceDown:
          break;
    };

    if (@available(iOS 16, *)) {
        [UIView performWithoutAnimation:^{
            [super setNeedsUpdateOfSupportedInterfaceOrientations];
        }];
    } else {
        // [UIView setAnimationsEnabled:NO];
        NSLog(@"Not supported");
    }
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if (!self.currentOrientation) return UIInterfaceOrientationMaskPortrait;
    return self.currentOrientation;
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    [coordinator.containerView setTransform:CGAffineTransformConcat(coordinator.containerView.transform, CGAffineTransformInvert([coordinator targetTransform]))];
}

@end
