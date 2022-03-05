//
//  Another.h
//  Another
//  Created by MatveyTitor (IH8Jam) on 01.02.2022.
//
//  This is main header for Another.
//
//  *PATENTED! Any use of this file for commercial purposes is prohibited. All rights reserved.
//



#import <UIKit/UIKit.h>
#import "GcUniversal/GcImagePickerUtils.h"
#import <Cephei/HBPreferences.h>

#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

HBPreferences* preferences = nil;
BOOL enabled = NO;

UIImageView* anotherImgView = nil;
UIVisualEffectView* blurView = nil;
UIBlurEffect* blur = nil;

BOOL customImage = NO;
BOOL fillFullScreen = NO;
NSString* xPosVal = @"0";
NSString* yPosVal = @"150";
NSString* useAlpha = @"1";


NSString* blurValue = @"2";
NSString* amountBlur = @"0";

@interface SiriUIBackgroundBlurViewController : UIViewController
@end

@interface AFUISiriViewController : UIViewController
@end
