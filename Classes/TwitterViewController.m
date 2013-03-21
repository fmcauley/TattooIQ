

#import "TwitterViewController.h"

#define INTERESTING_TAG_NAMES @"text",@"name",nil


@implementation TwitterViewController


@synthesize textView, theMessage, username, password;
@synthesize activityIndicator,tweetsView;

//////////////NEW CODE
-(void)startParsingTweets {
	NSXMLParser *tweetParser = [[NSXMLParser alloc]initWithData:tweetsData];
	tweetParser.delegate = self;
	[tweetParser parse];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName
	attributes:(NSDictionary *)attributeDict { if ([elementName isEqualToString:@"status"]) {
	 currentTweetDict = [[NSMutableDictionary alloc]
													initWithCapacity: [interestingTags count]];
}
	else if ([interestingTags containsObject:elementName]){
		currentElementName = elementName;
		currentText = [[NSMutableString alloc]init];
	}
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	[currentText appendString:string];
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	if ([elementName isEqual:currentElementName]) {
		[currentTweetDict setValue:currentText forKey:currentElementName];
	}
	else if	([elementName isEqualToString:@"status"]){
		[tweetsString appendFormat:@"%@: %@\n\n", 
		 [currentTweetDict valueForKey:@"name"], 
		 [currentTweetDict valueForKey:@"text"]];
	}  
	currentText = nil;
}


-(void)parserDidEndDocument:(NSXMLParser *)parser {
	tweetsView.text = tweetsString;
}


-(void)parserDidStartDocument:(NSXMLParser *)parser{
	tweetsString = [[NSMutableString alloc]
					initWithCapacity:(20 *(140 + 20))];
	currentElementName = nil;
	currentText = nil;
}


-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
	[tweetsData appendData:data];
}

-(void) connectionDidFinishLoading:(NSURLConnection *)connection {
	
	[activityIndicator stopAnimating];
	[self startParsingTweets];
}


//////////////////////


-(IBAction)goBackOneScreen:(id)sender{
	
	[self dismissModalViewControllerAnimated:YES];
}



-(NSString *)setTheMessage{
	return [NSString stringWithFormat:@"I just took the Tattoo IQ Test! See how much you know about tattooing, test your Tattoo IQ now! #TattooIQ http://tinyurl.com/y86cfxh"];
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
	NSLog(@"%@", [[NSString alloc]initWithData:result encoding:NSASCIIStringEncoding]);
	
	
	 //new code
	
	tweetsView.text = @"";
	tweetsData = [[NSMutableData alloc]init];
	NSURL *url = [NSURL URLWithString:	
				  @"http://twitter.com/statuses/public_timeline.xml"];
	
	NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
	NSURLConnection *connection = [[NSURLConnection alloc]
								   initWithRequest:request delegate:self];
	[activityIndicator startAnimating];
	
	//add logic that will tell if the update has occured! 3-25-10
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	NSString *update = [[NSString alloc] initWithString:@"Update your Twitter status with results from this Tattoo IQ test."];
	textView.text = update;
	interestingTags = [[NSSet alloc]initWithObjects:INTERESTING_TAG_NAMES];
	
}





@end
