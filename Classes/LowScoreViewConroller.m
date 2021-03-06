
#import "LowScoreViewConroller.h"
#import "InfoViewController.h"
#import "HellCityAppsViewController.h"
#import "TwitterViewController.h"




@implementation LowScoreViewConroller


@synthesize lowScore;

#pragma mark -
#pragma mark Button actions

-(IBAction)restartTheGame {
  
	//[self presentModalViewController:infoViewController animated:YES];
    [self presentViewController:infoViewController animated:YES completion:^{
        
    }];

}

-(IBAction)goToWebSite{
	
	[self presentViewController:hellCityViewController animated:YES completion:nil];
}

-(IBAction)updateTwitter{
	
	[self presentViewController:twitterViewController animated:YES completion:nil];
}

-(IBAction)updateFacebook{
	
}

#pragma mark -
#pragma mark viewDidLoad

- (void)viewDidLoad {
    [super viewDidLoad];
	NSString *finishingStatement = [[NSString alloc] initWithFormat:@"You got more than five questions incorrect. You're a scratcher! " 
									@"Study up and take the Tattoo IQ test again. Be sure to post your results and challenge your friends to take the Tattoo IQ test!"];
									
	lowScore.text = finishingStatement;
}

#pragma mark -
#pragma mark memory and dealloc

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
