#include <CoreFoundation/CFNotificationCenter.h>
#import <Foundation/NSUserDefaults.h>
#include <headers.h>

static NSString *domainString = @"com.chashmeet.darkmail";
static NSString *notificationString = @"com.chashmeet.darkmail/preferences.changed";
static NSString *settingsPath = @"/User/Library/Preferences/com.chashmeet.darkmail.plist";

static BOOL enableTweak = NO;

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
	self.navigationBar.barTintColor = [UIColor blackColor];
	self.navigationBar.tintColor = [UIColor whiteColor];
	[[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
	[[UINavigationBar appearance] setLargeTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
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

%hook MFCollapsibleHeaderView

- (void)layoutSubviews {
	%orig;
	if (!enableTweak) return;
	self.superTitleLabel.textColor = [UIColor whiteColor];
}

%end

%hook MFCollapsibleHeaderContentView

- (void)setFont:(id)arg1 {
	%orig;
	if (!enableTweak) return %orig;;
	self.textView.textColor = [UIColor whiteColor];
	return %orig;
}

%end

%hook MFMailboxFilterPickerControl

- (void)layoutSubviews {
	%orig;
	if (!enableTweak) return;
	self.titleLabel.textColor = [UIColor whiteColor];
}

%end

%hook MFAtomSearchBar

- (id)_textColor:(_Bool)arg1 {
	if (!enableTweak) return %orig;
	self.tintColor = [UIColor whiteColor];
	return [UIColor whiteColor];
}

%end

%hook MailboxContentViewCell

- (id) _dateLabelTextColor {
	if (!enableTweak) return %orig;
	self.backgroundColor = [UIColor blackColor];
	self.contentView.backgroundColor = [UIColor blackColor];
	return [UIColor whiteColor];
}

%end

%hook MFSimpleLabel

- (void)setAttributedText:(id)arg1 {
	%orig;
	if (!enableTweak) return;
	self.textColor = [UIColor whiteColor];
}

%end

%hook MFSwipableTableView

- (void)layoutSubviews {
	%orig;
	if (!enableTweak) return;
	self.backgroundColor = [UIColor blackColor];
}

%end

%hook MFConversationItemHeaderBlock

- (void)layoutSubviews {
	%orig;
	if (!enableTweak) return;
	self.backgroundColor = [UIColor blackColor];
}

%end

%hook MFExpandableCaptionView

- (void)layoutSubviews {
	%orig;
	if (!enableTweak) return;
	self.backgroundColor = [UIColor blackColor];
}

%end

%hook MFModernAtomView

- (void)layoutSubviews {
	%orig;
	if (!enableTweak) return;
	self.titleLabel.textColor = [UIColor whiteColor];
}

%end

%hook MFCaptionLabel

- (void)layoutSubviews {
	%orig;
	if (!enableTweak) return;
	self.textColor = [UIColor whiteColor];
}

%end

%hook MFModernLabelledAtomList

- (void)layoutSubviews {
	%orig;
	if (!enableTweak) return;
	self.labelTextColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] ;
}

%end

%hook MFMessageHeaderMessageInfoBlock

- (void)layoutSubviews {
	%orig;
	if (!enableTweak) return;
	self.backgroundColor = [UIColor blackColor];
	self.subjectTextView.textColor = [UIColor whiteColor];
	self.timestampLabel.textColor = [UIColor whiteColor];
}

%end

%hook WKWebView

- (void)layoutSubviews {
	%orig;
	if (!enableTweak) return;
	self.backgroundColor = [UIColor blackColor];
}

%end

%hook MFMailComposeNavigationBarTitleView

- (void)layoutSubviews {
	%orig;
	if(!enableTweak) return;
	MSHookIvar<UILabel *>(self, "_titleLabel").textColor = [UIColor whiteColor];
}

%end

%hook MFComposeTextContentView

-(void)layoutSubviews {
	%orig;
	if(!enableTweak) return;
	self.backgroundColor = [UIColor blackColor];
}

%end

%hook MFConversationViewController

-(void)viewDidLayoutSubviews {
	%orig;
	if(!enableTweak) return;
	self.view.backgroundColor = [UIColor blackColor];
}

%end

%hook MFSearchSuggestionsViewController

-(void)viewDidLayoutSubviews {
	%orig;
	if(!enableTweak) return;
	self.view.backgroundColor = [UIColor blackColor];
}

%end

%hook MFSearchSuggestionsTableViewCell

-(void)updateConstraints {
	%orig;
	if(!enableTweak) return;
	self.backgroundColor = [UIColor blackColor];
	MSHookIvar<UILabel *>(self, "_title").textColor = [UIColor whiteColor];
}

%end

%hook SearchScopeControl

-(void)layoutSubviews {
	%orig;
	if(!enableTweak) return;
	self.backgroundColor = [UIColor blackColor];
}

%end

%hook UITableViewHeaderFooterView

-(void)layoutSubviews {
	%orig;
	if(!enableTweak) return;
	self.textLabel.textColor = [UIColor whiteColor];
	self.contentView.backgroundColor = [UIColor colorWithRed:0.00 green:0.00 blue:0.00 alpha:0.5];
}

%end

%hook MFMailComposeToField

-(void)layoutSubviews {
	%orig;
	if(!enableTweak) return;
	self.backgroundColor = [UIColor blackColor];
}

%end

%hook MFHeaderLabelView

-(void)layoutSubviews {
	%orig;
	if(!enableTweak) return;
	self.textColor = [UIColor whiteColor];
}

%end

%hook MFComposeRecipientTextView

-(void)layoutSubviews {
	%orig;
	if(!enableTweak) return;
	self.backgroundColor = [UIColor blackColor];
	self.typingTextColor = [UIColor whiteColor];
}

%end

%hook MFComposeSubjectView

-(void)layoutSubviews {
	%orig;
	if(!enableTweak) return;
	self.backgroundColor = [UIColor blackColor];
	self.textView.textColor = [UIColor whiteColor];
}

%end

%hook MFComposeMultiView

-(void)layoutSubviews {
	%orig;
	if(!enableTweak) return;
	self.backgroundColor = [UIColor blackColor];
}

%end

%hook MFComposeFromView

-(id)_accountLabel {
	%orig;
	if(!enableTweak) return %orig;
	self.backgroundColor = [UIColor blackColor];
	MSHookIvar<UILabel *>(self, "_accountLabel").textColor = [UIColor whiteColor];
	return %orig;
}

%end

%hook MFRecipientTableViewCell

-(id)recipient {
	%orig;
	if(!enableTweak) return %orig;
	self.backgroundColor = [UIColor blackColor];
	return %orig;
}

-(id)tintColor {
	if(!enableTweak) return %orig;
	return [UIColor whiteColor];
}

-(id)activeConstraints {
	%orig;
	if(!enableTweak) return %orig;
	self.titleLabel.textColor = [UIColor whiteColor];
	self.detailLabel.textColor = [UIColor whiteColor];
	return %orig;
}

%end

%hook MessageSuggestionBannerView

-(void)reloadData {
	%orig;
	if(!enableTweak) return;
	self.backgroundColor = [UIColor blackColor];
}

%end

%hook MessageSuggestionTitleControl

-(void)tintColorDidChange {
	%orig;
	if(!enableTweak) return;
	self.titleLabel.textColor = [UIColor whiteColor];
}

%end

%hook MFCollapsedMessageCell

-(void)layoutSubviews {
	%orig;
	if(!enableTweak) return;
	self.cellBackgroundView.backgroundColor = [UIColor darkGrayColor];
	self.senderLabel.textColor = [UIColor whiteColor];
	self.summaryLabel.textColor = [UIColor whiteColor];
	self.timestampLabel.textColor = [UIColor whiteColor];
}

%end

static void notificationCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {	

    NSDictionary *settings = [NSDictionary dictionaryWithContentsOfFile:settingsPath] ? : [NSMutableDictionary dictionary];
    // NSLog(@"%@", settings.description);

    enableTweak = settings[@"enableTweak"] && [settings[@"enableTweak"] boolValue];
	// NSLog(@"called: %d", enableTweak);
}

%ctor {
	@autoreleasepool {
		NSLog(@"init");
		notificationCallback(NULL, NULL, NULL, NULL, NULL);

		//register for notifications
		CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, notificationCallback, (CFStringRef)notificationString, NULL, CFNotificationSuspensionBehaviorCoalesce);
	}
}