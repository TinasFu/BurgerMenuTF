//
//  ViewController.m
//  burgerMenuTF
//
//  Created by Shiquan Fu on 11/24/14.
//  Copyright (c) 2014 Tina Fu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong,nonatomic) UIViewController *grayVC;
@property (strong,nonatomic) UIViewController *currentVC;
@property (assign,nonatomic) BOOL burgerMenuOn;


@property (assign, nonatomic) IBOutlet UIButton *burgerButton;
@property (retain, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.grayVC = [[self.storyboard instantiateViewControllerWithIdentifier:@"childVC"] autorelease];
    [self addChildViewController:self.grayVC];
    self.grayVC.view.frame = self.view.frame;
    [self.view insertSubview:self.grayVC.view belowSubview:self.burgerButton];
    [self.grayVC didMoveToParentViewController:self];
    self.burgerMenuOn = NO;
    
    
}
- (IBAction)burgerButtonPressed:(id)sender {
    
    [UIView animateWithDuration:0.4 animations:^{
        
        if (self.burgerMenuOn == NO) {
            self.grayVC.view.frame = CGRectMake(self.view.frame.size.width * .8, 0, self.view.frame.size.width, self.view.frame.size.height);
            self.burgerMenuOn = YES;
        }
        else {
            self.grayVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            self.burgerMenuOn = NO;
        }
        
        
    } completion:^(BOOL finished) {
        
    }];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    return cell;
}

-(void)dealloc {
    [_grayVC release];
    [_tableView release];
    [_currentVC release];
    [super dealloc];
}


@end
