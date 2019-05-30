## Apple's Bug Reporter Information ##

**Problem ID:** 23211838

**Title:** The `CNContactViewController(forNewContact:)` fails to render if `parentContainer` or `parentGroup` are populated.

**Created:** October 21, 2015 at 8:16 PM

## Contacts Documentation ##
https://developer.apple.com/documentation/contactsui/cncontactviewcontroller

## Failure Message ##
```
Using group: Friends
BrokenContacts[4099:136342] [CNUI ERROR] error calling service - Couldn’t communicate with a helper application.
```

## Steps to Reproduce ##

1. Launch App

![](README/Images/initial-launch.png)

___

2. Tap the `Request Access` button

![](/README/Images/request-access.png)

___

3. Authorize Access by tapping on `OK`

![](/README/Images/authorized.png)

___

4. Tap `Add Group Contact`

![](/README/Images/add-group-contact.png)

___

5. Expected Results

![](/README/Images/add-contact.png)
