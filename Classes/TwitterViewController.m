
#import "TwitterViewController.h"



@implementation TwitterViewController


@synthesize textView, theMessage;


-(IBAction)goBackOneScreen:(id)sender{
	
	[self dismissModalViewControllerAnimated:YES];
}


/*-(void)userNameandPassword {
	UITextField *textField;
	UITextField *textField2;
	
	UIAlertView *prompt = [[UIAlertView alloc] initWithTitle:@"Username and Password" message:@"\n\n\n" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"Enter",nil];
	textField = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 50.0, 260.0, 25.0)];
	//[textField setBackground:[UIColor whiteColor]];
	[textField setPlaceholder:@"username"];
	[prompt addSubview:textField];
	
	textField2 = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 85.0, 260.0, 25.0)];
	//[textField2 setBackground:[UIColor whiteColor]];
	[textField2 setPlaceholder:@"password"];
	[textField2 setSecureTextEntry:YES];
	[prompt addSubview:textField2];
	
	//set place
	[prompt setTransform:CGAffineTransformMakeTranslation(0.0, 110.0)];
	[prompt show];
	[prompt release];
	
	
	// set cursor and show keyboard
	[textField resignFirstResponder];
	
	NSLog(@"Username %@",textField.text);
	NSLog(@"password %@", textField2.text);
	
}
*/

-(NSString *)setTheMessage{
	return [NSString stringWithFormat:@"Take the Tattoo IQ TEST!"];
	
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
	[self buildTwitterUpdate];
	
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
