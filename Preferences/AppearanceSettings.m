//
//  RootListController.m
//  Another
//  Created by MatveyTitor (IH8Jam) on 01.02.2022.
//
//  *PATENTED! Any use of this file for commercial purposes is prohibited. All rights reserved.
//



#import "RootListController.h"

@implementation AppearanceSettings

- (UIColor *)tintColor {

    return [UIColor colorWithRed: 0.96 green: 0.76 blue: 0.81 alpha: 1.00];

}

- (UIColor *)statusBarTintColor {

    return [UIColor whiteColor];

}

- (UIColor *)navigationBarTitleColor {

    return [UIColor whiteColor];

}

- (UIColor *)navigationBarTintColor {

    return [UIColor whiteColor];

}

- (UIColor *)tableViewCellSeparatorColor {

    return [UIColor colorWithWhite:0 alpha:0];

}

- (UIColor *)navigationBarBackgroundColor {

    return [UIColor colorWithRed: 0.96 green: 0.76 blue: 0.81 alpha: 1.00];

}

- (BOOL)translucentNavigationBar {

    return YES;

}

@end
