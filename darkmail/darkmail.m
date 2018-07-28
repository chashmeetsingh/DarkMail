#include "darkmail.h"
#include <spawn.h>
#include <signal.h>

@implementation DarkMailRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

-(void)twitterContactMethod {
	[[UIApplication sharedApplication] 
		openURL:[NSURL URLWithString: @"twitter:///user?screen_name=cchashmeetsingh"] 
		options:@{}
		completionHandler:nil];
}

-(void)paypalDonateMethod {
	[[UIApplication sharedApplication] 
		openURL:[NSURL URLWithString: @"https://www.paypal.me/chashmeet/5usd"] 
		options:@{}
		completionHandler:nil];
}

-(void)githubContactMethod {
	[[UIApplication sharedApplication] 
		openURL:[NSURL URLWithString: @"https://github.com/chashmeetsingh"] 
		options:@{}
		completionHandler:nil];
}

-(void)killMailApp {
	pid_t pid;
	const char* args[] = {"killall", "MobileMail", NULL};
	posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
}

@end