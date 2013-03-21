

#import "FinalViewController.h"
#import "InfoViewController.h"
#import "HellCityAppsViewController.h"
#import "TwitterViewController.h"


@implementation FinalViewController

@synthesize finalScore;


-(IBAction)restartTheGame:(id)sender {
	
	[self presentModalViewController:infoViewController animated:YES];
	
}

-(IBAction)goToWebSite:(id)sender {
	
	[self presentModalViewController:hellCityViewController animated:YES];
	
}

-(IBAction)updateTwitter:(id)sender{
	[self presentModalViewController:twitterViewController animated:YES];
}

-(IBAction)updateFacebook{
	
}







// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	NSString *finishingStatement = [[NSString alloc] initWithFormat:@"Congratulations! Your tattoo knowledge is impressive,"
									@" you're a Tattoo Guru! Be sure to post your results and challenge your friends to take the" 
									@" Tattoo IQ test!"];
	
	finalScore.text = finishingStatement;
	[finishingStatement release];
	
	
	
	
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
  	

}


- (void)dealloc {
    [super dealloc];
}


@end
