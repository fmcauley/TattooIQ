

#import "HellCityAppsViewController.h"


@implementation HellCityAppsViewController

@synthesize activityView, webview;

-(void) loadURL {
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


#pragma mark -
#pragma mark View Controller Utility Methods


-(void)disableWebView {
	self.webview.userInteractionEnabled = NO;
	self.webview.alpha = .025;
}

-(void)enableWebView {
	self.webview.userInteractionEnabled = YES;
	self.webview.alpha = 1.0;
}

#pragma mark -
#pragma mark Web View Delegate methods

-(void)webViewDidStartLoad:(UIWebView *) theWebView {
	[self disableWebView];
	[self.activityView startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)theWebView{
	[self enableWebView];
	[self.activityView stopAnimating];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[self loadURL];
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
	self.activityView = nil;
	self.webview = nil;
    [super dealloc];
}


@end
