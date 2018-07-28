@interface NSUserDefaults (UFS_Category)
	- (id)objectForKey:(NSString *)key inDomain:(NSString *)domain;
	- (void)setObject:(id)value forKey:(NSString *)key inDomain:(NSString *)domain;
@end

@interface MFTableViewCell : UITableViewCell
@end

@interface MailboxTableCell: MFTableViewCell
	@property(retain, nonatomic) UIColor *titleColor;
@end

@interface MailboxPickerController : UITableViewController
@end

@interface MailNavigationController : UINavigationController
@end

@interface MailStatusLabelView: UIView
	@property(nonatomic) NSAttributedString *primaryLabelText;
@end

@interface MailDetailNavigationController : UINavigationController
@end

@interface ComposeNavigationController : UINavigationController
@end

@interface MFActorItemHeaderView : UIView
	@property(retain, nonatomic) UIView *backgroundView;
	@property(retain, nonatomic) UILabel *titleLabel;
@end