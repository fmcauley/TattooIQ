
#import "TwitterViewController.h"



@implementation TwitterViewController


@synthesize textView, theMessage, username, password;


-(IBAction)goBackOneScreen:(id)sender{
	
	[self dismissModalViewControllerAnimated:YES];
}



-(NSString *)setTheMessage{
	return [NSString stringWithFormat:@"I just took the Tattoo IQ Test! See how much you know about tattooing, test your Tattoo IQ now! #TattooIQ"];
	
}


-(BOOL) textFieldShouldReturn:(UITextField *)theTextField {
	[username resignFirstResponder];
	[password resignFirstResponder];
	
	return YES;
}


-(IBAction)setUpdateToTwitter {
	
	self.theMessage = [self setTheMessage];
	
	//get the username and password from the fields
	NSString *userN = [NSString stringWithFormat:@"%@",username.text];
	
	NSString *passW = [NSString stringWithFormat:@"%@",password.text];
	
	
	NSString *build = [NSString stringWithFormat:@"http://%@:%@@twitter.com/statuses/update.xml",userN,passW];
	
	//the logic to access twitter and post an update.
	NSMutableURLRequest *therequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:build]
															  cachePolicy:NSURLRequestUseProtocolCachePolicy
														  timeoutInterval:60.0];
	[therequest setHTTPMethod:@"POST"];
	[therequest setHTTPBody:[[NSString stringWithFormat:@"status=%@",
							  theMessage]
							 dataUsingEncoding:NSASCIIStringEncoding]];
	NSURLResponse* response;
	NSError* error;
	NSData* result = [NSURLConnection sendSynchronousRequest:therequest returningResponse:&response error:&error];
	NSLog(@"%@", [[[NSString alloc]initWithData:result encoding:NSASCIIStringEncoding] autorelease]);
	
	
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	NSString *update = [[NSString alloc] initWithString:@"Update your Twitter status with results from this Tattoo IQ test."];
	textView.text = update;
	[update release];
	
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
