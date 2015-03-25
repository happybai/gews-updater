; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "��������ʲ�������ϵͳ"
!define PRODUCT_VERSION "0.1"
!define PRODUCT_PUBLISHER "ú�Ƽ��������о�Ժ���޹�˾"
!define PRODUCT_WEB_SITE "http://www.syccri.com"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\sys3.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
!define PRODUCT_STARTMENU_REGVAL "NSIS:StartMenuDir"

; MUI 1.67 compatible ------
!include "MUI.nsh"

; nsDialogs
!include LogicLib.nsh
!include nsDialogs.nsh

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!insertmacro MUI_PAGE_LICENSE "..\..\..\path\to\licence\YourSoftwareLicence.txt"
; Directory page
!insertmacro MUI_PAGE_DIRECTORY

;Setup IP adress and DataSource
XPStyle on
Var Dialog
Var lbServerIP
Var txtServerIP
Var lbDbInstance
Var txtDbInstance
Var lbDbName
Var txtDbName
Var lbGisDbName
Var txtGisDbName

Var serverIp
Var dbInstance
Var dbName
Var gisDbName

Page custom nsDialogsPage nsDialogsPageLeave

Function nsDialogsPage

	nsDialogs::Create 1018
	Pop $Dialog

	${If} $Dialog == error
		Abort
	${EndIf}

	${NSD_CreateLabel} 0 0 100% 12u "Ԥ��������IP��ַ"
	Pop $lbServerIP

	${NSD_CreateText} 0 13u 100% -128u "127.0.0.1"
	Pop $txtServerIP

        ${NSD_CreateLabel} 0 29u 100% 12u "���ݿ������ʵ��"
	Pop $lbDbInstance

	${NSD_CreateText} 0 42u 100% -128u "(local)\SQL2008R2,1433"
	Pop $txtDbInstance

        ${NSD_CreateLabel} 0 58u 100% 12u "���ݿ�����"
	Pop $lbDbName

	${NSD_CreateText} 0 71u 100% -128u "GasWarningDatabase"
	Pop $txtDbName

	${NSD_CreateLabel} 0 87u 100% 12u "GIS���ݿ�����"
	Pop $lbGisDbName

	${NSD_CreateText} 0 100u 100% -128u "GasWarningGIS"
	Pop $txtGisDbName

	nsDialogs::Show

FunctionEnd

Function nsDialogsPageLeave

  ${NSD_GetText} $txtServerIP $0
  ${NSD_GetText} $txtDbInstance $1
  ${NSD_GetText} $txtDbName $2
  ${NSD_GetText} $txtGisDbName $3

  StrCpy $serverIp $0
  StrCpy $dbInstance $1
  StrCpy $dbName $2
  StrCpy $gisDbName $3

FunctionEnd


; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\app.publish\sys3.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "SimpChinese"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "gews_sys3_v0.1.exe"
InstallDir "$PROGRAMFILES\Gews\sys3"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" "sys3"
ShowInstDetails show
ShowUnInstDetails show

