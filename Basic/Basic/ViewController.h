//
//  ViewController.h
//  Basic
//
//  Created by Dima on 04.08.17.
//  Copyright © 2017 Dima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UITextField *field;
@property (strong, nonatomic) IBOutlet UIButton *button;
- (IBAction)onClick:(id)sender;

@end

