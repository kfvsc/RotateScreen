#import <UIKit/UIKit.h>

void setUIView(long winId) {
    UIView *qmlWindowView = (__bridge UIView*)reinterpret_cast<void*>(winId);
    UIViewController *viewController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [viewController setView: qmlWindowView];
}
