//
//  ViewController.m
//  AgilePoker
//
//  Created by 蒋羽萌 on 15/10/25.
//  Copyright © 2015年 蒋羽萌. All rights reserved.
//

#import "EnterRoomViewController.h"

@interface EnterRoomViewController () <UITextFieldDelegate>

@property (nonatomic) UITextField *roomNumField;

@end

@implementation EnterRoomViewController

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.navigationItem.title = @"Room Number";
    }
    return  self;
}

//enter room 按钮点击
-(void)enterRoom:(id)sender
{
    VerificationCodeViewController *vcCodeViewController = [[VerificationCodeViewController alloc]init];
    
    vcCodeViewController.roomNumber = self.roomNumField.text;
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:backItem];
    
    vcCodeViewController.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vcCodeViewController animated:YES];
}

//验证输入
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return [self validateNumber:string];
}

- (BOOL)validateNumber:(NSString*)number {
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < number.length) {
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}

//
//-(BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//    [textField resignFirstResponder];
//
//    return YES;
//}

//关闭键盘
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGRect roomNumFieldRect = CGRectMake(40, 100, 240, 40);
    self.roomNumField = [[UITextField alloc] initWithFrame:roomNumFieldRect];
    self.roomNumField.borderStyle = UITextBorderStyleRoundedRect;
    self.roomNumField.placeholder = @"room number";
    self.roomNumField.returnKeyType = UIReturnKeyDone;
    self.roomNumField.keyboardType = UIKeyboardTypeNumberPad;
    
    self.roomNumField.delegate = self;
    
    CGRect enterRoomButtonRect = CGRectMake(71, 200, 178, 30);
    UIButton *enterRoomButton = [[UIButton alloc] initWithFrame:enterRoomButtonRect];
    [enterRoomButton setTitle:@"Enter" forState:UIControlStateNormal];
    enterRoomButton.backgroundColor=[UIColor colorWithRed:80/255.0 green:212/255.0 blue:255/255.0 alpha:1];
//    enterRoomButton.backgroundColor=[UIColor blueColor];
    [enterRoomButton addTarget:self action:@selector(enterRoom:) forControlEvents:UIControlEventTouchDown];
    
    CGRect createRoomButtonRect = CGRectMake(71, 248, 178, 30);
    UIButton *createRoomButton = [[UIButton alloc] initWithFrame:createRoomButtonRect];
    [createRoomButton setTitle:@"Create" forState:UIControlStateNormal];
    createRoomButton.backgroundColor=[UIColor colorWithRed:80/255.0 green:212/255.0 blue:255/255.0 alpha:1];
    
    [self.view addSubview:enterRoomButton];
    [self.view addSubview:createRoomButton];
    [self.view addSubview:self.roomNumField];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
