//
//  ViewController.m
//  FBPost
//
//  Created by Shilya Lee on 6/9/14.
//  Copyright (c) 2014 Shilya Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *post;
@property (weak, nonatomic) IBOutlet UIView *postBG;
@property (weak, nonatomic) IBOutlet UILabel *postUsername;
@property (weak, nonatomic) IBOutlet UILabel *postDate;



@property (weak, nonatomic) IBOutlet UITextField *comment;


- (void)willShowKeyboard:(NSNotification *)notification;
- (void)willHideKeyboard:(NSNotification *)notification;

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        // Keyboard show and hide
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIColor *bgColor = [UIColor colorWithRed:231.0f/255.0f green:231.0f/255.0f blue:231.0f/255.0f alpha:1.0f];
    self.view.backgroundColor = bgColor;
    
    
    self.postBG.layer.backgroundColor = [UIColor whiteColor].CGColor;
    self.postBG.layer.cornerRadius = 3;
    self.postBG.layer.shadowColor = [UIColor blackColor].CGColor;
    self.postBG.layer.shadowOffset = CGSizeMake(0, 1);
    self.postBG.layer.shadowOpacity = 0.1;
    
    
    
    self.postUsername.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:15.0];
    
    self.postDate.font = [UIFont fontWithName:@"HelveticaNeue" size:13.0];
    
    [self.comment setBackground:[UIImage imageNamed:@"input-background"]];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)inputEnd:(id)sender {
    [self.view endEditing:YES];
}

- (void)willShowKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.comment.frame = CGRectMake(0, self.view.frame.size.height - kbSize.height - self.comment.frame.size.height, self.comment.frame.size.width, self.comment.frame.size.height);
                     }
                     completion:nil];
}

- (void)willHideKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.comment.frame = CGRectMake(0, self.view.frame.size.height - self.comment.frame.size.height - 50, self.comment.frame.size.width, self.comment.frame.size.height);
                     }
                     completion:nil];
}
@end