Section "��������ʲ�������ϵͳ" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite try
  File "..\..\..\gews\sys3\bin\Debug\Antlr3.Runtime.dll"
  CreateDirectory "$SMPROGRAMS\��˹�ֺ�Ԥ��ϵͳ\��������ʲ�������ϵͳ"
  CreateShortCut "$SMPROGRAMS\��˹�ֺ�Ԥ��ϵͳ\��������ʲ�������ϵͳ\��������ʲ�������ϵͳ.lnk" "$INSTDIR\sys3.exe"
  CreateShortCut "$DESKTOP\��������ʲ�������ϵͳ.lnk" "$INSTDIR\sys3.exe"
  SetOutPath "$INSTDIR"
  File "..\..\..\gews\sys3\bin\Debug\ARConfig.xml"
  File "..\..\..\gews\sys3\bin\Debug\AutoUpdater.NET.dll"
  File "..\..\..\gews\sys3\bin\Debug\AutoUpdater.NET.pdb"
  File "..\..\..\gews\sys3\bin\Debug\AutoUpdater.NET.xml"
  File "..\..\..\gews\sys3\bin\Debug\BigFaultage.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\BigFaultagePoint.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\Borehole.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\BoreholeLithology.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\Castle.ActiveRecord.dll"
  File "..\..\..\gews\sys3\bin\Debug\Castle.ActiveRecord.Web.dll"
  File "..\..\..\gews\sys3\bin\Debug\Castle.ActiveRecord.Web.xml"
  File "..\..\..\gews\sys3\bin\Debug\Castle.ActiveRecord.xml"
  File "..\..\..\gews\sys3\bin\Debug\Castle.Components.Validator.dll"
  File "..\..\..\gews\sys3\bin\Debug\Castle.Components.Validator.pdb"
  File "..\..\..\gews\sys3\bin\Debug\Castle.Components.Validator.xml"
  File "..\..\..\gews\sys3\bin\Debug\Castle.Core.dll"
  File "..\..\..\gews\sys3\bin\Debug\Castle.Core.xml"
  File "..\..\..\gews\sys3\bin\Debug\CoalExistence.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\CoalSeams.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\CollapsePillarsEnt.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\CollapsePillarsKeyPointEnt.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\Config.ini"
  File "..\..\..\gews\sys3\bin\Debug\ConfigDatabaseGIS.ini"
  SetOutPath "$INSTDIR\da"
  File "..\..\..\gews\sys3\bin\Debug\da\AutoUpdater.NET.resources.dll"
  SetOutPath "$INSTDIR"
  File "..\..\..\gews\sys3\bin\Debug\DayReportHc.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\DayReportJj.hbm.xml"
  SetOutPath "$INSTDIR\de"
  File "..\..\..\gews\sys3\bin\Debug\de\AutoUpdater.NET.resources.dll"
  File "..\..\..\gews\sys3\bin\Debug\de\DevExpress.Data.v14.1.resources.dll"
  File "..\..\..\gews\sys3\bin\Debug\de\DevExpress.Utils.v14.1.resources.dll"
  File "..\..\..\gews\sys3\bin\Debug\de\DevExpress.XtraBars.v14.1.resources.dll"
  File "..\..\..\gews\sys3\bin\Debug\de\DevExpress.XtraEditors.v14.1.resources.dll"
  File "..\..\..\gews\sys3\bin\Debug\de\DevExpress.XtraScheduler.v14.1.Core.resources.dll"
  SetOutPath "$INSTDIR"
  File "..\..\..\gews\sys3\bin\Debug\default.mxd"
  File "..\..\..\gews\sys3\bin\Debug\DefaultUser"
  File "..\..\..\gews\sys3\bin\Debug\Department.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\DevExpress.Data.v14.1.dll"
  File "..\..\..\gews\sys3\bin\Debug\DevExpress.Data.v14.1.xml"
  File "..\..\..\gews\sys3\bin\Debug\DevExpress.Utils.v14.1.dll"
  File "..\..\..\gews\sys3\bin\Debug\DevExpress.Utils.v14.1.xml"
  File "..\..\..\gews\sys3\bin\Debug\DevExpress.XtraBars.v14.1.dll"
  File "..\..\..\gews\sys3\bin\Debug\DevExpress.XtraBars.v14.1.xml"
  File "..\..\..\gews\sys3\bin\Debug\DevExpress.XtraEditors.v14.1.dll"
  File "..\..\..\gews\sys3\bin\Debug\DevExpress.XtraEditors.v14.1.xml"
  File "..\..\..\gews\sys3\bin\Debug\DevExpress.XtraScheduler.v14.1.Core.dll"
  File "..\..\..\gews\sys3\bin\Debug\DevExpress.XtraScheduler.v14.1.Core.xml"
  SetOutPath "$INSTDIR\es"
  File "..\..\..\gews\sys3\bin\Debug\es\Castle.Components.Validator.resources.dll"
  File "..\..\..\gews\sys3\bin\Debug\es\DevExpress.Data.v14.1.resources.dll"
  File "..\..\..\gews\sys3\bin\Debug\es\DevExpress.Utils.v14.1.resources.dll"
  File "..\..\..\gews\sys3\bin\Debug\es\DevExpress.XtraBars.v14.1.resources.dll"
  File "..\..\..\gews\sys3\bin\Debug\es\DevExpress.XtraEditors.v14.1.resources.dll"
  File "..\..\..\gews\sys3\bin\Debug\es\DevExpress.XtraScheduler.v14.1.Core.resources.dll"
  SetOutPath "$INSTDIR"
  File "..\..\..\gews\sys3\bin\Debug\ESRI.ArcGIS.ADF.Connection.Local.dll"
  File "..\..\..\gews\sys3\bin\Debug\ESRI.ArcGIS.ADF.Local.dll"
  File "..\..\..\gews\sys3\bin\Debug\ESRI.ArcGIS.AxControls.dll"
  File "..\..\..\gews\sys3\bin\Debug\ESRI.ArcGIS.Carto.dll"
  File "..\..\..\gews\sys3\bin\Debug\ESRI.ArcGIS.Controls.dll"
  File "..\..\..\gews\sys3\bin\Debug\ESRI.ArcGIS.Display.dll"
  File "..\..\..\gews\sys3\bin\Debug\ESRI.ArcGIS.Geodatabase.dll"
  File "..\..\..\gews\sys3\bin\Debug\ESRI.ArcGIS.Geometry.dll"
  File "..\..\..\gews\sys3\bin\Debug\ESRI.ArcGIS.Geoprocessor.dll"
  File "..\..\..\gews\sys3\bin\Debug\ESRI.ArcGIS.System.dll"
  File "..\..\..\gews\sys3\bin\Debug\ESRI.ArcGIS.Version.dll"
  File "..\..\..\gews\sys3\bin\Debug\ESRI.ServerStyle"
  File "..\..\..\gews\sys3\bin\Debug\ESRI.style"
  File "..\..\..\gews\sys3\bin\Debug\FarPoint.Win.dll"
  File "..\..\..\gews\sys3\bin\Debug\FarPoint.Win.Spread.dll"
  File "..\..\..\gews\sys3\bin\Debug\FarPoint.Win.Spread.xml"
  File "..\..\..\gews\sys3\bin\Debug\FarPoint.Win.xml"
  File "..\..\..\gews\sys3\bin\Debug\Faultage.hbm.xml"
  SetOutPath "$INSTDIR\FlashPoint"
  File "..\..\..\gews\sys3\bin\Debug\FlashPoint\FlashPoint.dbf"
  File "..\..\..\gews\sys3\bin\Debug\FlashPoint\FlashPoint.prj"
  File "..\..\..\gews\sys3\bin\Debug\FlashPoint\FlashPoint.sbn"
  File "..\..\..\gews\sys3\bin\Debug\FlashPoint\FlashPoint.sbx"
  File "..\..\..\gews\sys3\bin\Debug\FlashPoint\FlashPoint.shp"
  File "..\..\..\gews\sys3\bin\Debug\FlashPoint\FlashPoint.shp.LYF.12516.13204.sr.lock"
  File "..\..\..\gews\sys3\bin\Debug\FlashPoint\FlashPoint.shp.xml"
  File "..\..\..\gews\sys3\bin\Debug\FlashPoint\FlashPoint.shx"
  SetOutPath "$INSTDIR\fr"
  File "..\..\..\gews\sys3\bin\Debug\fr\Castle.Components.Validator.resources.dll"
  SetOutPath "$INSTDIR"
  File "..\..\..\gews\sys3\bin\Debug\GasConcentrationProbeData.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\GasContent.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\GasData.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\GasGushQuantity.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\GasPressure.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\GeologicStructure.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\GeologySpace.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\GIS.dll"
  File "..\..\..\gews\sys3\bin\Debug\GIS.pdb"
  File "..\..\..\gews\sys3\bin\Debug\gis.xml"
  File "..\..\..\gews\sys3\bin\Debug\Horizontal.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\Iesi.Collections.dll"
  File "..\..\..\gews\sys3\bin\Debug\Interop.SpeechLib.dll"
  SetOutPath "$INSTDIR\it"
  File "..\..\..\gews\sys3\bin\Debug\it\Castle.Components.Validator.resources.dll"
  SetOutPath "$INSTDIR\it-IT"
  File "..\..\..\gews\sys3\bin\Debug\it-IT\AutoUpdater.NET.resources.dll"
  SetOutPath "$INSTDIR\ja"
  File "..\..\..\gews\sys3\bin\Debug\ja\DevExpress.Data.v14.1.resources.dll"
  File "..\..\..\gews\sys3\bin\Debug\ja\DevExpress.Utils.v14.1.resources.dll"
  File "..\..\..\gews\sys3\bin\Debug\ja\DevExpress.XtraBars.v14.1.resources.dll"
  File "..\..\..\gews\sys3\bin\Debug\ja\DevExpress.XtraEditors.v14.1.resources.dll"
  File "..\..\..\gews\sys3\bin\Debug\ja\DevExpress.XtraScheduler.v14.1.Core.resources.dll"
  SetOutPath "$INSTDIR"
  File "..\..\..\gews\sys3\bin\Debug\K1Value.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\LibAbout.dll"
  File "..\..\..\gews\sys3\bin\Debug\LibAbout.pdb"
  File "..\..\..\gews\sys3\bin\Debug\LibBusiness.dll"
  File "..\..\..\gews\sys3\bin\Debug\LibBusiness.pdb"
  File "..\..\..\gews\sys3\bin\Debug\LibCommon.dll"
  File "..\..\..\gews\sys3\bin\Debug\LibCommon.dll.config"
  File "..\..\..\gews\sys3\bin\Debug\LibCommon.pdb"
  File "..\..\..\gews\sys3\bin\Debug\LibCommonControl.dll"
  File "..\..\..\gews\sys3\bin\Debug\LibCommonControl.pdb"
  File "..\..\..\gews\sys3\bin\Debug\LibCommonForm.dll"
  File "..\..\..\gews\sys3\bin\Debug\LibCommonForm.pdb"
  File "..\..\..\gews\sys3\bin\Debug\LibConfig.dll"
  File "..\..\..\gews\sys3\bin\Debug\LibConfig.pdb"
  File "..\..\..\gews\sys3\bin\Debug\LibDatabase.dll"
  File "..\..\..\gews\sys3\bin\Debug\LibDatabase.pdb"
  File "..\..\..\gews\sys3\bin\Debug\LibEncryptDecrypt.dll"
  File "..\..\..\gews\sys3\bin\Debug\LibEncryptDecrypt.pdb"
  File "..\..\..\gews\sys3\bin\Debug\LibEntity.dll"
  File "..\..\..\gews\sys3\bin\Debug\LibEntity.pdb"
  File "..\..\..\gews\sys3\bin\Debug\LibGeometry.dll"
  File "..\..\..\gews\sys3\bin\Debug\LibGeometry.pdb"
  File "..\..\..\gews\sys3\bin\Debug\LibLoginForm.dll"
  File "..\..\..\gews\sys3\bin\Debug\LibLoginForm.pdb"
  File "..\..\..\gews\sys3\bin\Debug\LibPanels.dll"
  File "..\..\..\gews\sys3\bin\Debug\LibPanels.pdb"
  File "..\..\..\gews\sys3\bin\Debug\LibSocket.dll"
  File "..\..\..\gews\sys3\bin\Debug\LibSocket.pdb"
  File "..\..\..\gews\sys3\bin\Debug\LibXPorperty.dll"
  File "..\..\..\gews\sys3\bin\Debug\LibXPorperty.pdb"
  File "..\..\..\gews\sys3\bin\Debug\Lithology.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\local.mxd"
  File "..\..\..\gews\sys3\bin\Debug\log4net.dll"
  File "..\..\..\gews\sys3\bin\Debug\LoginBackground.bmp"
  SetOutPath "$INSTDIR\lt"
  File "..\..\..\gews\sys3\bin\Debug\lt\Castle.Components.Validator.resources.dll"
  SetOutPath "$INSTDIR\lv"
  File "..\..\..\gews\sys3\bin\Debug\lv\Castle.Components.Validator.resources.dll"
  SetOutPath "$INSTDIR"
  File "..\..\..\gews\sys3\bin\Debug\Management.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\Mine.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\MiningArea.hbm.xml"
  SetOutPath "$INSTDIR\mk"
  File "..\..\..\gews\sys3\bin\Debug\mk\Castle.Components.Validator.resources.dll"
  SetOutPath "$INSTDIR"
  File "..\..\..\gews\sys3\bin\Debug\Newtonsoft.Json.dll"
  File "..\..\..\gews\sys3\bin\Debug\NHibernate.ByteCode.Castle.dll"
  File "..\..\..\gews\sys3\bin\Debug\NHibernate.ByteCode.Castle.xml"
  File "..\..\..\gews\sys3\bin\Debug\NHibernate.dll"
  File "..\..\..\gews\sys3\bin\Debug\NHibernate.Search.dll"
  File "..\..\..\gews\sys3\bin\Debug\NHibernate.xml"
  File "..\..\..\gews\sys3\bin\Debug\nini.dll"
  SetOutPath "$INSTDIR\nl"
  File "..\..\..\gews\sys3\bin\Debug\nl\Castle.Components.Validator.resources.dll"
  SetOutPath "$INSTDIR"
  File "..\..\..\gews\sys3\bin\Debug\PanelFormName.ini"
  SetOutPath "$INSTDIR\pl"
  File "..\..\..\gews\sys3\bin\Debug\pl\Castle.Components.Validator.resources.dll"
  SetOutPath "$INSTDIR"
  File "..\..\..\gews\sys3\bin\Debug\PreWarningRules.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\Probe.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\ProbeType.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\ProspectingLine.hbm.xml"
  SetOutPath "$INSTDIR\pt"
  File "..\..\..\gews\sys3\bin\Debug\pt\Castle.Components.Validator.resources.dll"
  SetOutPath "$INSTDIR"
  File "..\..\..\gews\sys3\bin\Debug\Remotion.Data.Linq.dll"
  SetOutPath "$INSTDIR\ru"
  File "..\..\..\gews\sys3\bin\Debug\ru\AutoUpdater.NET.resources.dll"
  File "..\..\..\gews\sys3\bin\Debug\ru\Castle.Components.Validator.resources.dll"
  File "..\..\..\gews\sys3\bin\Debug\ru\DevExpress.Data.v14.1.resources.dll"
  File "..\..\..\gews\sys3\bin\Debug\ru\DevExpress.Utils.v14.1.resources.dll"
  File "..\..\..\gews\sys3\bin\Debug\ru\DevExpress.XtraBars.v14.1.resources.dll"
  File "..\..\..\gews\sys3\bin\Debug\ru\DevExpress.XtraEditors.v14.1.resources.dll"
  File "..\..\..\gews\sys3\bin\Debug\ru\DevExpress.XtraScheduler.v14.1.Core.resources.dll"
  SetOutPath "$INSTDIR"
  File "..\..\..\gews\sys3\bin\Debug\StopLine.hbm.xml"
  SetOutPath "$INSTDIR\sv"
  File "..\..\..\gews\sys3\bin\Debug\sv\Castle.Components.Validator.resources.dll"
  SetOutPath "$INSTDIR"
  File "..\..\..\gews\sys3\bin\Debug\symbol.ServerStyle"
  File "..\..\..\gews\sys3\bin\Debug\sys3.application"
  File "..\..\..\gews\sys3\bin\Debug\sys3.exe"
  File "..\..\..\gews\sys3\bin\Debug\sys3.exe.config"
  File "..\..\..\gews\sys3\bin\Debug\sys3.exe.manifest"
  File "..\..\..\gews\sys3\bin\Debug\sys3.pdb"
  File "..\..\..\gews\sys3\bin\Debug\sys3.vshost.application"
  File "..\..\..\gews\sys3\bin\Debug\sys3.vshost.exe"
  File "..\..\..\gews\sys3\bin\Debug\sys3.vshost.exe.config"
  File "..\..\..\gews\sys3\bin\Debug\sys3.vshost.exe.manifest"
  File "..\..\..\gews\sys3\bin\Debug\Team.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\test.mdb"
  File "..\..\..\gews\sys3\bin\Debug\Tunnel.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\TunnelHChuan.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\UserGroup.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\UserInfo.ini"
  File "..\..\..\gews\sys3\bin\Debug\UserInformation.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\UserInformationDetails.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\UserLogin.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\Ventilation.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\WarningImg.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\Wire.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\WirePoint.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\WorkingFace.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\WorkingTime.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\WorkingTimeDefault.hbm.xml"
  File "..\..\..\gews\sys3\bin\Debug\_CurSkin.ini"
  File "..\..\..\gews\sys3\bin\Debug\��������ʲ�������ϵͳ�����ļ�.chm"
  CreateShortCut "$SMPROGRAMS\��˹�ֺ�Ԥ��ϵͳ\��������ʲ�������ϵͳ\Help.lnk" "$INSTDIR\��������ʲ�������ϵͳ�����ļ�.chm"
  File "..\..\..\gews\sys3\bin\Debug\ϵͳ������ͼƬ.jpg"
  File "..\..\..\gews\sys3\bin\Debug\�ۺ���״ͼ.mxd"
  
  ;write config.ini
  FileOpen $4 "$INSTDIR\Config.ini" w
  FileWrite $4 "[DataBase]"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "DataSource=$dbInstance"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "UID=C2e="
  FileWrite $4 "$\r$\n"
  FileWrite $4 "PWD=sMnIC2m4odyW"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "DATABASE_MAIN=$dbName"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "DATABASE_GIS=$gisDbName"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "[IC2e=utoLogin]"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "AutoLogin=true"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "Username=Admin"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "Password="
  FileWrite $4 "$\r$\n"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "[Network]"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "SERVER_IP=$serverIp"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "PORT=8888"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "REST_PORT=7071"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "[UserInfo]"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "UID="
  FileWrite $4 "$\r$\n"
  FileWrite $4 "PWD="
  FileWrite $4 "$\r$\n"
  FileClose $4

  ;write ConfigDatabaseGIS.ini
  FileOpen $4 "$INSTDIR\ConfigDatabaseGIS.ini" w
  FileWrite $4 "SERVER=$serverIp"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "INSTANCE=sde:sqlserver:$serverIp"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "DBCLIENT=sqlserver"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "DB_CONNECTION_PROPERTIES=$serverIp"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "DATABASE=GasEarlyWarningGIS"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "USER=sde"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "PASSWORD=Jcbsc8860"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "VERSION=SDE.DEFAULT"
  FileClose $4

  ;write ARConfig.xml
  FileOpen $4 "$INSTDIR\ARConfig.xml" w
  FileWrite $4 "<?xml version=$\"1.0$\" encoding=$\"utf-8$\" ?>"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "<activerecord"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "    isWeb=$\"false$\""
  FileWrite $4 "$\r$\n"
  FileWrite $4 "    isDebug=$\"true$\""
  FileWrite $4 "$\r$\n"
  FileWrite $4 "    pluralizeTableNames=$\"false$\">"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "  <config database=$\"MsSqlServer2008$\" connectionStringName=$\"Gews$\">"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "    <!-- Any legal NHibernate parameter you want to specify or override its default value -->"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "    <add"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "     key=$\"connection.driver_class$\""
  FileWrite $4 "$\r$\n"
  FileWrite $4 "     value=$\"NHibernate.Driver.SqlClientDriver$\" />"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "    <add"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "      key=$\"dialect$\""
  FileWrite $4 "$\r$\n"
  FileWrite $4 "value=$\"NHibernate.Dialect.MsSql2008Dialect$\" />"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "    <add"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "      key=$\"connection.provider$\""
  FileWrite $4 "$\r$\n"
  FileWrite $4 "      value=$\"NHibernate.Connection.DriverConnectionProvider$\" />"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "    <add"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "      key=$\"connection.connection_string$\""
  FileWrite $4 "$\r$\n"
  FileWrite $4 "      value=$\"Data Source=$dbInstance;Initial Catalog=$dbName;Persist Security Info=True;User ID=sa;Password=Jcbsc8860$\" />"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "  </config>"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "$\r$\n"
  FileWrite $4 "</activerecord>"
  FileClose $4
  
  
  
