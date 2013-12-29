//
//  DKAClockUiViewController.h
//  NativeBedsideClock
//
//  Created by Daniel Albertson on 12/11/13.
//
//

#import <UIKit/UIKit.h>

@interface DKAClockUiViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property NSDateFormatter *dateFormatter;

@property  NSString* fontColorString;

@property  NSString* fontNameString;

@property bool showTwentyFourHour;

@property bool showSeconds;

@end
