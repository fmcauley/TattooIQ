//
//  Tattoo_IQ_QuizViewController.m
//  Tattoo IQ Quiz
//
//  Created by Frank McAuley on 12/31/09.
//  Copyright Frank McAuley LLC 2009. All rights reserved.
//

#import "Tattoo_IQ_QuizViewController.h"
#import "InfoViewController.h"


@implementation Tattoo_IQ_QuizViewController

@synthesize infoViewController;


-(IBAction)startQuiz:(id)sender
{
	NSLog(@"THIS IS A BUTTON TEST");
	[self presentModalViewController:infoViewController animated:YES];
}





/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}

@end