SectionEnd

Section -AdditionalIcons
  CreateShortCut "$SMPROGRAMS\��˹�ֺ�Ԥ��ϵͳ\��������ʲ�������ϵͳ\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\app.publish\sys3.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\app.publish\sys3.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) �ѳɹ��ش���ļ�����Ƴ���"
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "��ȷʵҪ��ȫ�Ƴ� $(^Name) ���估���е������" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\�ۺ���״ͼ.mxd"
  Delete "$INSTDIR\ϵͳ������ͼƬ.jpg"
  Delete "$INSTDIR\��������ʲ�������ϵͳ�����ļ�.chm"
  Delete "$INSTDIR\_CurSkin.ini"
  Delete "$INSTDIR\WorkingTimeDefault.hbm.xml"
  Delete "$INSTDIR\WorkingTime.hbm.xml"
  Delete "$INSTDIR\WorkingFace.hbm.xml"
  Delete "$INSTDIR\WirePoint.hbm.xml"
  Delete "$INSTDIR\Wire.hbm.xml"
  Delete "$INSTDIR\WarningImg.hbm.xml"
  Delete "$INSTDIR\Ventilation.hbm.xml"
  Delete "$INSTDIR\UserLogin.hbm.xml"
  Delete "$INSTDIR\UserInformationDetails.hbm.xml"
  Delete "$INSTDIR\UserInformation.hbm.xml"
  Delete "$INSTDIR\UserInfo.ini"
  Delete "$INSTDIR\UserGroup.hbm.xml"
  Delete "$INSTDIR\TunnelHChuan.hbm.xml"
  Delete "$INSTDIR\Tunnel.hbm.xml"
  Delete "$INSTDIR\test.mdb"
  Delete "$INSTDIR\Team.hbm.xml"
  Delete "$INSTDIR\sys3.vshost.exe.manifest"
  Delete "$INSTDIR\sys3.vshost.exe.config"
  Delete "$INSTDIR\sys3.vshost.exe"
  Delete "$INSTDIR\sys3.vshost.application"
  Delete "$INSTDIR\sys3.pdb"
  Delete "$INSTDIR\sys3.exe.manifest"
  Delete "$INSTDIR\sys3.exe.config"
  Delete "$INSTDIR\sys3.exe"
  Delete "$INSTDIR\sys3.application"
  Delete "$INSTDIR\symbol.ServerStyle"
  Delete "$INSTDIR\sv\Castle.Components.Validator.resources.dll"
  Delete "$INSTDIR\StopLine.hbm.xml"
  Delete "$INSTDIR\ru\DevExpress.XtraScheduler.v14.1.Core.resources.dll"
  Delete "$INSTDIR\ru\DevExpress.XtraEditors.v14.1.resources.dll"
  Delete "$INSTDIR\ru\DevExpress.XtraBars.v14.1.resources.dll"
  Delete "$INSTDIR\ru\DevExpress.Utils.v14.1.resources.dll"
  Delete "$INSTDIR\ru\DevExpress.Data.v14.1.resources.dll"
  Delete "$INSTDIR\ru\Castle.Components.Validator.resources.dll"
  Delete "$INSTDIR\ru\AutoUpdater.NET.resources.dll"
  Delete "$INSTDIR\Remotion.Data.Linq.dll"
  Delete "$INSTDIR\pt\Castle.Components.Validator.resources.dll"
  Delete "$INSTDIR\ProspectingLine.hbm.xml"
  Delete "$INSTDIR\ProbeType.hbm.xml"
  Delete "$INSTDIR\Probe.hbm.xml"
  Delete "$INSTDIR\PreWarningRules.hbm.xml"
  Delete "$INSTDIR\pl\Castle.Components.Validator.resources.dll"
  Delete "$INSTDIR\PanelFormName.ini"
  Delete "$INSTDIR\nl\Castle.Components.Validator.resources.dll"
  Delete "$INSTDIR\nini.dll"
  Delete "$INSTDIR\NHibernate.xml"
  Delete "$INSTDIR\NHibernate.Search.dll"
  Delete "$INSTDIR\NHibernate.dll"
  Delete "$INSTDIR\NHibernate.ByteCode.Castle.xml"
  Delete "$INSTDIR\NHibernate.ByteCode.Castle.dll"
  Delete "$INSTDIR\Newtonsoft.Json.dll"
  Delete "$INSTDIR\mk\Castle.Components.Validator.resources.dll"
  Delete "$INSTDIR\MiningArea.hbm.xml"
  Delete "$INSTDIR\Mine.hbm.xml"
  Delete "$INSTDIR\Management.hbm.xml"
  Delete "$INSTDIR\lv\Castle.Components.Validator.resources.dll"
  Delete "$INSTDIR\lt\Castle.Components.Validator.resources.dll"
  Delete "$INSTDIR\LoginBackground.bmp"
  Delete "$INSTDIR\log4net.dll"
  Delete "$INSTDIR\local.mxd"
  Delete "$INSTDIR\Lithology.hbm.xml"
  Delete "$INSTDIR\LibXPorperty.pdb"
  Delete "$INSTDIR\LibXPorperty.dll"
  Delete "$INSTDIR\LibSocket.pdb"
  Delete "$INSTDIR\LibSocket.dll"
  Delete "$INSTDIR\LibPanels.pdb"
  Delete "$INSTDIR\LibPanels.dll"
  Delete "$INSTDIR\LibLoginForm.pdb"
  Delete "$INSTDIR\LibLoginForm.dll"
  Delete "$INSTDIR\LibGeometry.pdb"
  Delete "$INSTDIR\LibGeometry.dll"
  Delete "$INSTDIR\LibEntity.pdb"
  Delete "$INSTDIR\LibEntity.dll"
  Delete "$INSTDIR\LibEncryptDecrypt.pdb"
  Delete "$INSTDIR\LibEncryptDecrypt.dll"
  Delete "$INSTDIR\LibDatabase.pdb"
  Delete "$INSTDIR\LibDatabase.dll"
  Delete "$INSTDIR\LibConfig.pdb"
  Delete "$INSTDIR\LibConfig.dll"
  Delete "$INSTDIR\LibCommonForm.pdb"
  Delete "$INSTDIR\LibCommonForm.dll"
  Delete "$INSTDIR\LibCommonControl.pdb"
  Delete "$INSTDIR\LibCommonControl.dll"
  Delete "$INSTDIR\LibCommon.pdb"
  Delete "$INSTDIR\LibCommon.dll.config"
  Delete "$INSTDIR\LibCommon.dll"
  Delete "$INSTDIR\LibBusiness.pdb"
  Delete "$INSTDIR\LibBusiness.dll"
  Delete "$INSTDIR\LibAbout.pdb"
  Delete "$INSTDIR\LibAbout.dll"
  Delete "$INSTDIR\K1Value.hbm.xml"
  Delete "$INSTDIR\ja\DevExpress.XtraScheduler.v14.1.Core.resources.dll"
  Delete "$INSTDIR\ja\DevExpress.XtraEditors.v14.1.resources.dll"
  Delete "$INSTDIR\ja\DevExpress.XtraBars.v14.1.resources.dll"
  Delete "$INSTDIR\ja\DevExpress.Utils.v14.1.resources.dll"
  Delete "$INSTDIR\ja\DevExpress.Data.v14.1.resources.dll"
  Delete "$INSTDIR\it-IT\AutoUpdater.NET.resources.dll"
  Delete "$INSTDIR\it\Castle.Components.Validator.resources.dll"
  Delete "$INSTDIR\Interop.SpeechLib.dll"
  Delete "$INSTDIR\Iesi.Collections.dll"
  Delete "$INSTDIR\Horizontal.hbm.xml"
  Delete "$INSTDIR\gis.xml"
  Delete "$INSTDIR\GIS.pdb"
  Delete "$INSTDIR\GIS.dll"
  Delete "$INSTDIR\GeologySpace.hbm.xml"
  Delete "$INSTDIR\GeologicStructure.hbm.xml"
  Delete "$INSTDIR\GasPressure.hbm.xml"
  Delete "$INSTDIR\GasGushQuantity.hbm.xml"
  Delete "$INSTDIR\GasData.hbm.xml"
  Delete "$INSTDIR\GasContent.hbm.xml"
  Delete "$INSTDIR\GasConcentrationProbeData.hbm.xml"
  Delete "$INSTDIR\fr\Castle.Components.Validator.resources.dll"
  Delete "$INSTDIR\FlashPoint\FlashPoint.shx"
  Delete "$INSTDIR\FlashPoint\FlashPoint.shp.xml"
  Delete "$INSTDIR\FlashPoint\FlashPoint.shp.LYF.12516.13204.sr.lock"
  Delete "$INSTDIR\FlashPoint\FlashPoint.shp"
  Delete "$INSTDIR\FlashPoint\FlashPoint.sbx"
  Delete "$INSTDIR\FlashPoint\FlashPoint.sbn"
  Delete "$INSTDIR\FlashPoint\FlashPoint.prj"
  Delete "$INSTDIR\FlashPoint\FlashPoint.dbf"
  Delete "$INSTDIR\Faultage.hbm.xml"
  Delete "$INSTDIR\FarPoint.Win.xml"
  Delete "$INSTDIR\FarPoint.Win.Spread.xml"
  Delete "$INSTDIR\FarPoint.Win.Spread.dll"
  Delete "$INSTDIR\FarPoint.Win.dll"
  Delete "$INSTDIR\ESRI.style"
  Delete "$INSTDIR\ESRI.ServerStyle"
  Delete "$INSTDIR\ESRI.ArcGIS.Version.dll"
  Delete "$INSTDIR\ESRI.ArcGIS.System.dll"
  Delete "$INSTDIR\ESRI.ArcGIS.Geoprocessor.dll"
  Delete "$INSTDIR\ESRI.ArcGIS.Geometry.dll"
  Delete "$INSTDIR\ESRI.ArcGIS.Geodatabase.dll"
  Delete "$INSTDIR\ESRI.ArcGIS.Display.dll"
  Delete "$INSTDIR\ESRI.ArcGIS.Controls.dll"
  Delete "$INSTDIR\ESRI.ArcGIS.Carto.dll"
  Delete "$INSTDIR\ESRI.ArcGIS.AxControls.dll"
  Delete "$INSTDIR\ESRI.ArcGIS.ADF.Local.dll"
  Delete "$INSTDIR\ESRI.ArcGIS.ADF.Connection.Local.dll"
  Delete "$INSTDIR\es\DevExpress.XtraScheduler.v14.1.Core.resources.dll"
  Delete "$INSTDIR\es\DevExpress.XtraEditors.v14.1.resources.dll"
  Delete "$INSTDIR\es\DevExpress.XtraBars.v14.1.resources.dll"
  Delete "$INSTDIR\es\DevExpress.Utils.v14.1.resources.dll"
  Delete "$INSTDIR\es\DevExpress.Data.v14.1.resources.dll"
  Delete "$INSTDIR\es\Castle.Components.Validator.resources.dll"
  Delete "$INSTDIR\DevExpress.XtraScheduler.v14.1.Core.xml"
  Delete "$INSTDIR\DevExpress.XtraScheduler.v14.1.Core.dll"
  Delete "$INSTDIR\DevExpress.XtraEditors.v14.1.xml"
  Delete "$INSTDIR\DevExpress.XtraEditors.v14.1.dll"
  Delete "$INSTDIR\DevExpress.XtraBars.v14.1.xml"
  Delete "$INSTDIR\DevExpress.XtraBars.v14.1.dll"
  Delete "$INSTDIR\DevExpress.Utils.v14.1.xml"
  Delete "$INSTDIR\DevExpress.Utils.v14.1.dll"
  Delete "$INSTDIR\DevExpress.Data.v14.1.xml"
  Delete "$INSTDIR\DevExpress.Data.v14.1.dll"
  Delete "$INSTDIR\Department.hbm.xml"
  Delete "$INSTDIR\DefaultUser"
  Delete "$INSTDIR\default.mxd"
  Delete "$INSTDIR\de\DevExpress.XtraScheduler.v14.1.Core.resources.dll"
  Delete "$INSTDIR\de\DevExpress.XtraEditors.v14.1.resources.dll"
  Delete "$INSTDIR\de\DevExpress.XtraBars.v14.1.resources.dll"
  Delete "$INSTDIR\de\DevExpress.Utils.v14.1.resources.dll"
  Delete "$INSTDIR\de\DevExpress.Data.v14.1.resources.dll"
  Delete "$INSTDIR\de\AutoUpdater.NET.resources.dll"
  Delete "$INSTDIR\DayReportJj.hbm.xml"
  Delete "$INSTDIR\DayReportHc.hbm.xml"
  Delete "$INSTDIR\da\AutoUpdater.NET.resources.dll"
  Delete "$INSTDIR\ConfigDatabaseGIS.ini"
  Delete "$INSTDIR\Config.ini"
  Delete "$INSTDIR\CollapsePillarsKeyPointEnt.hbm.xml"
  Delete "$INSTDIR\CollapsePillarsEnt.hbm.xml"
  Delete "$INSTDIR\CoalSeams.hbm.xml"
  Delete "$INSTDIR\CoalExistence.hbm.xml"
  Delete "$INSTDIR\Castle.Core.xml"
  Delete "$INSTDIR\Castle.Core.dll"
  Delete "$INSTDIR\Castle.Components.Validator.xml"
  Delete "$INSTDIR\Castle.Components.Validator.pdb"
  Delete "$INSTDIR\Castle.Components.Validator.dll"
  Delete "$INSTDIR\Castle.ActiveRecord.xml"
  Delete "$INSTDIR\Castle.ActiveRecord.Web.xml"
  Delete "$INSTDIR\Castle.ActiveRecord.Web.dll"
  Delete "$INSTDIR\Castle.ActiveRecord.dll"
  Delete "$INSTDIR\BoreholeLithology.hbm.xml"
  Delete "$INSTDIR\Borehole.hbm.xml"
  Delete "$INSTDIR\BigFaultagePoint.hbm.xml"
  Delete "$INSTDIR\BigFaultage.hbm.xml"
  Delete "$INSTDIR\AutoUpdater.NET.xml"
  Delete "$INSTDIR\AutoUpdater.NET.pdb"
  Delete "$INSTDIR\AutoUpdater.NET.dll"
  Delete "$INSTDIR\ARConfig.xml"
  Delete "$INSTDIR\app.publish\sys3.exe"
  Delete "$INSTDIR\Antlr3.Runtime.dll"

  Delete "$SMPROGRAMS\��˹�ֺ�Ԥ��ϵͳ\��������ʲ�������ϵͳ\Uninstall.lnk"
  Delete "$SMPROGRAMS\��˹�ֺ�Ԥ��ϵͳ\��������ʲ�������ϵͳ\Help.lnk"
  Delete "$DESKTOP\��������ʲ�������ϵͳ.lnk"
  Delete "$SMPROGRAMS\��˹�ֺ�Ԥ��ϵͳ\��������ʲ�������ϵͳ\��������ʲ�������ϵͳ.lnk"

  RMDir "$SMPROGRAMS\��˹�ֺ�Ԥ��ϵͳ\��������ʲ�������ϵͳ"
  RMDir "$INSTDIR\sv"
  RMDir "$INSTDIR\ru"
  RMDir "$INSTDIR\pt"
  RMDir "$INSTDIR\pl"
  RMDir "$INSTDIR\nl"
  RMDir "$INSTDIR\mk"
  RMDir "$INSTDIR\lv"
  RMDir "$INSTDIR\lt"
  RMDir "$INSTDIR\ja"
  RMDir "$INSTDIR\it-IT"
  RMDir "$INSTDIR\it"
  RMDir "$INSTDIR\fr"
  RMDir "$INSTDIR\FlashPoint"
  RMDir "$INSTDIR\es"
  RMDir "$INSTDIR\de"
  RMDir "$INSTDIR\da"
  RMDir "$INSTDIR\app.publish"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd