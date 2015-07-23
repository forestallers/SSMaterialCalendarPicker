//
//  ViewController.m
//  SSMaterialDateRangeSelector
//
//  Created by Iuri Chiba on 7/15/15.
//  Copyright (c) 2015 Shoryuken Solutions. All rights reserved.
//

#import "ExampleViewController.h"
#import "SSMaterialCalendarPicker.h"

#import "NSDate+SSDateAdditions.h"

@implementation ExampleViewController {
    SSMaterialCalendarPicker *datePicker;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initDatePicker];
}

- (void)initDatePicker {
    datePicker = [SSMaterialCalendarPicker initCalendarOn:[UIApplication sharedApplication].keyWindow withDelegate:self];
    datePicker.forceLocale = [NSLocale localeWithLocaleIdentifier:@"pt_BR"];
    datePicker.disabledIntervalWarning = @"Anfitrião indisponível neste período!";
    datePicker.disabledDates = @[[NSDate daysFromNow:arc4random_uniform(300)], [NSDate daysFromNow:arc4random_uniform(300)], [NSDate daysFromNow:arc4random_uniform(300)], [NSDate daysFromNow:arc4random_uniform(300)], [NSDate daysFromNow:arc4random_uniform(300)], [NSDate daysFromNow:arc4random_uniform(300)], [NSDate daysFromNow:arc4random_uniform(300)], [NSDate daysFromNow:arc4random_uniform(300)], [NSDate daysFromNow:arc4random_uniform(300)]];
}

- (IBAction)showCalendar:(id)sender {
    [datePicker showAnimated];
}

- (void)rangeSelectedWithStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"pt_BR"]];
    [formatter setDateFormat:@"EEEE, dd 'de' MMMM 'de' YYYY"];
    [self.startDateLabel setText:[NSString stringWithFormat:@"Entrada: %@", [formatter stringFromDate:startDate]]];
    [self.endDateLabel setText:[NSString stringWithFormat:@"Saída: %@", [formatter stringFromDate:endDate]]];
}

@end
