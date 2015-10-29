//
//  VerificationCodeViewController.m
//  AgilePoker
//
//  Created by 蒋羽萌 on 15/10/25.
//  Copyright © 2015年 蒋羽萌. All rights reserved.
//

#import "VerificationCodeViewController.h"

@interface VerificationCodeViewController ()

@property (nonatomic) UITextField *vcCodeField;

@end

@implementation VerificationCodeViewController


-(void)setRoomNumber:(NSString *)roomNumber
{
    _roomNumber = roomNumber;
    self.navigationItem.title = _roomNumber;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.vcCodeField.text = self.roomNumber;
    NSLog(@"room number:%@", self.roomNumber);
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect vcCodeFieldRect = CGRectMake(40, 100, 240, 40);
    self.vcCodeField = [[UITextField alloc] initWithFrame:vcCodeFieldRect];
    self.vcCodeField.borderStyle = UITextBorderStyleRoundedRect;
    self.vcCodeField.placeholder = @"verification code";
    self.vcCodeField.returnKeyType = UIReturnKeyDone;
    
    CGRect nextButtonRect = CGRectMake(71, 200, 178, 30);
    UIButton *nextRoomButton = [[UIButton alloc] initWithFrame:nextButtonRect];
    [nextRoomButton setTitle:@"Next" forState:UIControlStateNormal];
    nextRoomButton.backgroundColor=[UIColor colorWithRed:80/255.0 green:212/255.0 blue:255/255.0 alpha:1];
    
    [self.view addSubview:self.vcCodeField];
    [self.view addSubview:nextRoomButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
