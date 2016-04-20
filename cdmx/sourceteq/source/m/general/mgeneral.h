#import <Foundation/Foundation.h>

// analytics

typedef NS_ENUM(NSUInteger, ga_screen)
{
    ga_screen_environment,
    ga_screen_environment_geo,
    ga_screen_environment_detail,
    ga_screen_nodrive,
    ga_screen_settings,
    ga_screen_about,
    ga_screen_menu
};

typedef NS_ENUM(NSUInteger, ga_event)
{
    ga_event_environment_station,
    ga_event_about_app,
    ga_event_settings_notifications
};

typedef NS_ENUM(NSUInteger, ga_action)
{
    ga_action_geo,
    ga_action_detail,
    ga_action_review,
    ga_action_share,
    ga_action_on,
    ga_action_off
};