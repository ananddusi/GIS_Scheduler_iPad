//
//  GISServiceProviderRequestedJobsResultsViewController.m
//  GIS_Scheduler
//
//  Created by Anand on 30/09/14.
//  Copyright (c) 2014 Paradigm. All rights reserved.
//

#import "GISServiceProviderRequestedJobsResultsViewController.h"
#import "GISDashBoardSPCell.h"
#import "GISSchedulerSPJobsObject.h"
#import "GISConstants.h"
#import "GISFonts.h"
#import "GISUtility.h"
#import "GISLoadingView.h"
#import "GISServerManager.h"
#import "GISJsonRequest.h"
#import "GISStoreManager.h"
#import "PCLogger.h"
#import "GISDatabaseManager.h"
#import "GISServiceProviderObject.h"
#import "GISDropDownsObject.h"
#import "GISJSONProperties.h"

@interface GISServiceProviderRequestedJobsResultsViewController ()

@end

@implementation GISServiceProviderRequestedJobsResultsViewController

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
    // Do any additional setup after loading the view from its nib.
    
    self.isMasterHide= YES;
    self.title = NSLocalizedStringFromTable(@"Service_Provider_RequestedJobs_Results", TABLE, nil);
    
    [self performSelector:@selector(hideAndUnHideMaster:) withObject:nil];
    
    NSString *spCode_statement = [[NSString alloc]initWithFormat:@"select * from TBL_SERVICE_PROVIDER_INFO"];
    serviceProvider_Array = [[[GISDatabaseManager sharedDataManager] getServiceProviderArray:spCode_statement] mutableCopy];
    selected_row=999999;
    NSString *payType_statement = [[NSString alloc]initWithFormat:@"select * from TBL_PAY_TYPE"];
    payType_array = [[[GISDatabaseManager sharedDataManager] getDropDownArray:payType_statement] mutableCopy];
    
    NSString *eventCode_statement = [[NSString alloc]initWithFormat:@"select * from TBL_EVENT_TYPE;"];
    eventType_array = [[[GISDatabaseManager sharedDataManager] getDropDownArray:eventCode_statement]mutableCopy];
    
    gisResponse_array=[[NSMutableArray alloc]initWithObjects:@"Submitted",@"unsubmitted", nil];
    
    NSString *loginStr = [[NSString alloc]initWithFormat:@"select * from TBL_LOGIN;"];
    NSArray  *login_array = [[GISDatabaseManager sharedDataManager] geLoginArray:loginStr];
    login_Obj=[login_array lastObject];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_SPJobsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    GISDashBoardSPCell *cell=(GISDashBoardSPCell *)[tableView dequeueReusableCellWithIdentifier:@"dashBoardSPCell"];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"GISDashBoardSPCell" owner:self options:nil] objectAtIndex:0];
    }
    
    GISSchedulerSPJobsObject *spJobsObj = [_SPJobsArray objectAtIndex:indexPath.row];
    
    [cell.jobId_Label setText:spJobsObj.JobNumber_String];
    [cell.jobdate_Label setText:spJobsObj.JobDate_String];
    [cell.startTime_Label setText:spJobsObj.startTime_String];
    [cell.endTime_Label setText:spJobsObj.endTime_String];
    [cell.totalHours_Label setText:spJobsObj.TotalHours_String];
    [cell.eventType_Label setText:spJobsObj.EventType_String];
    [cell.serviceProviderName_Label setText:spJobsObj.ServiceProviderName_String];
    [cell.requestedDate_Label setText:spJobsObj.RequestedDate_String];
    
    NSString *response_string;
    if ([spJobsObj.GisResponse_String isEqualToString:@"1"])
        response_string=@"Submitted";
    else
        response_string=@"Un submitted";
    [cell.payType_btn setTitle:spJobsObj.PayType_String forState:UIControlStateNormal];
    [cell.response_status_btn setTitle:response_string forState:UIControlStateNormal];
    
    [cell.payType_btn setBackgroundImage:nil forState:UIControlStateNormal];
    [cell.response_status_btn setBackgroundImage:nil forState:UIControlStateNormal];

    [cell.payType_btn setTag:indexPath.row];
    [cell.response_status_btn setTag:indexPath.row];
    [cell.done_btn setTag:indexPath.row];
    
    
    
    if (selected_row==indexPath.row && isEdit_Button_Clicked) {

        cell.eventType_UIView.hidden=NO;
        cell.gisResponse_UIView.hidden=NO;
        cell.serviceProvider_UIView.hidden=NO;
        cell.payType_UIView.hidden=NO;
        
        cell.eventType_EDIT_Label.text=eventType_temp_string;
        cell.gisResponse_EDIT_Label.text=gisResponse_temp_string;
        cell.service_provider_EDIT_Label.text=serviceProvider_temp_string;
        cell.payType_EDIT_Label.text=payType_temp_string;
        cell.edit_imageView.image=[UIImage imageNamed:@"check_pressed"];
    }
    else
    {
        cell.eventType_UIView.hidden=YES;
        cell.gisResponse_UIView.hidden=YES;
        cell.serviceProvider_UIView.hidden=YES;
        cell.payType_UIView.hidden=YES;
    }
    
    cell.editButton.tag=indexPath.row;
    cell.deleteButton.tag=indexPath.row;
    
    [cell.editButton addTarget:self action:@selector(editButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [cell.deleteButton addTarget:self action:@selector(deleteButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.eventType_Button addTarget:self action:@selector(pickerButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [cell.payType_Button addTarget:self action:@selector(pickerButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [cell.gisReponse_Button addTarget:self action:@selector(pickerButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [cell.serviceProvider_Button addTarget:self action:@selector(pickerButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (BOOL)splitViewController: (UISplitViewController*)svc shouldHideViewController:(UIViewController *)vc inOrientation:(UIInterfaceOrientation)orientation
{
    return self.isMasterHide;
}

- (IBAction)hideAndUnHideMaster:(id)sender
{
    datListView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    UIButton *btn = (UIButton*)sender;
    GISAppDelegate *appDelegate1 = (GISAppDelegate *)[[UIApplication sharedApplication] delegate];
    self.isMasterHide= !self.isMasterHide;
    NSString *buttonTitle = self.isMasterHide ? @""  : @"  "; //@""== Unhide   @"  "==Hide
    if ([buttonTitle isEqualToString:@""])
    {
        _flipView.hidden=NO;
        CGRect frame1=_flipView.frame;
        frame1.origin.x=0;
        _flipView.frame=frame1;
        
        CGRect frame2=_jobResultsTableView.frame;
        frame2.origin.x=75;
        _jobResultsTableView.frame=frame2;
        
        CGRect frame3=_horizontalview.frame;
        frame3.origin.x=75;
        _horizontalview.frame=frame3;
        self.navigationItem.hidesBackButton = YES;

    }
    else
    {
        _flipView.hidden=YES;
        CGRect frame1=_flipView.frame;
        frame1.origin.x=0;
        _flipView.frame=frame1;
        
        CGRect frame2=_jobResultsTableView.frame;
        frame2.origin.x=0;
        _jobResultsTableView.frame=frame2;
        
        CGRect frame3=_horizontalview.frame;
        frame3.origin.x=0;
        _horizontalview.frame=frame3;
        
        self.navigationItem.hidesBackButton = NO;

        
    }

    [btn setTitle:buttonTitle forState:UIControlStateNormal];
    [ appDelegate1.spiltViewController.view setNeedsLayout ];
    appDelegate1.spiltViewController.delegate = self;
    
    [appDelegate1.spiltViewController willRotateToInterfaceOrientation:self.interfaceOrientation duration:0];
}

-(void)editButtonPressed:(id)sender
{
    NSLog(@"tag--%d",[sender tag]);
    selected_row=[sender tag];
    GISSchedulerSPJobsObject *tempObj = [_SPJobsArray objectAtIndex:[sender tag]];
    
    if(!isEdit_Button_Clicked)
    {
        isEdit_Button_Clicked=YES;
        
        eventType_temp_string=tempObj.EventType_String;
        
        serviceProvider_temp_string=tempObj.ServiceProviderName_String;
        payType_temp_string=tempObj.PayType_String;
        
        NSString *response_string;
        if ([tempObj.GisResponse_String isEqualToString:@"1"])
            response_string=@"Submitted";
        else
            response_string=@"Un submitted";
        
        gisResponse_temp_string=response_string;
    }
    else if(isEdit_Button_Clicked){
        
        tempObj.EventType_String=eventType_temp_string;
        tempObj.ServiceProviderName_String=serviceProvider_temp_string;
        tempObj.PayType_String=payType_temp_string;
        tempObj.GisResponse_String=gisResponse_temp_string;
        [_SPJobsArray replaceObjectAtIndex:selected_row withObject:tempObj];
        
        
        NSString *typeOfService_ID_temp_String=@"";
        NSString *serviceProvider_ID_temp_String=@"";
        NSString *payType_ID_temp_String=@"";

        NSString *response_string;
        if ([tempObj.GisResponse_String isEqualToString:@"Submitted"])
            response_string=@"1";
        else
            response_string=@"2";
        
        
        NSPredicate *predicate_serviceProvider=[NSPredicate predicateWithFormat:@"service_Provider_String=%@",tempObj.ServiceProviderName_String];
        NSArray *array_serviceProvider=[serviceProvider_Array filteredArrayUsingPredicate:predicate_serviceProvider];
        if (array_serviceProvider.count>0) {
            GISServiceProviderObject *obj=[array_serviceProvider lastObject];
            serviceProvider_ID_temp_String=obj.id_String;
        }
        
        NSPredicate *predicate_payType=[NSPredicate predicateWithFormat:@"value_String=%@",tempObj.PayType_String];
        NSArray *array_payType=[payType_array filteredArrayUsingPredicate:predicate_payType];
        if (array_payType.count>0) {
            GISDropDownsObject *obj=[array_payType lastObject];
            payType_ID_temp_String=obj.id_String;
        }
        NSMutableDictionary *update_eventdict;
        update_eventdict=[[NSMutableDictionary alloc]init];
        
        [update_eventdict setObject:[GISUtility returningstring:tempObj.JobID_String] forKey:kJobDetais_JobID];
        [update_eventdict setObject:[GISUtility returningstring:tempObj.startTime_String] forKey:kJobDetais_StartTime];
        [update_eventdict setObject:[GISUtility returningstring:tempObj.endTime_String] forKey:kJobDetais_EndTime];
        [update_eventdict setObject:[GISUtility returningstring:tempObj.JobDate_String] forKey:kJobDetais_JobDate];
        [update_eventdict setObject:[GISUtility returningstring:payType_ID_temp_String] forKey:kViewSchedule_PayTypeID];
        [update_eventdict setObject:[GISUtility returningstring:serviceProvider_ID_temp_String] forKey:kViewSchedule_ServiceProviderID];
        [update_eventdict setObject:[GISUtility returningstring:@""] forKey:kViewSchedule_SubroleID];
        [update_eventdict setObject:[GISUtility returningstring:login_Obj.requestorID_string] forKey:kLoginRequestorID];
        
        [self addLoadViewWithLoadingText:NSLocalizedStringFromTable(@"loading", TABLE, nil)];
        [[GISServerManager sharedManager] updateJobDetails:self withParams:update_eventdict finishAction:@selector(successmethod_updateJobDetails_data:) failAction:@selector(failuremethod_updateJobDetails_data:)];
        
        
        selected_row=999999;
        isEdit_Button_Clicked=NO;
    }
    [self.jobResultsTableView reloadData];
}
-(void)successmethod_updateJobDetails_data:(GISJsonRequest *)response
{
    [self removeLoadingView];
    NSLog(@"successmethod_updateScheduledata Success---%@",response.responseJson);
    [self.jobResultsTableView reloadData];
    
}
-(void)failuremethod_updateJobDetails_data:(GISJsonRequest *)response
{
    [self removeLoadingView];
    NSLog(@"Failure");
}

-(void)deleteButtonPressed:(id)sender
{
    UIAlertView *alertVIew = [[UIAlertView alloc] initWithTitle:NSLocalizedStringFromTable(@"gis", TABLE, nil) message:NSLocalizedStringFromTable(@"do you want to delete", TABLE, nil) delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    alertVIew.tag = [sender tag];
    alertVIew.delegate = self;
    [alertVIew show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 1)
    {
        GISSchedulerSPJobsObject *jobObj = [_SPJobsArray objectAtIndex:alertView.tag];
    }
}


-(IBAction)pickerButtonPressed:(id)sender
{
    GISPopOverTableViewController *tableViewController1 = [[GISPopOverTableViewController alloc] initWithNibName:@"GISPopOverTableViewController" bundle:nil];
    tableViewController1.popOverDelegate=self;
    UIButton *button=(UIButton *)sender;
    GISDashBoardSPCell *dashBoardCell=(GISDashBoardSPCell *)button.superview.superview.superview.superview;
    
    if([sender tag]==111)
    {
        btnTag=111;
        tableViewController1.popOverArray=eventType_array;
    }
    else if ([sender tag]==222)
    {
        btnTag=222;
        tableViewController1.popOverArray=serviceProvider_Array;
        
    }
    else if ([sender tag]==333)
    {
        btnTag=333;
        tableViewController1.popOverArray=payType_array;
    }
    else if ([sender tag]==444)
    {
        btnTag=444;
        tableViewController1.popOverArray=gisResponse_array;
    }
    popover =[[UIPopoverController alloc] initWithContentViewController:tableViewController1];
    
    popover.delegate = self;
    popover.popoverContentSize = CGSizeMake(340, 210);
    if([sender tag]==111)
        [popover presentPopoverFromRect:CGRectMake(button.frame.origin.x+472, button.frame.origin.y+30, 1, 1) inView:dashBoardCell.contentView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    if([sender tag]==222)
        [popover presentPopoverFromRect:CGRectMake(button.frame.origin.x+560, button.frame.origin.y+30, 1, 1) inView:dashBoardCell.contentView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    if([sender tag]==333)
        [popover presentPopoverFromRect:CGRectMake(button.frame.origin.x+740, button.frame.origin.y+30, 1, 1) inView:dashBoardCell.contentView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    if([sender tag]==444)
        [popover presentPopoverFromRect:CGRectMake(button.frame.origin.x+845, button.frame.origin.y+30, 1, 1) inView:dashBoardCell.contentView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

-(void)sendTheSelectedPopOverData:(NSString *)id_str value:(NSString *)value_str
{      
    
    [self performSelector:@selector(dismissPopOverNow) withObject:nil afterDelay:0.3];
    if(btnTag==111)
    {
        eventType_temp_string=value_str;
    }
    else if (btnTag==222)
    {
        serviceProvider_temp_string=value_str;
    }
    else if (btnTag==333)
    {
        payType_temp_string=value_str;
    }
    else if (btnTag==444)
    {
        gisResponse_temp_string=value_str;
    }
    [self.jobResultsTableView reloadData];
}

-(void)dismissPopOverNow
{
    [popover dismissPopoverAnimated:YES];
}
    
- (void)rightSwipeHandle:(UISwipeGestureRecognizer*)gestureRecognizer
{
    NSLog(@"rightSwipeHandle");
    [self performSelector:@selector(hideAndUnHideMaster:) withObject:nil];
}

- (void)leftSwipeHandle:(UISwipeGestureRecognizer*)gestureRecognizer
{
    NSLog(@"leftSwipeHandle");
    [self performSelector:@selector(hideAndUnHideMaster:) withObject:nil];
}

-(void)addLoadViewWithLoadingText:(NSString*)title
{
    [[GISLoadingView sharedDataManager] addLoadingAlertView:title];
    // _loadingView = [LoadingView loadingViewInView:self.navigationController.view andWithText:title];
    
}

-(void)removeLoadingView
{
    [[GISLoadingView sharedDataManager] removeLoadingAlertview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
