//
//  MiddleScoreViewController.m
//  Tattoo IQ Quiz
//
//  Created by Frank McAuley on 2/7/10.
//  Copyright 2010 Frank McAuley LLC. All rights reserved.
//

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


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	NSString *finishingStatement = [[NSString alloc] initWithFormat:@"You got more than one question incorrect. " 
									@"You are still a tattoo apprentice! " 
									@"Be sure to study up and take the Tattoo IQ test again. Check back for monthly updates!"];
	middleOutput.text = finishingStatement;
	
	
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
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
