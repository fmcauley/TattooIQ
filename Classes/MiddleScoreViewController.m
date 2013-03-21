

#import "MiddleScoreViewController.h"
#import "InfoViewController.h"
#import "HellCityAppsViewController.h"
#import "TwitterViewController.h"


@implementation MiddleScoreViewController



@synthesize middleOutput;

-(IBAction)restartTheGame:(id) sender{
	
	[self presentViewController:infoViewController animated:YES completion:nil];
	
}

-(IBAction)goToWebSite:(id)sender{
	
	[self presentViewController:hellCityViewController animated:YES completion:nil];
	
}
-(IBAction)updateTwitter:(id)sender{
	[self presentViewController:twitterViewController animated:YES completion:nil];
 }

-(IBAction)updateFacebook{
	
}




// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	NSString *finishingStatement = [[NSString alloc] initWithFormat:@"You missed more than two questions. You're still a tattoo apprentice. " 
									@"Be sure to post your results and challenge your friends to take the Tattoo IQ test!"];
	middleOutput.text = finishingStatement;
	
	
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




@end
