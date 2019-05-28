## ISSUE ##
Using `CNContactViewController(forNewContact:)` failes to render if the `parentContact` or `parentGroup` properties are populated.

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

2. Tap the `Request Access` button

![](/README/Images/request-access.png)

3. Authorize Access by tapping on `OK`

![](/README/Images/authorized.png)

4. Tap `Add Group Contact`

![](/README/Images/add-group-contact.png)

5. Expected Results

![](/README/Images/add-contact.png)
