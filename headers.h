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

@interface WKWebView: UIView
@end

@interface MFComposeTextContentView: UIView
@end

@interface MFConversationViewController: UIViewController
@end

@interface MFSearchSuggestionsViewController: UIViewController
@end

@interface MFSearchSuggestionsTableViewCell: UITableViewCell
@end

@interface SearchScopeControl: UIView
@end

@interface MFMailComposeToField: UIView
@end

@interface MFHeaderLabelView: UILabel
@end

@interface MFComposeRecipientTextView: UIView
	@property UIColor *typingTextColor;
@end

@interface MFComposeSubjectView: UIView
	@property UITextView *textView;
@end

@interface MFComposeMultiView: UIView
@end

@interface MFComposeFromView: UIView
@end

@interface MFRecipientTableViewCell: UIView
	@property UILabel *titleLabel;
	@property UILabel *detailLabel;
@end

@interface MessageSuggestionBannerView: UIView
@end

@interface MessageSuggestionTitleControl: UIView
	@property UILabel *titleLabel;
@end

@interface MFVibrantCardView: UIView
@end

@interface UIDateLabel: UILabel
@end

@interface MFCollapsedMessageCell: UIView
	@property MFVibrantCardView *cellBackgroundView;
	@property UILabel *senderLabel;
	@property UILabel *summaryLabel;
	@property UIDateLabel *timestampLabel;
@end