//
//  DKAPrefencesViewController.h
//  NativeBedsideClock
//
//  Created by Daniel Albertson on 12/28/13.
//
//

#import <UIKit/UIKit.h>


@interface DKAPrefencesViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *fontColor;

@property (weak, nonatomic) IBOutlet UILabel *fontName;

@property (weak, nonatomic) IBOutlet UISwitch *twentyFourHourSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *secondsSwitch;

@property  NSString* fontColorString;

@property  NSString* fontNameString;

@property bool showTwentyFourHour;

@property bool showSeconds;

@end
