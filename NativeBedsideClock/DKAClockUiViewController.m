//
//  DKAClockUiViewController.m
//  NativeBedsideClock
//
//  Created by Daniel Albertson on 12/11/13.
//
//

#import "DKAClockUiViewController.h"

@interface DKAClockUiViewController ()

@end

@implementation DKAClockUiViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self updateTime];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateTime
{
    NSDateFormatter *date_format = [[NSDateFormatter alloc] init];
    [date_format setDateFormat:@"hh:mm:ss"];
    self.timeLabel.text = [date_format stringFromDate:[NSDate date]];
    
    // repeat every second
    [self performSelector:@selector(updateTime) withObject:self afterDelay:1.0];
    
}

@end
