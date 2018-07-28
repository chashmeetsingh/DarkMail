#include "darkmail.h"
#include <spawn.h>
#include <signal.h>
#include <Preferences/PSSpecifier.h>

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

- (id)readPreferenceValue:(PSSpecifier*)specifier {
	NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	return (settings[specifier.properties[@"key"]]) ?: specifier.properties[@"default"];
}

- (void)setPreferenceValue:(id)value specifier:(PSSpecifier*)specifier {
	NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	[settings setObject:value forKey:specifier.properties[@"key"]];
	[settings writeToFile:path atomically:NO];
	CFStringRef notificationName = (CFStringRef)specifier.properties[@"PostNotification"];
	if (notificationName) {
		CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), notificationName, NULL, NULL, YES);
	}
}

@end