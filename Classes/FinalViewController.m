

#import "FinalViewController.h"
#import "InfoViewController.h"
#import "HellCityAppsViewController.h"
#import "TwitterViewController.h"


@implementation FinalViewController

@synthesize finalScore;


-(IBAction)restartTheGame:(id)sender {
    [self presentViewController:infoViewController animated:YES completion:nil];
}

-(IBAction)goToWebSite:(id)sender {
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
	NSString *finishingStatement = [[NSString alloc] initWithFormat:@"Congratulations! Your tattoo knowledge is impressive,"
									@" you're a Tattoo Guru! Be sure to post your results and challenge your friends to take the" 
									@" Tattoo IQ test!"];
	
	finalScore.text = finishingStatement;
}

@end
