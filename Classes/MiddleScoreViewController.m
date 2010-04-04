

#import "MiddleScoreViewController.h"
#import "InfoViewController.h"
#import "HellCityAppsViewController.h"
#import "TwitterViewController.h"


@implementation MiddleScoreViewController



@synthesize middleOutput;

-(IBAction)restartTheGame:(id) sender{
	
	[self presentModalViewController:infoViewController animated:YES];
	
}

-(IBAction)goToWebSite:(id)sender{
	
	[self presentModalViewController:hellCityViewController animated:YES];
	
}
-(IBAction)updateTwitter:(id)sender{
	[self presentModalViewController:twitterViewController animated:YES];
 }

-(IBAction)updateFacebook{
	[self presentModalViewController:face animated:YES];
}




// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	NSString *finishingStatement = [[NSString alloc] initWithFormat:@"You missed more than two questions. You're still a tattoo apprentice. " 
									@"Be sure to post your results and challenge your friends to take the Tattoo IQ test!"];
	middleOutput.text = finishingStatement;
	
	
	[finishingStatement release];
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
