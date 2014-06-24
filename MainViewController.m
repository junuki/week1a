//
//  MainViewController.m
//  week1a
//
//  Created by Jung Eun Kim on 6/22/14.
//  Copyright (c) 2014 jung. All rights reserved.
//

#import "MainViewController.h"
#import <TTTAttributedLabel/TTTAttributedLabel.h>

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailView;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UIView *commentContainerView;
- (IBAction)onEditingBegin:(id)sender;

@end


@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
   
    self.containerView.layer.cornerRadius = 2;
    self.thumbnailView.layer.cornerRadius = 2;
    self.thumbnailView.layer.masksToBounds = YES;

    TTTAttributedLabel *label = [[TTTAttributedLabel alloc] initWithFrame:CGRectMake(15, 90, 280, 50)];
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor darkGrayColor];
    label.numberOfLines = 0;
    
    NSString *text = @"http://bit.ly/GBH";
   
    
    label.enabledTextCheckingTypes = NSTextCheckingTypeLink;
    label.delegate = self;
    
    
    [label setText:text afterInheritingLabelAttributesAndConfiguringWithBlock:^ NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        NSRange boldRange = [[mutableAttributedString string] rangeOfString:@"ipsum dolar" options:NSCaseInsensitiveSearch];
        NSRange strikeRange = [[mutableAttributedString string] rangeOfString:@"sit amet" options:NSCaseInsensitiveSearch];
        
        // Core Text APIs use C functions without a direct bridge to UIFont. See Apple's "Core Text Programming Guide" to learn how to configure string attributes.
        UIFont *boldSystemFont = [UIFont boldSystemFontOfSize:14];
        CTFontRef font = CTFontCreateWithName((__bridge CFStringRef)boldSystemFont.fontName, boldSystemFont.pointSize, NULL);
        if (font) {
            [mutableAttributedString addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)font range:boldRange];
            [mutableAttributedString addAttribute:kTTTStrikeOutAttributeName value:[NSNumber numberWithBool:YES] range:strikeRange];
            CFRelease(font);
        }
        
        return mutableAttributedString;
    }];
    
    [self.mainView addSubview:label];
    
   
}
    
    
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)onEditingBegin:(id)sender {
    
    [UIView animateWithDuration:0.5 animations:^{self.commentContainerView.frame = CGRectMake (self.commentContainerView.frame.origin.x, 310, self.commentContainerView.frame.size.width, self.commentContainerView.frame.size.height);
        
    }];
    
}

@end








