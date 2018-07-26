@interface MFTableViewCell : UITableViewCell
@end

@interface MailboxTableCell: MFTableViewCell
	@property(retain, nonatomic) UIColor *titleColor;
@end

%hook MailboxTableCell

- (void)layoutSubviews {
	%orig;
	NSLog(@"called");
	self.backgroundColor = [UIColor blackColor];
	self.titleColor = [UIColor whiteColor];
}

- (void)prepareForReuse {
	%orig;
	self.backgroundColor = [UIColor blackColor];
	self.titleColor = [UIColor whiteColor];
}

%end

@interface MailboxPickerController : UITableViewController
@end

%hook MailboxPickerController

- (void)viewDidLoad {
	%orig;
	self.tableView.backgroundColor = [UIColor blackColor];
}

%end

@interface MailNavigationController : UINavigationController
@end

%hook MailNavigationController

- (void)_commonInit {
	%orig;
	self.navigationBar.barTintColor = [UIColor blackColor];
	self.navigationBar.tintColor = [UIColor whiteColor];
	[[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
	[[UINavigationBar appearance] setLargeTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
	self.toolbar.barTintColor = [UIColor blackColor];
	self.toolbar.tintColor = [UIColor whiteColor];
}

%end

@interface MailStatusLabelView: UIView
	@property(nonatomic) NSAttributedString *primaryLabelText;
@end

%hook MailStatusLabelView

- (void)layoutSubviews {
	%orig;
	
	NSDictionary *attributes = @{ NSForegroundColorAttributeName : [UIColor whiteColor] };
	NSString *primaryStatusText = [NSString stringWithFormat:@"%@", self.primaryLabelText];
	self.primaryLabelText = [[NSAttributedString alloc] initWithString:primaryStatusText attributes:attributes];
}

%end

@interface MFSwipableTableView: UITableView
@end

%hook MFSwipableTableView

- (void)layoutSubviews {
	%orig;

	self.backgroundColor = [UIColor blackColor];
}

%end

%hook MFApplicationSceneController

- (void)_setStatusBarStyle:(long long)arg1 animated:(_Bool)arg2 { 
    %orig(1, YES);
}

%end