//
//  WelcomeViewController.h
//  Another
//  Created by MatveyTitor (IH8Jam) on 01.02.2022.
//
//  *PATENTED! Any use of this file for commercial purposes is prohibited. All rights reserved.
//



#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

@interface WelcomeViewController : UIViewController
@property(nonatomic, retain)UIImageView* headerImg;
@property(nonatomic, retain)UIView* drag;
@property(nonatomic, retain)UIPanGestureRecognizer* panGest;
@property(nonatomic, retain)UILabel* headerTl;
@property(nonatomic, retain)UILabel* headerSTl;
@property(nonatomic, retain)UIButton* githubCellIcon;
@property(nonatomic, retain)UILabel* githubCellTitle;
@property(nonatomic, retain)UILabel* githubCellSubtitle;
@property(nonatomic, retain)UIButton* discordCellIcon;
@property(nonatomic, retain)UILabel* discordCellTitle;
@property(nonatomic, retain)UILabel* discordCellSubtitle;
@property(nonatomic, retain)UILabel* hLabel;
@end
