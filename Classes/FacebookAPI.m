

#import "FacebookAPI.h"
#import "Tattoo_IQ_QuizAppDelegate.h"

#define _APP_KEY @"94f3b0764cb862fd289bf6b57b13c97d"
#define _SECRET_KEY @"af6391cf7b2bc653b690a533eb4abe41"

@implementation FacebookAPI
@synthesize loginButton, facebookAlert, usersession,username,post,backButton;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	Tattoo_IQ_QuizAppDelegate *appDelegate =
		(Tattoo_IQ_QuizAppDelegate *) [[UIApplication
										sharedApplication]delegate];
	if(appDelegate._session == nil){
		appDelegate._session = [FBSession
								sessionForApplication:_APP_KEY secret:_SECRET_KEY delegate:self];
	}
	if (self.loginButton == NULL) 
		self.loginButton = [[[FBLoginButton alloc]init]autorelease];
		loginButton.frame = CGRectMake(0, 0, 100, 50);
		[self.view addSubview:loginButton];
	
	backButton = 
	[[UIButton buttonWithType:UIButtonTypeRoundedRect]retain];
	backButton.frame = CGRectMake(40.0, 100.0, 100, 50);
	[backButton setTitle:@"Go Bacl" forState:UIControlStateNormal];
	[backButton addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:backButton];
    [super viewDidLoad];
}



- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[username release];
	[usersession release];
	[loginButton release];
    [super dealloc];
}

-(void)session:(FBSession *)session didLogin:(FBUID)uid{
	self.usersession = session;
	NSLog(@"User with id %lld logged in.", uid);
	[self getFacebookName];
}

-(void)getFacebookName{
	NSString *fql = [NSString stringWithFormat:@"select uid,name from user where uid == %lld",
					 self.usersession.uid];
	NSDictionary* params =
	[NSDictionary dictionaryWithObject:fql forKey:@"query"];
	[[FBRequest requestWithDelegate:self]
	 call:@"facebook.fql.query" params:params];
	self.post=YES;
}

-(void)request:(FBRequest*)request didLoad:(id)result {
	if ([request.method isEqualToString:@"facebook.fql.query"]) {
		NSArray* users = result;
		NSDictionary* user = [users objectAtIndex:0];
		NSString* name = [user objectForKey:@"name"];
		self.username = name;
		
		if (self.post) {
			[self postToWall];
			self.post = NO;
		}
	}
}

- (void)postToWall {
	
	FBStreamDialog *dialog = [[[FBStreamDialog alloc] init] autorelease];
	dialog.userMessagePrompt = @"Enter your message:";
	dialog.attachment = [NSString stringWithFormat:@"{\"name\":\"Facebook Connect for iPhone\",\"href\":\"http://developers.facebook.com/connect.php?tab=iphone\",\"caption\":\"Caption\",\"description\":\"Description\",\"media\":[{\"type\":\"image\",\"src\":\"http://img40.yfrog.com/img40/5914/iphoneconnectbtn.jpg\",\"href\":\"http://developers.facebook.com/connect.php?tab=iphone/\"}],\"properties\":{\"another link\":{\"text\":\"Facebook home page\",\"href\":\"http://www.facebook.com\"}}}"];
	[dialog show];
	
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
[textField resignFirstResponder];
return YES;
}

-(void)goBack:(id)sender{
	[self dismissModalViewControllerAnimated:YES];
}


@end
