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

@end
