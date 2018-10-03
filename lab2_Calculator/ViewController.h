//
//  ViewController.h
//  lab2_Calculator
//
//  Created by Xiaochen Wang on 2018-10-01.
//  Copyright © 2018 Xiaochen Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UILabel * Display;
    bool operatorPressed;
    char op;
    NSString *operand;
}


@property (nonatomic) double number;
//@property (weak, nonatomic) IBOutlet UILabel *Display;

-(void)pushItem:(double) number;
-(double) calculate;

- (IBAction)Oprator_Pressed:(id)sender;
- (IBAction)DigitPressed:(id)sender;
- (IBAction)Enter_Pressed:(id)sender;

@end


