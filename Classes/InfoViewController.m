

#import "InfoViewController.h"
#import "Quiz_GameViewController.h"


@implementation InfoViewController

@synthesize quiz;

-(IBAction)loadQuizForStart:(id)sender{
  
	[self presentViewController:quiz animated:YES completion:nil];
	NSLog(@"BUTTON PRESSED TO LOAD THE QUIZ");

}




@end
