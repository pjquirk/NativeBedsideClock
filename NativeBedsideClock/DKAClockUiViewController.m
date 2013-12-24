//
//  DKAClockUiViewController.m
//  NativeBedsideClock
//
//  Created by Daniel Albertson on 12/11/13.
//
//

#import "DKAClockUiViewController.h"
#import "DKAFontTableViewController.h"

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
    
    [self.timeLabel setCenter:self.view.center];
    
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
    [date_format setDateFormat:@"hh:mm:ss a"];
    self.timeLabel.text = [date_format stringFromDate:[NSDate date]];
    
    // repeat every second
    [self performSelector:@selector(updateTime) withObject:self afterDelay:1.0];
    
}

- (IBAction)unwindToClock:(UIStoryboardSegue *)segue
{
    DKAFontTableViewController* source = [segue sourceViewController];
    self.timeLabel.font = [UIFont fontWithName:source.selectedFont size:self.timeLabel.font.pointSize];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self.timeLabel setCenter:self.view.center];
}
@end
