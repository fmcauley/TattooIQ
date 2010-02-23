
#import "TwitterViewController.h"



@implementation TwitterViewController


@synthesize textView, theMessage;


-(IBAction)goBackOneScreen:(id)sender{
	
	[self dismissModalViewControllerAnimated:YES];
}

-(NSString *)setTheMessage{
	return [NSString stringWithFormat:@"Take the Tattoo IQ TEST! http://wip.hellcity.com/hell_city_iphone_apps.html "];
	
}

-(void)buildTwitterUpdate{
	//the logic to access twitter and post an update.
	NSMutableURLRequest *therequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://fmcauley:compest123@twitter.com/statuses/update.xml"]
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

-(IBAction)setUpdateToTwitter:(id)sender {
	self.theMessage = [self setTheMessage];
	
	//test
	NSLog(@"THE BUTTONS setUpdateToTwitter has been pressed!");
	[self buildTwitterUpdate];
	
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
