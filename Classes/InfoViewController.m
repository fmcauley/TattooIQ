

#import "InfoViewController.h"
#import "Quiz_GameViewController.h"


@implementation InfoViewController

@synthesize quiz;

-(IBAction)loadQuizForStart:(id)sender{
  
	[self presentModalViewController:quiz animated:YES];
	NSLog(@"BUTTON PRESSED TO LOAD THE QUIZ");

}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
