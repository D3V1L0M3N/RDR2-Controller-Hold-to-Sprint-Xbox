
# RDR2 Controller Hold-to-Sprint [Xbox]

This is an [AutoHotkey](https://www.autohotkey.com/) script made for Red Dead Redemption 2 which allows you to **Hold A** on your controller to sprint your horse instead of mashing the A button.


**This version was made explictly for newer Xbox Controllers** (those released after the Xbox 360 controller) due to a limitation with AutoHotkey not detecting controller input unless AutoHotkey window was in focus.

The workaround is to use [XInput.ahk by Lexikos](https://www.autohotkey.com/boards/viewtopic.php?f=83&t=106254) but this has one drawback: controller state has to be manually polled at frequent intervals, so this means not being able to reliably detect if you double tapped a button on your controller (because you could have tapped the controller on/off between polling calls).

#### Usage

In this version of the script, **Hold A** to sprint

#### Installation
1. Install the free & open-source application: [AutoHotkey v2.0 for Windows](https://www.autohotkey.com/)
2. Download the latest `RDR2 Controller Hold-to-Sprint [Xbox]` ahk script from the [Releases]() page
3. `Right-click` > `Run Script`
4. Press `Alt + N` to toggle the *hold-to-sprint*

> [!NOTE]
> This script works by simulating the Shift key. This means pressing A also triggers Shift. This can cause conflicts in cases where only the A key is desired. To avoid any issues simply press `Alt + N` to toggle the hold-to-sprint feature when it isn't wanted.