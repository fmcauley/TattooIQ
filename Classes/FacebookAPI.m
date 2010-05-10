

#import "FacebookAPI.h"
#import "Tattoo_IQ_QuizAppDelegate.h"

#define _APP_KEY @"94f3b0764cb862fd289bf6b57b13c97d"
#define _SECRET_KEY @"af6391cf7b2bc653b690a533eb4abe41"

@implementation FacebookAPI
@synthesize loginButton, facebookAlert, usersession,username,post,backButton,background,imageFile;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	Tattoo_IQ_QuizAppDelegate *appDelegate =
		(Tattoo_IQ_QuizAppDelegate *) [[UIApplication
										sharedApplication]delegate];
	if(appDelegate._session == nil){
		appDelegate._session = [FBSession
								sessionForApplication:_APP_KEY secret:_SECRET_KEY delegate:self];
	}
	
	imageFile = 
	[[NSBundle mainBundle]pathForResource:@"_TattIQ_Questions_480x320" ofType:@".jpg"];
	background =
	[[UIImage alloc]initWithContentsOfFile:@"imageFile"];
	
	
	
		
	if (self.loginButton == NULL) 
		self.loginButton = [[[FBLoginButton alloc]init]autorelease];
		loginButton.frame = CGRectMake(20, 119, 100, 50);
		[self.view addSubview:loginButton];
	
	backButton = 
	[[UIButton buttonWithType:UIButtonTypeRoundedRect]retain];
	backButton.frame = CGRectMake(20, 400, 100, 50);
	[backButton setTitle:@"Go Back" forState:UIControlStateNormal];
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
	dialog.attachment = [NSString stringWithFormat:@"{\"name\":\"Get Tattoo IQ Now!\",\"href\":\"http://www.hellcity.com/hell_city_iphone_apps.html\",\"caption\":\"Tattoo IQ iPhone App\",\"description\":\"I just took the Tattoo IQ Quiz! Test your tattoo knowledge now!\",\"media\":[{\"type\":\"image\",\"src\":\"http://www.hellcity.com/images/tattoo-IQ-brain.jpg\",\"href\":\"http://www.hellcity.com/hell_city_iphone_apps.html/\"}],\"properties\":{\"More Hell City iPhone Apps\":{\"text\":\"Hell City Apps Page\",\"href\":\"http://www.hellcity.com/hell_city_iphone_apps.html\"}}}"];
	[dialog show];
	
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
[textField resignFirstResponder];
return YES;
}

-(void)goBack:(id)sender{
	 self.loginButton == NULL;
	[self dismissModalViewControllerAnimated:YES];
}


@end
