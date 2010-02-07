//
//  FinalViewController.m
//  Tattoo IQ Quiz
//
//  Created by Frank McAuley on 2/7/10.
//  Copyright 2010 Frank McAuley LLC. All rights reserved.
//

#import "FinalViewController.h"
#import "InfoViewController.h"
#import "Quiz_GameViewController.h"


@implementation FinalViewController

@synthesize infoViewController;
@synthesize quiz_GameViewController;
@synthesize finalScore;

-(IBAction)restartTheGame:(id)sender {
	
	[self presentModalViewController:infoViewController animated:YES];
	
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
	NSString *finishingStatement = [[NSString alloc] initWithFormat:@"Tattoo Guru!!\nCongratulations! Your tattoo knowledge is impressive,"
									@" you are a Tattoo Guru! Be sure to post your results and challenge your friends to take the" 
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
