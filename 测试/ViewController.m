//
//  ViewController.m
//  测试
//
//  Created by 苗建浩 on 2017/9/30.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSString *tadayStr = [self getCurrentTime];
    NSDate *todayDate = [self dateFromString:tadayStr];
    NSString *tomorrowStr = [NSString stringWithFormat:@"%@",[self GetTomorrowDay:todayDate]];
    NSString *str1 = [tomorrowStr substringFromIndex:5];
    NSLog(@"tomorrowStr = %@",str1);
    
    
    NSDate *thirdDate = [self dateFromString:tomorrowStr];
    NSString *thirdStr = [NSString stringWithFormat:@"%@",[self GetTomorrowDay:thirdDate]];
    NSString *str2 = [thirdStr substringFromIndex:5];
    NSLog(@"thirdStr = %@",str2);
    
    
    NSDate *fourthDate = [self dateFromString:thirdStr];
    NSString *fourthStr = [NSString stringWithFormat:@"%@",[self GetTomorrowDay:fourthDate]];
    NSString *str3 = [fourthStr substringFromIndex:5];
    NSLog(@"fourthStr = %@",str3);
}

//获取当地时间
- (NSString *)getCurrentTime {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    return dateTime;
}

//将字符串转成NSDate类型
- (NSDate *)dateFromString:(NSString *)dateString {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd"];
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    return destDate;
}

//传入今天的时间，返回明天的时间
- (NSString *)GetTomorrowDay:(NSDate *)aDate {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:aDate];
    [components setDay:([components day] + 1)];
    
    NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
    NSDateFormatter *dateday = [[NSDateFormatter alloc] init];
    [dateday setDateFormat:@"yyyy-MM-dd"];
    return [dateday stringFromDate:beginningOfWeek];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
