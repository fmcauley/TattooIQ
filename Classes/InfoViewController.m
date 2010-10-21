

#import "InfoViewController.h"
#import "Quiz_GameViewController.h"


@implementation InfoViewController

@synthesize quiz;

-(IBAction)loadQuizForStart:(id)sender{
  
	[self presentModalViewController:quiz animated:YES];
	NSLog(@"BUTTON PRESSED TO LOAD THE QUIZ");

}


- (void)dealloc {
    [super dealloc];
}


@end
