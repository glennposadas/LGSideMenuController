//
//  RootNavigationController.m
//  LGSideMenuControllerDemo
//

#import "RootNavigationController.h"
#import "UIViewController+LGSideMenuController.h"
#import "Helper.h"

@implementation RootNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    static unsigned int counter = 0;
    counter++;
    NSLog(@"[RootNavigationController viewDidLoad], counter: %i", counter);

    [self setColors];
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (BOOL)prefersStatusBarHidden {
    return UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication.statusBarOrientation) && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return self.sideMenuController.isRightViewVisible ? UIStatusBarAnimationSlide : UIStatusBarAnimationFade;
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    [self setColors];
}

- (void)setColors {
    self.navigationBar.barTintColor = [UIColor colorWithWhite:(Helper.isLightTheme ? 1.0 : 0.0) alpha:0.9];
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: (Helper.isLightTheme ? UIColor.blackColor : UIColor.whiteColor)};
}

#pragma mark - Logging

- (void)dealloc {
    static unsigned int counter = 0;
    counter++;
    NSLog(@"[RootNavigationController dealloc], counter: %i", counter);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    static unsigned int counter = 0;
    counter++;
    NSLog(@"[RootNavigationController viewWillAppear: %@], counter: %i", (animated ? @"true" : @"false"), counter);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    static unsigned int counter = 0;
    counter++;
    NSLog(@"[RootNavigationController viewDidAppear: %@], counter: %i", (animated ? @"true" : @"false"), counter);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    static unsigned int counter = 0;
    counter++;
    NSLog(@"[RootNavigationController viewWillDisappear: %@], counter: %i", (animated ? @"true" : @"false"), counter);
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    static unsigned int counter = 0;
    counter++;
    NSLog(@"[RootNavigationController viewDidDisappear: %@], counter: %i", (animated ? @"true" : @"false"), counter);
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    static unsigned int counter = 0;
    counter++;
    NSLog(@"[RootNavigationController viewWillLayoutSubviews], counter: %i", counter);
}

@end
