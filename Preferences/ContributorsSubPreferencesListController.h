//
//  ContributorsSubPreferencesListController.m
//  Another
//  Created by MatveyTitor (IH8Jam) on 01.02.2022.
//
//  *PATENTED! Any use of this file for commercial purposes is prohibited. All rights reserved.
//


#import <Preferences/PSListController.h>
#import <Preferences/PSListItemsController.h>
#import <Preferences/PSSpecifier.h>
#import <CepheiPrefs/HBListController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>

@interface AppearanceSettings : HBAppearanceSettings
@end

@interface ContributorsSubPreferencesListController : HBListController
@property(nonatomic, retain)AppearanceSettings* appearanceSettings;
@property(nonatomic, retain)UILabel* titleLabel;
@property(nonatomic, retain)UIBlurEffect* blur;
@property(nonatomic, retain)UIVisualEffectView* blurView;
@end
