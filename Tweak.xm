#include <CoreFoundation/CFNotificationCenter.h>
#import <Foundation/NSUserDefaults.h>
#include <headers.h>

static NSString *domainString = @"com.chashmeet.darkmail";
static NSString *notificationString = @"com.chashmeet.darkmail/preferences.changed";

static BOOL enableTweak = YES;

%hook MailboxTableCell

- (void)layoutSubviews {
	%orig;
	NSLog(@"called: %d", enableTweak);
	if (!enableTweak) return;
	self.backgroundColor = [UIColor blackColor];
	self.titleColor = [UIColor whiteColor];
}

- (void)prepareForReuse {
	%orig;
	if (!enableTweak) return;
	self.backgroundColor = [UIColor blackColor];
	self.titleColor = [UIColor whiteColor];
}

%end


%hook MailboxPickerController

- (void)viewDidLoad {
	%orig;
	if (!enableTweak) return;
	self.tableView.backgroundColor = [UIColor blackColor];
}

%end


%hook MailNavigationController

- (void)_commonInit {
	%orig;
	if (!enableTweak) return;
	self.navigationBar.barTintColor = [UIColor blackColor];
	self.navigationBar.tintColor = [UIColor whiteColor];
	[[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
	[[UINavigationBar appearance] setLargeTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
	self.toolbar.barTintColor = [UIColor blackColor];
	self.toolbar.tintColor = [UIColor whiteColor];
}

%end

%hook MailStatusLabelView

- (void)layoutSubviews {
	%orig;
	if (!enableTweak) return;
	NSDictionary *attributes = @{ NSForegroundColorAttributeName : [UIColor whiteColor] };
	NSString *primaryStatusText = [NSString stringWithFormat:@"%@", self.primaryLabelText];
	self.primaryLabelText = [[NSAttributedString alloc] initWithString:primaryStatusText attributes:attributes];
}

%end

%hook MFApplicationSceneController

- (void)_setStatusBarStyle:(long long)arg1 animated:(_Bool)arg2 {
	%orig;
	if (!enableTweak) return;
    %orig(1, YES);
}

%end

%hook MailDetailNavigationController

- (void)_commonInit {
	%orig;
	if (!enableTweak) return;
	self.toolbar.barTintColor = [UIColor blackColor];
	self.toolbar.tintColor = [UIColor whiteColor];
}

%end

%hook ComposeNavigationController

- (void)viewDidAppear:(_Bool)arg1 {
	%orig;
	if (!enableTweak) return;
	self.navigationBar.barTintColor = [UIColor blackColor];
	self.navigationBar.tintColor = [UIColor whiteColor];
}

%end

%hook MFActorItemHeaderView

- (void)layoutSubviews {
	%orig;
	if (!enableTweak) return;
	self.backgroundView.backgroundColor = [UIColor blackColor];
	self.titleLabel.textColor = [UIColor whiteColor];
}

%end

static void notificationCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {	

	enableTweak = [(NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"enableTweak" inDomain:domainString] boolValue];
	NSLog(@"called: %d", enableTweak);

}

%ctor {
	@autoreleasepool {
		NSLog(@"init");
		notificationCallback(NULL, NULL, NULL, NULL, NULL);

		//register for notifications
		CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, notificationCallback, (CFStringRef)notificationString, NULL, CFNotificationSuspensionBehaviorCoalesce);
	}
}