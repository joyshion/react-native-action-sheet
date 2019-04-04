
#import "RNActionSheet.h"
#import <React/RCTConvert.h>

@interface RNActionSheet () <UIActionSheetDelegate>
@end

@implementation RNActionSheet

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(show:(NSDictionary *)options callback:(RCTResponseSenderBlock)callback)
{
    NSString *title = [RCTConvert NSString:options[@"title"]];
    NSString *cancelText = [RCTConvert NSString:options[@"cancelText"]];
    NSArray<NSDictionary *> *items = [RCTConvert NSDictionaryArray:options[@"items"]];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    for (NSDictionary *item in items) {
        NSString *title = [item valueForKey:@"title"];
        UIAlertAction *customAction = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            callback(@[@{@"key": [item valueForKey:@"key"]}]);
        }];
        [alertController addAction:customAction];
    }
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelText style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancelAction];
    
    UIViewController *root = RCTPresentedViewController();
    
    alertController.popoverPresentationController.sourceView = root.view;
    alertController.popoverPresentationController.sourceRect = CGRectMake(root.view.bounds.size.width / 2.0, root.view.bounds.size.height, 1.0, 1.0);
    
    [root presentViewController:alertController animated:YES completion:nil];
}

@end
