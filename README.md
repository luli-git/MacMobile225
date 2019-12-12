# MacMobile

MacMobile is a cross-platform mobile app that is developed using Flutter. This application consolidates
the important information for members of the Macalester College community, such as the dining hall hours,
the facility hours, the academic resources, and the daily events.

## App Structure

The app is structured into four tabs: Home, Dining, Hours, and Events. The home page includes numerous
buttons that contain links to many of the important online resources at Macalester, such as Moodle and
1600 Grand.

The dining tab displays the daily hours of the dining options on campus as well as whether each option
is open or closed. This page also contains buttons that can lead to the Bon Appetit website, which displays
the daily menus.

The hours tab presents the hours of the popular facilities on campus and notes whether each is open. It
also gives the phone numbers, locations, and websites of each facility. The information for the dining and
hours tabs are stored in Firebase

Finally, the events tab uses the Google Calendar API to present the daily on-campus events in a
calendar. The design of the calendar was inspired by the MIT license in the following Github
repository https://github.com/tsmith1024/calendar_view_widget

## Code Structure

