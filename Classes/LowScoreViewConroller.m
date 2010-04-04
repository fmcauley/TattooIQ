
#import "LowScoreViewConroller.h"
#import "InfoViewController.h"
#import "HellCityAppsViewController.h"
#import "TwitterViewController.h"
#import "FacebookAPI.h"



@implementation LowScoreViewConroller


@synthesize lowScore;

-(IBAction)restartTheGame {
  
	[self presentModalViewController:infoViewController animated:YES];

}

-(IBAction)goToWebSite{
	
	[self presentModalViewController:hellCityViewController animated:YES];	
}

-(IBAction)updateTwitter{
	
	[self presentModalViewController:twitterViewController animated:YES];	
}

-(IBAction)updateFacebook{
	[self presentModalViewController:face animated:YES];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	NSString *finishingStatement = [[NSString alloc] initWithFormat:@"You got more than five questions incorrect. You're a scratcher! " 
									@"Study up and take the Tattoo IQ test again. Be sure to post your results and challenge your friends to take the Tattoo IQ test!"];
									
	lowScore.text = finishingStatement;
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
