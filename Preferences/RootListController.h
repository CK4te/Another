//
//  RootListController.h
//  Another
//  Created by MatveyTitor (IH8Jam) on 01.02.2022.
//
//  *PATENTED! Any use of this file for commercial purposes is prohibited. All rights reserved.
//



#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>
#import <Cephei/HBPreferences.h>
#import <Cephei/HBRespringController.h>
#import "WelcomeViewController.h"

@interface AppearanceSettings : HBAppearanceSettings
@end

@interface RootListController : HBRootListController
@property(nonatomic, retain)AppearanceSettings* appearanceSettings;
@property(nonatomic, retain)HBPreferences* preferences;
@property(nonatomic, retain)UISwitch* enableSwitch;
@property(nonatomic, retain)UIBarButtonItem* item;
@property(nonatomic, retain)UIView* headerView;
@property(nonatomic, retain)UIImageView* headerImageView;
@property(nonatomic, retain)UILabel* titleLabel;
@property(nonatomic, retain)UIImageView* iconView;
@property(nonatomic, retain)UIBlurEffect* blur;
@property(nonatomic, retain)UIVisualEffectView* blurView;
- (void)setEnabled;
- (void)setEnabledState;
- (void)resetPrompt;
- (void)resetPreferences;
- (void)respring;
@end
