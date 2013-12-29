//
//  DKAClockUiViewController.m
//  NativeBedsideClock
//
//  Created by Daniel Albertson on 12/11/13.
//
//

#import "DKAClockUiViewController.h"
#import "DKAPrefencesViewController.h"

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
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"hh:mm:ss a"];
    
    self.showSeconds = true;
    self.showTwentyFourHour = false;
    self.fontNameString = self.timeLabel.font.fontName;
    
    [self updateTime];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateTime
{
    self.timeLabel.text = [self.dateFormatter stringFromDate:[NSDate date]];
    
    // repeat every second
    [self performSelector:@selector(updateTime) withObject:self afterDelay:1.0];
    
}

- (IBAction)unwindToClock:(UIStoryboardSegue *)segue
{
    self.timeLabel.font = [UIFont fontWithName:self.fontNameString size:self.timeLabel.font.pointSize];
    
    if (self.showTwentyFourHour)
    {
        if (self.showSeconds)
        {
            [self.dateFormatter setDateFormat:@"HH:mm:ss"];
        }
        else
        {
            [self.dateFormatter setDateFormat:@"HH:mm"];
        }
    }
    else
    {
        if (self.showSeconds)
        {
            [self.dateFormatter setDateFormat:@"hh:mm:ss a"];
        }
        else
        {
            [self.dateFormatter setDateFormat:@"hh:mm a"];
        }
    }
    
    [self updateTime];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"clockToPreferences"])
    {
        DKAPrefencesViewController* dest = [segue destinationViewController];
        
        dest.fontNameString = self.fontNameString;
        dest.showTwentyFourHour = self.showTwentyFourHour;
        dest.showSeconds = self.showSeconds;
    }
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
