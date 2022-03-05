//
//  Another.x
//  Another
//
//  This is tweakfile. written in logos.
//
//  Created by MatveyTitor (IH8Jam) on 01.02.2022.
//
//  *PATENTED! Any use of this file for commercial purposes is prohibited. All rights reserved.
//



#import "Another.h"

%group Another

%hook SiriUIBackgroundBlurViewController

- (void)viewDidLoad {

	%orig;

	if ([amountBlur doubleValue] != 0) {
		if (!blur) {
			if ([blurValue intValue] == 0)
				blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
			else if ([blurValue intValue] == 1)
				blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
			else if ([blurValue intValue] == 2)
				blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
		}
		if (!blurView) blurView = [[UIVisualEffectView alloc] initWithEffect:blur];
		[blurView setFrame:[[self view] bounds]];
		[blurView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
		[blurView setClipsToBounds:YES];
		[blurView setAlpha:[amountBlur doubleValue]];
		if (![blurView isDescendantOfView:[self view]]) [[self view] addSubview:blurView];
	}


	if (!anotherImgView) anotherImgView = [UIImageView new];

	if (!fillFullScreen)
		[anotherImgView setContentMode:UIViewContentModeScaleAspectFit];
	else
		[anotherImgView setContentMode:UIViewContentModeScaleAspectFill];

	if (!customImage)
		[anotherImgView setImage:[UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/AnotherPrefs.bundle/astolfo.png"]];
	else
		[anotherImgView setImage:[GcImagePickerUtils imageFromDefaults:@"jam.another.descript" withKey:@"mainImage"]];
		
	[anotherImgView setAlpha:0];
	if (![anotherImgView isDescendantOfView:[self view]]) [[self view] addSubview:anotherImgView];

	[anotherImgView setTranslatesAutoresizingMaskIntoConstraints:NO];
	[anotherImgView.widthAnchor constraintEqualToConstant:self.view.bounds.size.width].active = YES;
	[anotherImgView.heightAnchor constraintEqualToConstant:self.view.bounds.size.height].active = YES;
	[anotherImgView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor constant:[xPosVal doubleValue]].active = YES;
	[anotherImgView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:[yPosVal doubleValue]].active = YES;

}

- (void)viewWillAppear:(BOOL)animated {

	%orig;

	[UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
		[blurView setAlpha:[amountBlur doubleValue]];
		[anotherImgView setAlpha:[useAlpha doubleValue]];
	} completion:nil];

}

%end

%hook SiriPresentationViewController

- (void)viewWillDisappear:(BOOL)animated {

	%orig;

	[UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
		[blurView setAlpha:0];
		[anotherImgView setAlpha:0];
	} completion:nil];

}

%end

%end

%group AnotherForIos13

%hook AFUISiriViewController

- (void)viewDidLoad {

	%orig;

	if (!anotherImgView) anotherImgView = [UIImageView new];

	if (!fillFullScreen)
		[anotherImgView setContentMode:UIViewContentModeScaleAspectFit];
	else
		[anotherImgView setContentMode:UIViewContentModeScaleAspectFill];

	if (!customImage)
		[anotherImgView setImage:[UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/AnotherPrefs.bundle/astolfo.png"]];
	else
		[anotherImgView setImage:[GcImagePickerUtils imageFromDefaults:@"jam.another.descriptprefs" withKey:@"mainImage"]];
		
	[anotherImgView setAlpha:0];
	[[self view] addSubview:anotherImgView];

	[anotherImgView setTranslatesAutoresizingMaskIntoConstraints:NO];
	[anotherImgView.widthAnchor constraintEqualToConstant:self.view.bounds.size.width].active = YES;
	[anotherImgView.heightAnchor constraintEqualToConstant:self.view.bounds.size.height].active = YES;
	[anotherImgView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor constant:[xPosVal doubleValue]].active = YES;
	[anotherImgView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:[yPosVal doubleValue]].active = YES;

}

- (void)viewWillAppear:(BOOL)animated {

	%orig;

	[UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
		[anotherImgView setAlpha:[useAlpha doubleValue]];
	} completion:nil];

}

- (void)viewWillDisappear:(BOOL)animated {

	%orig;

	[UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
		[anotherImgView setAlpha:0];
	} completion:nil];

}

%end

%end

%ctor {

	preferences = [[HBPreferences alloc] initWithIdentifier:@"jam.another.descriptprefs"];

	[preferences registerBool:&enabled default:NO forKey:@"Enabled"];
	if (!enabled) return;

	[preferences registerBool:&customImage default:NO forKey:@"useCustomImage"];
	[preferences registerBool:&fillFullScreen default:NO forKey:@"fillScreen"];
	[preferences registerObject:&xPosVal default:@"0" forKey:@"XPosition"];
	[preferences registerObject:&yPosVal default:@"150" forKey:@"YPosition"];
	[preferences registerObject:&useAlpha default:@"1" forKey:@"Alpha"];

	if (!SYSTEM_VERSION_LESS_THAN(@"14")) {
		[preferences registerObject:&blurValue default:@"2" forKey:@"blur"];
		[preferences registerObject:&amountBlur default:@"0" forKey:@"blurAmount"];
	}

	if (!SYSTEM_VERSION_LESS_THAN(@"14")) %init(Another);
	else if (SYSTEM_VERSION_LESS_THAN(@"14")) %init(AnotherForIos13);

}
