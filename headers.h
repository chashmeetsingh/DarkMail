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

@interface MFCollapsibleHeaderView
	@property(retain, nonatomic) UILabel *superTitleLabel;
@end

@interface MFCollapsibleHeaderContentView
	@property(retain, nonatomic) UITextView *textView;
@end

@interface MFMailboxFilterPickerControl
	@property(retain, nonatomic) UILabel *filtersLabel;
	@property(retain, nonatomic) UILabel *titleLabel; 
@end

@interface MFAtomSearchBar : UISearchBar
@end

@interface MFSwipableTableViewCell: UITableViewCell
@end

@interface MailboxContentViewCell: MFSwipableTableViewCell
@end

@interface MFSimpleLabel: UILabel
@end

@interface MFSwipableTableView: UITableView
@end

@interface MFConversationItemHeaderBlock: UIView
@end

@interface MFExpandableCaptionView: UIView
@end

@interface MFModernAtomView
	@property UILabel *titleLabel;
@end

@interface MFCaptionLabel
	@property UIColor *textColor;
@end

@interface MFModernLabelledAtomList
	@property UIColor *labelTextColor;
@end

@interface MFMessageHeaderMessageInfoBlock: UIView
	@property UITextView *subjectTextView;
	@property UILabel *timestampLabel;
@end