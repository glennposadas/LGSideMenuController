//
//  RightViewController.m
//  LGSideMenuControllerDemo
//

#import "RightViewController.h"
#import "RightViewCell.h"
#import "MainViewController.h"
#import "UIViewController+LGSideMenuController.h"
#import "Helper.h"

@interface RightViewController ()

@property (strong, nonatomic) NSArray *titlesArray;

@end

@implementation RightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    static unsigned int counter = 0;
    counter++;
    NSLog(@"[RightViewController viewDidLoad], counter: %i", counter);

    // -----

    self.titlesArray = @[@"Open Left View",
                         @"",
                         @"1",
                         @"2",
                         @"3",
                         @"4",
                         @"5",
                         @"6",
                         @"7",
                         @"8",
                         @"9",
                         @"10"];

    // -----

    self.tableView.contentInset = UIEdgeInsetsMake(44.0, 0.0, 44.0, 0.0);
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return UIStatusBarAnimationSlide;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titlesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RightViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    cell.titleLabel.text = self.titlesArray[indexPath.row];
    cell.titleLabel.font = [UIFont boldSystemFontOfSize:indexPath.row == 0 ? 15.0 : 30.0];
    cell.separatorView.hidden = (indexPath.row <= 1 || indexPath.row == self.titlesArray.count - 1);
    cell.userInteractionEnabled = (indexPath.row != 1);

    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.row == 1 ? 50.0 : 100.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MainViewController *mainViewController = (MainViewController *)self.sideMenuController;

    if (indexPath.row == 0) {
        if (mainViewController.isRightViewAlwaysVisibleForCurrentOrientation) {
            [mainViewController showLeftViewAnimated:YES completionHandler:nil];
        }
        else {
            [mainViewController hideRightViewAnimated:YES completionHandler:^(void) {
                [mainViewController showLeftViewAnimated:YES completionHandler:nil];
            }];
        }
    }
    else {
        UIViewController *viewController = [UIViewController new];
        viewController.view.backgroundColor = (Helper.isLightTheme ? UIColor.whiteColor : UIColor.blackColor);
        viewController.title = [NSString stringWithFormat:@"Test %@", self.titlesArray[indexPath.row]];

        UINavigationController *navigationController = (UINavigationController *)mainViewController.rootViewController;
        [navigationController pushViewController:viewController animated:YES];

        [mainViewController hideRightViewAnimated:YES completionHandler:nil];
    }
}

#pragma mark - Logging

- (void)dealloc {
    static unsigned int counter = 0;
    counter++;
    NSLog(@"[RightViewController dealloc], counter: %i", counter);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    static unsigned int counter = 0;
    counter++;
    NSLog(@"[RightViewController viewWillAppear: %@], counter: %i", (animated ? @"true" : @"false"), counter);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    static unsigned int counter = 0;
    counter++;
    NSLog(@"[RightViewController viewDidAppear: %@], counter: %i", (animated ? @"true" : @"false"), counter);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    static unsigned int counter = 0;
    counter++;
    NSLog(@"[RightViewController viewWillDisappear: %@], counter: %i", (animated ? @"true" : @"false"), counter);
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    static unsigned int counter = 0;
    counter++;
    NSLog(@"[RightViewController viewDidDisappear: %@], counter: %i", (animated ? @"true" : @"false"), counter);
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    static unsigned int counter = 0;
    counter++;
    NSLog(@"[RightViewController viewWillLayoutSubviews], counter: %i", counter);
}

@end
