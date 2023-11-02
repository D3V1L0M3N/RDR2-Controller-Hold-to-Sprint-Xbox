#Requires AutoHotkey v2.0-beta.6
#MaxThreadsPerHotkey 3
#HotIf WinExist("ahk_exe rdr2.exe")


!n:: {
  static isEnabled := false
  
  isEnabled := !isEnabled

  SoundBeep(400, 120)
  SoundBeep((isEnabled ? 500 : 300), 120)
  SetTimer(getControllerState, isEnabled ? 100 : 0)
}


getControllerState() {
  static isShiftActive := false

  if (State := XInputState(0)) {
    ; Hold down shift when Xbox Controller's "A" button is held
    if (State.wButtons == 4096) {
      SendInput "{LShift down}"
      isShiftActive := true
    }
    ; Release shift key when input no longer detected
    else if (isShiftActive) {
      SendInput "{LShift up}"
      isShiftActive := false
    }
  }
}


#DllLoad XInput1_4.dll
XInputState(UserIndex) {
  xiState := Buffer(16)
  if err := DllCall("XInput1_4\XInputGetState", "uint", UserIndex, "ptr", xiState) {
    if err = 1167 ; ERROR_DEVICE_NOT_CONNECTED
      return 0
    throw OSError(err, -1)
  }
  return {
    dwPacketNumber: NumGet(xiState,  0, "UInt"),
    wButtons:       NumGet(xiState,  4, "UShort"),
    bLeftTrigger:   NumGet(xiState,  6, "UChar"),
    bRightTrigger:  NumGet(xiState,  7, "UChar"),
    sThumbLX:       NumGet(xiState,  8, "Short"),
    sThumbLY:       NumGet(xiState, 10, "Short"),
    sThumbRX:       NumGet(xiState, 12, "Short"),
    sThumbRY:       NumGet(xiState, 14, "Short"),
  }
}