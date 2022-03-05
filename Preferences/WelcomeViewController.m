//
//  WelcomeViewController.m
//  Another
//  Created by Matvey Titor (IH8Jam) on 01.02.2022.
//
//  *PATENTED! Any use of this file for commercial purposes is prohibited. All rights reserved.
//

#import "WelcomeViewController.h"

@implementation WelcomeViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor systemBackgroundColor]];


    NSData* inData = [NSData dataWithContentsOfURL:[NSURL fileURLWithPath:@"/Library/PreferenceBundles/AnotherPrefs.bundle/welcome/mainFont.ttf"]];
    CFErrorRef error;
    CGDataProviderRef provider = CGDataProviderCreateWithCFData((CFDataRef)inData);
    CGFontRef font = CGFontCreateWithDataProvider(provider);
    if (!CTFontManagerRegisterGraphicsFont(font, &error)) {
        CFStringRef errorDescription = CFErrorCopyDescription(error);
        CFRelease(errorDescription);
    }
    CFRelease(font);
    CFRelease(provider);


    self.headerImg = [UIImageView new];
    [[self headerImg] setContentMode:UIViewContentModeScaleAspectFill];
    [[self headerImg] setImage:[UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/AnotherPrefs.bundle/welcome/header.png"]];
    [[self view] addSubview:[self headerImg]];

    [[self headerImg] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [self.headerImg.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:12],
        [self.headerImg.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.headerImg.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.headerImg.heightAnchor constraintEqualToConstant:400],
    ]];
    
    

    self.drag = [UIView new];
    [[self drag] setBackgroundColor:[UIColor systemBackgroundColor]];
    [[[self drag] layer] setBorderWidth:3];
    [[[self drag] layer] setBorderColor:[[UIColor colorWithRed:1 green:0.47 blue:0.60 alpha:1] CGColor]];
    [[self view] addSubview:[self drag]];
    
    [[self drag] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [self.drag.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [self.drag.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:-3],
        [self.drag.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:3],
        [self.drag.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:3],
    ]];
    [[self drag] setTransform:CGAffineTransformMakeTranslation(0, 330)];
    
    
    self.panGest = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    [[self drag] addGestureRecognizer:[self panGest]];
    
    
    self.headerTl = [UILabel new];
    [[self headerTl] setText:@"Underworld"];
    [[self headerTl] setFont:[UIFont fontWithName:@"Circle Of Love" size:50]];
    [[self headerTl] setTextColor:[UIColor labelColor]];
    [[self drag] addSubview:[self headerTl]];
    
    [[self headerTl] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [self.headerTl.topAnchor constraintEqualToAnchor:self.drag.topAnchor constant:12],
        [self.headerTl.centerXAnchor constraintEqualToAnchor:self.drag.centerXAnchor],
    ]];
    
    

    self.headerSTl = [UILabel new];
    [[self headerSTl] setText:@"merci"];
    [[self headerSTl] setFont:[UIFont fontWithName:@"mainFont" size:27]];
    [[self headerSTl] setTextColor:[UIColor labelColor]];
    [[self drag] addSubview:[self headerSTl]];
    
    [[self headerSTl] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [self.headerSTl.topAnchor constraintEqualToAnchor:self.headerTl.bottomAnchor constant:0],
        [self.headerSTl.centerXAnchor constraintEqualToAnchor:self.drag.centerXAnchor],
    ]];
    
    
    self.githubCellIcon = [UIButton new];
    [[self githubCellIcon] addTarget:self action:@selector(openGitHubURL) forControlEvents:UIControlEventTouchUpInside];
    [[self githubCellIcon] setContentMode:UIViewContentModeScaleAspectFill];
    [[self githubCellIcon] setImage:[UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/AnotherPrefs.bundle/welcome/github.png"] forState:UIControlStateNormal];
    [[self githubCellIcon] setClipsToBounds:YES];
    [[[self githubCellIcon] layer] setCornerRadius:10];
    [[[self githubCellIcon] layer] setBorderColor:[[UIColor colorWithRed:0.84 green:0.89 blue:1 alpha:1] CGColor]];
    [[[self githubCellIcon] layer] setBorderWidth:2];
    [[self drag] addSubview:[self githubCellIcon]];

    [[self githubCellIcon] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [self.githubCellIcon.topAnchor constraintEqualToAnchor:self.headerSTl.bottomAnchor constant:45],
        [self.githubCellIcon.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:16],
        [self.githubCellIcon.widthAnchor constraintEqualToConstant:85],
        [self.githubCellIcon.heightAnchor constraintEqualToConstant:85],
    ]];
    
    
    self.githubCellTitle = [UILabel new];
    [[self githubCellTitle] setText:@"GitHub"];
    [[self githubCellTitle] setFont:[UIFont systemFontOfSize:27 weight:UIFontWeightMedium]];
    [[self githubCellTitle] setTextColor:[UIColor labelColor]];
    [[self drag] addSubview:[self githubCellTitle]];
    
    [[self githubCellTitle] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [self.githubCellTitle.topAnchor constraintEqualToAnchor:self.githubCellIcon.topAnchor constant:4],
        [self.githubCellTitle.leadingAnchor constraintEqualToAnchor:self.githubCellIcon.trailingAnchor constant:16],
        [self.githubCellTitle.trailingAnchor constraintEqualToAnchor:self.drag.trailingAnchor constant:-16],
    ]];
    
    
    self.githubCellSubtitle = [UILabel new];
    [[self githubCellSubtitle] setText:@"Take a look at my profile on github!"];
    [[self githubCellSubtitle] setNumberOfLines:2];
    [[self githubCellSubtitle] setFont:[UIFont systemFontOfSize:18 weight:UIFontWeightRegular]];
    [[self githubCellSubtitle] setTextColor:[UIColor labelColor]];
    [[self drag] addSubview:[self githubCellSubtitle]];
    
    [[self githubCellSubtitle] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [self.githubCellSubtitle.topAnchor constraintEqualToAnchor:self.githubCellTitle.bottomAnchor constant:0],
        [self.githubCellSubtitle.leadingAnchor constraintEqualToAnchor:self.githubCellIcon.trailingAnchor constant:16],
        [self.githubCellSubtitle.trailingAnchor constraintEqualToAnchor:self.drag.trailingAnchor constant:-16],
    ]];
    
    
    self.discordCellIcon = [UIButton new];
    [[self discordCellIcon] addTarget:self action:@selector(openDiscordURL) forControlEvents:UIControlEventTouchUpInside];
    [[self discordCellIcon] setContentMode:UIViewContentModeScaleAspectFill];
    [[self discordCellIcon] setImage:[UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/AnotherPrefs.bundle/welcome/discord.png"] forState:UIControlStateNormal];
    [[self discordCellIcon] setClipsToBounds:YES];
    [[[self discordCellIcon] layer] setCornerRadius:10];
    [[[self discordCellIcon] layer] setBorderColor:[[UIColor colorWithRed:0.58 green:0.66 blue:0.71 alpha:1] CGColor]];
    [[[self discordCellIcon] layer] setBorderWidth:2];
    [[self drag] addSubview:[self discordCellIcon]];

    [[self discordCellIcon] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [self.discordCellIcon.topAnchor constraintEqualToAnchor:self.githubCellIcon.bottomAnchor constant:45],
        [self.discordCellIcon.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:16],
        [self.discordCellIcon.widthAnchor constraintEqualToConstant:85],
        [self.discordCellIcon.heightAnchor constraintEqualToConstant:85],
    ]];
    
    
    self.discordCellTitle = [UILabel new];
    [[self discordCellTitle] setText:@"Discord"];
    [[self discordCellTitle] setFont:[UIFont systemFontOfSize:27 weight:UIFontWeightMedium]];
    [[self discordCellTitle] setTextColor:[UIColor labelColor]];
    [[self drag] addSubview:[self discordCellTitle]];
    
    [[self discordCellTitle] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [self.discordCellTitle.topAnchor constraintEqualToAnchor:self.discordCellIcon.topAnchor constant:4],
        [self.discordCellTitle.leadingAnchor constraintEqualToAnchor:self.discordCellIcon.trailingAnchor constant:16],
        [self.discordCellTitle.trailingAnchor constraintEqualToAnchor:self.drag.trailingAnchor constant:-16],
    ]];
    
    
    self.discordCellSubtitle = [UILabel new];
    [[self discordCellSubtitle] setText:@"My DC world"];
    [[self discordCellSubtitle] setNumberOfLines:2];
    [[self discordCellSubtitle] setFont:[UIFont systemFontOfSize:18 weight:UIFontWeightRegular]];
    [[self discordCellSubtitle] setTextColor:[UIColor labelColor]];
    [[self drag] addSubview:[self discordCellSubtitle]]
    
    [[self discordCellSubtitle] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [self.discordCellSubtitle.topAnchor constraintEqualToAnchor:self.discordCellTitle.bottomAnchor constant:0],
        [self.discordCellSubtitle.leadingAnchor constraintEqualToAnchor:self.discordCellIcon.trailingAnchor constant:16],
        [self.discordCellSubtitle.trailingAnchor constraintEqualToAnchor:self.drag.trailingAnchor constant:-16],
    ]];
    
    
    self.hLabel = [UILabel new];
    [[self hLabel] setText:@"You can always access\n these links inside the preferences"];
    [[self hLabel] setNumberOfLines:2];
    [[self hLabel] setTextAlignment:NSTextAlignmentCenter];
    [[self hLabel] setFont:[UIFont systemFontOfSize:16 weight:UIFontWeightMedium]];
    [[self hLabel] setTextColor:[UIColor labelColor]];
    [[self drag] addSubview:[self hLabel]];

    [[self hLabel] setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [self.hLabel.bottomAnchor constraintEqualToAnchor:self.drag.bottomAnchor constant:-32],
        [self.hLabel.leadingAnchor constraintEqualToAnchor:self.drag.leadingAnchor constant:32],
        [self.hLabel.trailingAnchor constraintEqualToAnchor:self.drag.trailingAnchor constant:-32],
    ]];

}

- (void)handlePanGesture:(UIPanGestureRecognizer *)recognizer {

    CGPoint translation = CGPointMake(0, 0);
    
    if ([recognizer state] == UIGestureRecognizerStateChanged) {
        translation = [recognizer translationInView:[self drag]];
        if (translation.y > 0) return;
        [UIView animateWithDuration:0.1 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            [[self drag] setTransform:CGAffineTransformMakeTranslation(0, 330 + translation.y)];
        } completion:nil];
        
        if (translation.y <= -150) {
            [UIView animateWithDuration:0.35 delay:0 usingSpringWithDamping:5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                [[self drag] setTransform:CGAffineTransformIdentity];
                [[[self drag] layer] setBorderWidth:0];
                [[self headerSTl] setAlpha:0];
            } completion:nil];
            [[self panGest] setEnabled:NO];
        }
    } else if ([recognizer state] == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            [[self drag] setTransform:CGAffineTransformMakeTranslation(0, 330)];
        } completion:nil];
    }

}


- (void)openGitHubURL {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/IH8Jam"] options:@{} completionHandler:nil];
    
}

- (void)openDiscordURL {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://discord.gg/4vZw4wWmfW"] options:@{} completionHandler:nil];
    
}

@end
