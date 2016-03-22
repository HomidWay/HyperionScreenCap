; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define use_dotnetfx40
#define use_wic

#define use_directxruntime

#define use_msiproduct
#define use_vc2008
;#define use_vc2010
#define use_vc2010sp1
#define use_vc2012
#define use_vc2013

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
AppId={{EB137069-4865-4E77-8AC3-00E4399B1359}
AppName=Hyperion Screen Capture
AppVersion=1.0
;AppVerName=Hyperion Screen Capture 1.0
AppPublisher=Djhansel
AppPublisherURL=https://github.com/djhansel/HyperionScreenCap
AppSupportURL=https://github.com/djhansel/HyperionScreenCap
AppUpdatesURL=https://github.com/djhansel/HyperionScreenCap
DefaultDirName={pf}\Hyperion Screen Capture
DisableProgramGroupPage=yes
LicenseFile=License.txt
OutputBaseFilename=SetupHyperionScreenCap
SetupIconFile=../Resources/Hyperion-enabled.ico
Compression=lzma
SolidCompression=yes
PrivilegesRequired=admin

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"


[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "..\bin\x86\Release\HyperionScreenCap.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\bin\x86\Release\HyperionScreenCap.exe.config"; DestDir: "{app}"; Flags: ignoreversion
;Source: "..\bin\x86\Release\SlimDX.dll"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

; direct X installer 
Source: "src\dxwebsetup.exe"; Flags: dontcopy


[Icons]
Name: "{commonprograms}\Hyperion Screen Capture"; Filename: "{app}\HyperionScreenCap.exe"
Name: "{commondesktop}\Hyperion Screen Capture"; Filename: "{app}\HyperionScreenCap.exe"; Tasks: desktopicon

[Run]
Filename: "{app}\HyperionScreenCap.exe"; Description: "{cm:LaunchProgram,Hyperion Screen Capture}"; Flags: nowait postinstall skipifsilent

[CustomMessages]
win_sp_title=Windows %1 Service Pack %2


; shared code for installing the products
#include "scripts\products.iss"
; helper functions
#include "scripts\products\stringversion.iss"
#include "scripts\products\winversion.iss"
#include "scripts\products\fileversion.iss"
#include "scripts\products\dotnetfxversion.iss"

; actual products
#ifdef use_iis
#include "scripts\products\iis.iss"
#endif

#ifdef use_kb835732
#include "scripts\products\kb835732.iss"
#endif

#ifdef use_msi20
#include "scripts\products\msi20.iss"
#endif
#ifdef use_msi31
#include "scripts\products\msi31.iss"
#endif
#ifdef use_msi45
#include "scripts\products\msi45.iss"
#endif

#ifdef use_ie6
#include "scripts\products\ie6.iss"
#endif

#ifdef use_dotnetfx11
#include "scripts\products\dotnetfx11.iss"
#include "scripts\products\dotnetfx11sp1.iss"
#ifdef use_dotnetfx11lp
#include "scripts\products\dotnetfx11lp.iss"
#endif
#endif

#ifdef use_dotnetfx20
#include "scripts\products\dotnetfx20.iss"
#include "scripts\products\dotnetfx20sp1.iss"
#include "scripts\products\dotnetfx20sp2.iss"
#ifdef use_dotnetfx20lp
#include "scripts\products\dotnetfx20lp.iss"
#include "scripts\products\dotnetfx20sp1lp.iss"
#include "scripts\products\dotnetfx20sp2lp.iss"
#endif
#endif

#ifdef use_dotnetfx35
;#include "scripts\products\dotnetfx35.iss"
#include "scripts\products\dotnetfx35sp1.iss"
#ifdef use_dotnetfx35lp
;#include "scripts\products\dotnetfx35lp.iss"
#include "scripts\products\dotnetfx35sp1lp.iss"
#endif
#endif

#ifdef use_dotnetfx40
#include "scripts\products\dotnetfx40client.iss"
#include "scripts\products\dotnetfx40full.iss"
#endif

#ifdef use_dotnetfx46
#include "scripts\products\dotnetfx46.iss"
#endif

#ifdef use_wic
#include "scripts\products\wic.iss"
#endif

#ifdef use_msiproduct
#include "scripts\products\msiproduct.iss"
#endif
#ifdef use_vc2005
#include "scripts\products\vcredist2005.iss"
#endif
#ifdef use_vc2008
#include "scripts\products\vcredist2008.iss"
#endif
#ifdef use_vc2010
#include "scripts\products\vcredist2010.iss"
#endif
#ifdef use_vc2010sp1
#include "scripts\products\vcredist2010sp1.iss"
#endif
#ifdef use_vc2012
#include "scripts\products\vcredist2012.iss"
#endif
#ifdef use_vc2013
#include "scripts\products\vcredist2013.iss"
#endif
#ifdef use_vc2015
#include "scripts\products\vcredist2015.iss"
#endif

#ifdef use_directxruntime
#include "scripts\products\directxruntime.iss"
#endif

#ifdef use_mdac28
#include "scripts\products\mdac28.iss"
#endif
#ifdef use_jet4sp8
#include "scripts\products\jet4sp8.iss"
#endif

#ifdef use_sqlcompact35sp2
#include "scripts\products\sqlcompact35sp2.iss"
#endif

#ifdef use_sql2005express
#include "scripts\products\sql2005express.iss"
#endif
#ifdef use_sql2008express
#include "scripts\products\sql2008express.iss"
#endif

[Code]
function InitializeSetup(): boolean;
begin
	// initialize windows version
	initwinversion();

#ifdef use_iis
	if (not iis()) then exit;
#endif

#ifdef use_msi20
	msi20('2.0'); // min allowed version is 2.0
#endif
#ifdef use_msi31
	msi31('3.1'); // min allowed version is 3.1
#endif
#ifdef use_msi45
	msi45('4.5'); // min allowed version is 4.5
#endif
#ifdef use_ie6
	ie6('5.0.2919'); // min allowed version is 5.0.2919
#endif

#ifdef use_dotnetfx11
	dotnetfx11();
#ifdef use_dotnetfx11lp
	dotnetfx11lp();
#endif
	dotnetfx11sp1();
#endif

	// install .netfx 2.0 sp2 if possible; if not sp1 if possible; if not .netfx 2.0
#ifdef use_dotnetfx20
	// check if .netfx 2.0 can be installed on this OS
	if not minwinspversion(5, 0, 3) then begin
		msgbox(fmtmessage(custommessage('depinstall_missing'), [fmtmessage(custommessage('win_sp_title'), ['2000', '3'])]), mberror, mb_ok);
		exit;
	end;
	if not minwinspversion(5, 1, 2) then begin
		msgbox(fmtmessage(custommessage('depinstall_missing'), [fmtmessage(custommessage('win_sp_title'), ['XP', '2'])]), mberror, mb_ok);
		exit;
	end;

	if minwinversion(5, 1) then begin
		dotnetfx20sp2();
#ifdef use_dotnetfx20lp
		dotnetfx20sp2lp();
#endif
	end else begin
		if minwinversion(5, 0) and minwinspversion(5, 0, 4) then begin
#ifdef use_kb835732
			kb835732();
#endif
			dotnetfx20sp1();
#ifdef use_dotnetfx20lp
			dotnetfx20sp1lp();
#endif
		end else begin
			dotnetfx20();
#ifdef use_dotnetfx20lp
			dotnetfx20lp();
#endif
		end;
	end;
#endif

#ifdef use_dotnetfx35
	//dotnetfx35();
	dotnetfx35sp1();
#ifdef use_dotnetfx35lp
	//dotnetfx35lp();
	dotnetfx35sp1lp();
#endif
#endif

#ifdef use_wic
	wic();
#endif

	// if no .netfx 4.0 is found, install the client (smallest)
#ifdef use_dotnetfx40
	if (not netfxinstalled(NetFx40Client, '') and not netfxinstalled(NetFx40Full, '')) then
		dotnetfx40client();
#endif

#ifdef use_dotnetfx46
    dotnetfx46(50); // min allowed version is 4.5.0
#endif

#ifdef use_vc2005
	vcredist2005();
#endif
#ifdef use_vc2008
	vcredist2008();
#endif
#ifdef use_vc2010
	vcredist2010();
#endif
#ifdef use_vc2010sp1
	vcredist2010sp1();
#endif
#ifdef use_vc2012
	vcredist2012();
#endif
#ifdef use_vc2013
	//SetForceX86(true); // force 32-bit install of next products
	vcredist2013();
	//SetForceX86(false); // disable forced 32-bit install again
#endif
#ifdef use_vc2015
	vcredist2015();
#endif

#ifdef use_directxruntime
	// extracts included setup file to temp folder so that we don't need to download it
	// and always runs directxruntime installer as we don't know how to check if it is required
	directxruntime();
#endif

#ifdef use_mdac28
	mdac28('2.7'); // min allowed version is 2.7
#endif
#ifdef use_jet4sp8
	jet4sp8('4.0.8015'); // min allowed version is 4.0.8015
#endif

#ifdef use_sqlcompact35sp2
	sqlcompact35sp2();
#endif

#ifdef use_sql2005express
	sql2005express();
#endif
#ifdef use_sql2008express
	sql2008express();
#endif

	Result := true;
end;