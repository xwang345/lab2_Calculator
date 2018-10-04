//
//  ViewController.m
//  lab2_Calculator
//
//  Created by Xiaochen Wang on 2018-10-01.
//  Copyright © 2018 Xiaochen Wang. All rights reserved.
//

#import "ViewController.h"
#import "Calculator_brain.h"

@interface ViewController ()
@end

@implementation ViewController

-(void)viewDidLoad{
    [super viewDidLoad];
}


- (IBAction)Oprator_pressed:(id)sender {
    Calculator_brain *calculator = [[Calculator_brain alloc] init];
    UIButton *someButton = (UIButton*)sender;
    NSLog(@"The button title is %@ ", [someButton titleForState:UIControlStateNormal]);
    NSString *operandString =[someButton titleForState:UIControlStateNormal];
    NSString *mainLabelString = _Display.text;
    //show the opreation result to the lable.
    _Display.text = [mainLabelString stringByAppendingFormat:@"%f", [calculator calculate:operandString]];
}

- (IBAction)DigitPressed:(id)sender {
    NSString *numString = ((UIButton*)sender).titleLabel.text;
    NSString *mainLabelString = _Display.text;
    
    _Display.text = [mainLabelString stringByAppendingFormat:@"%@", numString];
}

- (IBAction)Enter_Pressed:(id)sender {
    Calculator_brain *calculator = [[Calculator_brain alloc] init];
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *numTemp = [numberFormatter numberFromString: _Display.text];
    NSLog(@"Input number is %@", numTemp);
    [calculator pushItem:[numTemp doubleValue]];
    _Display.text = @"";
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
