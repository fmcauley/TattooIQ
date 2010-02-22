//
//  HellCityAppsViewController.m
//  Tattoo IQ Quiz
//
//  Created by Frank McAuley on 2/8/10.
//  Copyright 2010 Frank McAuley LLC. All rights reserved.
//

#import "HellCityAppsViewController.h"


@implementation HellCityAppsViewController

-(void) loadURL {
   
	//Fit the page to the view
    //[self webview scalesPageToFit:YES];
	
	NSURL *url = [[NSURL alloc] initWithString:urlField.text];
	NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
	webview.scalesPageToFit = YES;
	[webview loadRequest:request];
	
	
	[request release];
	[url release];
}

-(IBAction)handleGoTapped {
	[urlField resignFirstResponder]; //delegate call to relase the first responder of the keyboard
	[self loadURL];
}

 //method textFieldShouldReturn: handle the user hitting the keyboard's Return instead of the Go button:
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
	if (textField == urlField) {
		[self handleGoTapped];
	}
	return YES;
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
	[self loadURL];
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
