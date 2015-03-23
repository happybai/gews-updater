; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "工作面采掘进度管理系统"
!define PRODUCT_VERSION "0.1"
!define PRODUCT_PUBLISHER "煤科集团沈阳研究院有限公司"
!define PRODUCT_WEB_SITE "http://www.syccri.com"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\gacutil.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
!define PRODUCT_STARTMENU_REGVAL "NSIS:StartMenuDir"

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; nsDialogs
!include LogicLib.nsh
!include nsDialogs.nsh

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!insertmacro MUI_PAGE_LICENSE "C:\path\to\licence\YourSoftwareLicence.txt"
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

	${NSD_CreateLabel} 0 0 100% 12u "预警服务器IP地址"
	Pop $lbServerIP

	${NSD_CreateText} 0 13u 100% -128u "127.0.0.1"
	Pop $txtServerIP

        ${NSD_CreateLabel} 0 29u 100% 12u "数据库服务器实例"
	Pop $lbDbInstance

	${NSD_CreateText} 0 42u 100% -128u "(local)\SQL2008R2,1433"
	Pop $txtDbInstance

        ${NSD_CreateLabel} 0 58u 100% 12u "数据库名称"
	Pop $lbDbName

	${NSD_CreateText} 0 71u 100% -128u "GasWarningDatabase"
	Pop $txtDbName

	${NSD_CreateLabel} 0 87u 100% 12u "GIS数据库名称"
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

; Start menu page
var ICONS_GROUP
!define MUI_STARTMENUPAGE_NODISABLE
!define MUI_STARTMENUPAGE_DEFAULTFOLDER "瓦斯灾害预警系统\工作面采掘进度管理系统"
!define MUI_STARTMENUPAGE_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "${PRODUCT_STARTMENU_REGVAL}"

!insertmacro MUI_PAGE_STARTMENU Application $ICONS_GROUP
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!insertmacro MUI_PAGE_FINISH
; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES
; Language files
!insertmacro MUI_LANGUAGE "SimpChinese"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "gews_sys2_v0.1.exe"
InstallDir "$PROGRAMFILES\Gews\sys2"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Section "工作面采掘进度管理系统" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite try
  File "C:\gews\sys2\bin\Debug\Antlr3.Runtime.dll"
  File "C:\gews\sys2\bin\Debug\ARConfig.xml"
  File "C:\gews\sys2\bin\Debug\Castle.ActiveRecord.dll"
  File "C:\gews\sys2\bin\Debug\Castle.ActiveRecord.Web.dll"
  File "C:\gews\sys2\bin\Debug\Castle.ActiveRecord.Web.xml"
  File "C:\gews\sys2\bin\Debug\Castle.ActiveRecord.xml"
  File "C:\gews\sys2\bin\Debug\Castle.Components.Validator.dll"
  File "C:\gews\sys2\bin\Debug\Castle.Components.Validator.pdb"
  File "C:\gews\sys2\bin\Debug\Castle.Components.Validator.xml"
  File "C:\gews\sys2\bin\Debug\Castle.Core.dll"
  File "C:\gews\sys2\bin\Debug\Config.ini"
  File "C:\gews\sys2\bin\Debug\ConfigDatabaseGIS.ini"
  SetOutPath "$INSTDIR\de"
  File "C:\gews\sys2\bin\Debug\de\DevExpress.Data.v14.1.resources.dll"
  File "C:\gews\sys2\bin\Debug\de\DevExpress.Utils.v14.1.resources.dll"
  File "C:\gews\sys2\bin\Debug\de\DevExpress.XtraBars.v14.1.resources.dll"
  File "C:\gews\sys2\bin\Debug\de\DevExpress.XtraEditors.v14.1.resources.dll"
  SetOutPath "$INSTDIR"
  File "C:\gews\sys2\bin\Debug\default.mxd"
  File "C:\gews\sys2\bin\Debug\DefaultUser"
  File "C:\gews\sys2\bin\Debug\DevExpress.Data.v14.1.dll"
  File "C:\gews\sys2\bin\Debug\DevExpress.Data.v14.1.xml"
  File "C:\gews\sys2\bin\Debug\DevExpress.Utils.v14.1.dll"
  File "C:\gews\sys2\bin\Debug\DevExpress.Utils.v14.1.xml"
  File "C:\gews\sys2\bin\Debug\DevExpress.XtraBars.v14.1.dll"
  File "C:\gews\sys2\bin\Debug\DevExpress.XtraBars.v14.1.xml"
  File "C:\gews\sys2\bin\Debug\DevExpress.XtraEditors.v14.1.dll"
  File "C:\gews\sys2\bin\Debug\DevExpress.XtraEditors.v14.1.xml"
  SetOutPath "$INSTDIR\es"
  File "C:\gews\sys2\bin\Debug\es\Castle.Components.Validator.resources.dll"
  File "C:\gews\sys2\bin\Debug\es\DevExpress.Data.v14.1.resources.dll"
  File "C:\gews\sys2\bin\Debug\es\DevExpress.Utils.v14.1.resources.dll"
  File "C:\gews\sys2\bin\Debug\es\DevExpress.XtraBars.v14.1.resources.dll"
  File "C:\gews\sys2\bin\Debug\es\DevExpress.XtraEditors.v14.1.resources.dll"
  SetOutPath "$INSTDIR"
  File "C:\gews\sys2\bin\Debug\ESRI.ArcGIS.3DAnalyst.dll"
  File "C:\gews\sys2\bin\Debug\ESRI.ArcGIS.ADF.Local.dll"
  File "C:\gews\sys2\bin\Debug\ESRI.ArcGIS.AxControls.dll"
  File "C:\gews\sys2\bin\Debug\ESRI.ArcGIS.Carto.dll"
  File "C:\gews\sys2\bin\Debug\ESRI.ArcGIS.Controls.dll"
  File "C:\gews\sys2\bin\Debug\ESRI.ArcGIS.DisplayUI.dll"
  File "C:\gews\sys2\bin\Debug\ESRI.ArcGIS.Geodatabase.dll"
  File "C:\gews\sys2\bin\Debug\ESRI.ArcGIS.Geometry.dll"
  File "C:\gews\sys2\bin\Debug\ESRI.ArcGIS.GlobeCore.dll"
  File "C:\gews\sys2\bin\Debug\ESRI.ArcGIS.Output.dll"
  File "C:\gews\sys2\bin\Debug\ESRI.ArcGIS.Version.dll"
  File "C:\gews\sys2\bin\Debug\ESRI.ServerStyle"
  File "C:\gews\sys2\bin\Debug\ESRI.style"
  File "C:\gews\sys2\bin\Debug\FarPoint.CalcEngine.dll"
  File "C:\gews\sys2\bin\Debug\FarPoint.CalcEngine.xml"
  File "C:\gews\sys2\bin\Debug\FarPoint.Excel.dll"
  File "C:\gews\sys2\bin\Debug\FarPoint.Excel.xml"
  File "C:\gews\sys2\bin\Debug\FarPoint.PDF.dll"
  File "C:\gews\sys2\bin\Debug\FarPoint.PDF.xml"
  File "C:\gews\sys2\bin\Debug\FarPoint.PluginCalendar.WinForms.dll"
  File "C:\gews\sys2\bin\Debug\FarPoint.PluginCalendar.WinForms.xml"
  File "C:\gews\sys2\bin\Debug\FarPoint.Win.Chart.dll"
  File "C:\gews\sys2\bin\Debug\FarPoint.Win.Chart.xml"
  File "C:\gews\sys2\bin\Debug\FarPoint.Win.dll"
  File "C:\gews\sys2\bin\Debug\FarPoint.Win.Spread.dll"
  File "C:\gews\sys2\bin\Debug\FarPoint.Win.Spread.xml"
  File "C:\gews\sys2\bin\Debug\FarPoint.Win.xml"
  SetOutPath "$INSTDIR\FlashPoint"
  File "C:\gews\sys2\bin\Debug\FlashPoint\FlashPoint.dbf"
  File "C:\gews\sys2\bin\Debug\FlashPoint\FlashPoint.prj"
  File "C:\gews\sys2\bin\Debug\FlashPoint\FlashPoint.sbn"
  File "C:\gews\sys2\bin\Debug\FlashPoint\FlashPoint.sbx"
  File "C:\gews\sys2\bin\Debug\FlashPoint\FlashPoint.shp"
  File "C:\gews\sys2\bin\Debug\FlashPoint\FlashPoint.shp.LYF.12516.13204.sr.lock"
  File "C:\gews\sys2\bin\Debug\FlashPoint\FlashPoint.shp.xml"
  File "C:\gews\sys2\bin\Debug\FlashPoint\FlashPoint.shx"
  SetOutPath "$INSTDIR\fr"
  File "C:\gews\sys2\bin\Debug\fr\Castle.Components.Validator.resources.dll"
  SetOutPath "$INSTDIR"
  File "C:\gews\sys2\bin\Debug\GIS.dll"
  File "C:\gews\sys2\bin\Debug\GIS.pdb"
  File "C:\gews\sys2\bin\Debug\Iesi.Collections.dll"
  File "C:\gews\sys2\bin\Debug\Interop.SpeechLib.dll"
  SetOutPath "$INSTDIR\it"
  File "C:\gews\sys2\bin\Debug\it\Castle.Components.Validator.resources.dll"
  SetOutPath "$INSTDIR\ja"
  File "C:\gews\sys2\bin\Debug\ja\DevExpress.Data.v14.1.resources.dll"
  File "C:\gews\sys2\bin\Debug\ja\DevExpress.Utils.v14.1.resources.dll"
  File "C:\gews\sys2\bin\Debug\ja\DevExpress.XtraBars.v14.1.resources.dll"
  File "C:\gews\sys2\bin\Debug\ja\DevExpress.XtraEditors.v14.1.resources.dll"
  SetOutPath "$INSTDIR"
  File "C:\gews\sys2\bin\Debug\LibAbout.dll"
  File "C:\gews\sys2\bin\Debug\LibAbout.pdb"
  File "C:\gews\sys2\bin\Debug\LibBusiness.dll"
  File "C:\gews\sys2\bin\Debug\LibBusiness.pdb"
  File "C:\gews\sys2\bin\Debug\LibCommon.dll"
  File "C:\gews\sys2\bin\Debug\LibCommon.dll.config"
  File "C:\gews\sys2\bin\Debug\LibCommon.pdb"
  File "C:\gews\sys2\bin\Debug\LibCommonControl.dll"
  File "C:\gews\sys2\bin\Debug\LibCommonControl.pdb"
  File "C:\gews\sys2\bin\Debug\LibCommonForm.dll"
  File "C:\gews\sys2\bin\Debug\LibCommonForm.pdb"
  File "C:\gews\sys2\bin\Debug\LibConfig.dll"
  File "C:\gews\sys2\bin\Debug\LibConfig.pdb"
  File "C:\gews\sys2\bin\Debug\LibDatabase.dll"
  File "C:\gews\sys2\bin\Debug\LibDatabase.pdb"
  File "C:\gews\sys2\bin\Debug\LibEncryptDecrypt.dll"
  File "C:\gews\sys2\bin\Debug\LibEncryptDecrypt.pdb"
  File "C:\gews\sys2\bin\Debug\LibEntity.dll"
  File "C:\gews\sys2\bin\Debug\LibEntity.pdb"
  File "C:\gews\sys2\bin\Debug\LibGeometry.dll"
  File "C:\gews\sys2\bin\Debug\LibGeometry.pdb"
  File "C:\gews\sys2\bin\Debug\LibLoginForm.dll"
  File "C:\gews\sys2\bin\Debug\LibLoginForm.pdb"
  File "C:\gews\sys2\bin\Debug\LibPanels.dll"
  File "C:\gews\sys2\bin\Debug\LibPanels.pdb"
  File "C:\gews\sys2\bin\Debug\LibSocket.dll"
  File "C:\gews\sys2\bin\Debug\LibSocket.pdb"
  File "C:\gews\sys2\bin\Debug\LibXPorperty.dll"
  File "C:\gews\sys2\bin\Debug\LibXPorperty.pdb"
  File "C:\gews\sys2\bin\Debug\local.mxd"
  File "C:\gews\sys2\bin\Debug\log4net.dll"
  File "C:\gews\sys2\bin\Debug\LoginBackground.bmp"
  SetOutPath "$INSTDIR\lt"
  File "C:\gews\sys2\bin\Debug\lt\Castle.Components.Validator.resources.dll"
  SetOutPath "$INSTDIR\lv"
  File "C:\gews\sys2\bin\Debug\lv\Castle.Components.Validator.resources.dll"
  SetOutPath "$INSTDIR"
  File "C:\gews\sys2\bin\Debug\Microsoft.Office.Interop.Excel.dll"
  File "C:\gews\sys2\bin\Debug\Microsoft.Vbe.Interop.dll"
  SetOutPath "$INSTDIR\mk"
  File "C:\gews\sys2\bin\Debug\mk\Castle.Components.Validator.resources.dll"
  SetOutPath "$INSTDIR"
  File "C:\gews\sys2\bin\Debug\Newtonsoft.Json.dll"
  File "C:\gews\sys2\bin\Debug\NHibernate.ByteCode.Castle.dll"
  File "C:\gews\sys2\bin\Debug\NHibernate.ByteCode.Castle.xml"
  File "C:\gews\sys2\bin\Debug\NHibernate.dll"
  File "C:\gews\sys2\bin\Debug\NHibernate.Search.dll"
  File "C:\gews\sys2\bin\Debug\NHibernate.xml"
  File "C:\gews\sys2\bin\Debug\nini.dll"
  SetOutPath "$INSTDIR\nl"
  File "C:\gews\sys2\bin\Debug\nl\Castle.Components.Validator.resources.dll"
  SetOutPath "$INSTDIR"
  File "C:\gews\sys2\bin\Debug\office.dll"
  File "C:\gews\sys2\bin\Debug\PanelFormName.ini"
  SetOutPath "$INSTDIR\pl"
  File "C:\gews\sys2\bin\Debug\pl\Castle.Components.Validator.resources.dll"
  SetOutPath "$INSTDIR\pt"
  File "C:\gews\sys2\bin\Debug\pt\Castle.Components.Validator.resources.dll"
  SetOutPath "$INSTDIR"
  File "C:\gews\sys2\bin\Debug\Remotion.Data.Linq.dll"
  SetOutPath "$INSTDIR\ru"
  File "C:\gews\sys2\bin\Debug\ru\Castle.Components.Validator.resources.dll"
  File "C:\gews\sys2\bin\Debug\ru\DevExpress.Data.v14.1.resources.dll"
  File "C:\gews\sys2\bin\Debug\ru\DevExpress.Utils.v14.1.resources.dll"
  File "C:\gews\sys2\bin\Debug\ru\DevExpress.XtraBars.v14.1.resources.dll"
  File "C:\gews\sys2\bin\Debug\ru\DevExpress.XtraEditors.v14.1.resources.dll"
  SetOutPath "$INSTDIR\sv"
  File "C:\gews\sys2\bin\Debug\sv\Castle.Components.Validator.resources.dll"
  SetOutPath "$INSTDIR"
  File "C:\gews\sys2\bin\Debug\symbol.ServerStyle"
  File "C:\gews\sys2\bin\Debug\sys2.application"
  File "C:\gews\sys2\bin\Debug\sys2.exe"
  File "C:\gews\sys2\bin\Debug\sys2.exe.config"
  File "C:\gews\sys2\bin\Debug\sys2.exe.manifest"
  File "C:\gews\sys2\bin\Debug\sys2.pdb"
  File "C:\gews\sys2\bin\Debug\test.mdb"
  File "C:\gews\sys2\bin\Debug\UserInfo.ini"
  File "C:\gews\sys2\bin\Debug\_CurSkin.ini"
  File "C:\gews\sys2\bin\Debug\工作面采掘进度管理系统帮助文件.chm"
  File "C:\gews\sys2\bin\Debug\系统二关于图片.jpg"
  File "C:\gews\sys2\bin\Debug\综合柱状图.mxd"


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


; Shortcuts
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  CreateDirectory "$SMPROGRAMS\$ICONS_GROUP"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\工作面采掘进度管理系统.lnk" "$INSTDIR\sys2.exe"
  CreateShortCut "$DESKTOP\工作面采掘进度管理系统.lnk" "$INSTDIR\sys2.exe"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Help.lnk" "$INSTDIR\工作面采掘进度管理系统帮助文件.chm"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

Section -AdditionalIcons
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Uninstall.lnk" "$INSTDIR\uninst.exe"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\sys2.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\sys2.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd

Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) 已成功地从你的计算机移除。"
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "你确实要完全移除 $(^Name) ，其及所有的组件？" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  !insertmacro MUI_STARTMENU_GETFOLDER "Application" $ICONS_GROUP
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\综合柱状图.mxd"
  Delete "$INSTDIR\系统二关于图片.jpg"
  Delete "$INSTDIR\工作面采掘进度管理系统帮助文件.chm"
  Delete "$INSTDIR\_CurSkin.ini"
  Delete "$INSTDIR\UserInfo.ini"
  Delete "$INSTDIR\test.mdb"
  Delete "$INSTDIR\sys2.pdb"
  Delete "$INSTDIR\sys2.exe.manifest"
  Delete "$INSTDIR\sys2.exe.config"
  Delete "$INSTDIR\sys2.exe"
  Delete "$INSTDIR\sys2.application"
  Delete "$INSTDIR\symbol.ServerStyle"
  Delete "$INSTDIR\sv\Castle.Components.Validator.resources.dll"
  Delete "$INSTDIR\ru\DevExpress.XtraEditors.v14.1.resources.dll"
  Delete "$INSTDIR\ru\DevExpress.XtraBars.v14.1.resources.dll"
  Delete "$INSTDIR\ru\DevExpress.Utils.v14.1.resources.dll"
  Delete "$INSTDIR\ru\DevExpress.Data.v14.1.resources.dll"
  Delete "$INSTDIR\ru\Castle.Components.Validator.resources.dll"
  Delete "$INSTDIR\Remotion.Data.Linq.dll"
  Delete "$INSTDIR\pt\Castle.Components.Validator.resources.dll"
  Delete "$INSTDIR\pl\Castle.Components.Validator.resources.dll"
  Delete "$INSTDIR\PanelFormName.ini"
  Delete "$INSTDIR\office.dll"
  Delete "$INSTDIR\nl\Castle.Components.Validator.resources.dll"
  Delete "$INSTDIR\nini.dll"
  Delete "$INSTDIR\NHibernate.xml"
  Delete "$INSTDIR\NHibernate.Search.dll"
  Delete "$INSTDIR\NHibernate.dll"
  Delete "$INSTDIR\NHibernate.ByteCode.Castle.xml"
  Delete "$INSTDIR\NHibernate.ByteCode.Castle.dll"
  Delete "$INSTDIR\Newtonsoft.Json.dll"
  Delete "$INSTDIR\mk\Castle.Components.Validator.resources.dll"
  Delete "$INSTDIR\Microsoft.Vbe.Interop.dll"
  Delete "$INSTDIR\Microsoft.Office.Interop.Excel.dll"
  Delete "$INSTDIR\lv\Castle.Components.Validator.resources.dll"
  Delete "$INSTDIR\lt\Castle.Components.Validator.resources.dll"
  Delete "$INSTDIR\LoginBackground.bmp"
  Delete "$INSTDIR\log4net.dll"
  Delete "$INSTDIR\local.mxd"
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
  Delete "$INSTDIR\ja\DevExpress.XtraEditors.v14.1.resources.dll"
  Delete "$INSTDIR\ja\DevExpress.XtraBars.v14.1.resources.dll"
  Delete "$INSTDIR\ja\DevExpress.Utils.v14.1.resources.dll"
  Delete "$INSTDIR\ja\DevExpress.Data.v14.1.resources.dll"
  Delete "$INSTDIR\it\Castle.Components.Validator.resources.dll"
  Delete "$INSTDIR\Interop.SpeechLib.dll"
  Delete "$INSTDIR\Iesi.Collections.dll"
  Delete "$INSTDIR\GIS.pdb"
  Delete "$INSTDIR\GIS.dll"
  Delete "$INSTDIR\fr\Castle.Components.Validator.resources.dll"
  Delete "$INSTDIR\FlashPoint\FlashPoint.shx"
  Delete "$INSTDIR\FlashPoint\FlashPoint.shp.xml"
  Delete "$INSTDIR\FlashPoint\FlashPoint.shp.LYF.12516.13204.sr.lock"
  Delete "$INSTDIR\FlashPoint\FlashPoint.shp"
  Delete "$INSTDIR\FlashPoint\FlashPoint.sbx"
  Delete "$INSTDIR\FlashPoint\FlashPoint.sbn"
  Delete "$INSTDIR\FlashPoint\FlashPoint.prj"
  Delete "$INSTDIR\FlashPoint\FlashPoint.dbf"
  Delete "$INSTDIR\FarPoint.Win.xml"
  Delete "$INSTDIR\FarPoint.Win.Spread.xml"
  Delete "$INSTDIR\FarPoint.Win.Spread.dll"
  Delete "$INSTDIR\FarPoint.Win.dll"
  Delete "$INSTDIR\FarPoint.Win.Chart.xml"
  Delete "$INSTDIR\FarPoint.Win.Chart.dll"
  Delete "$INSTDIR\FarPoint.PluginCalendar.WinForms.xml"
  Delete "$INSTDIR\FarPoint.PluginCalendar.WinForms.dll"
  Delete "$INSTDIR\FarPoint.PDF.xml"
  Delete "$INSTDIR\FarPoint.PDF.dll"
  Delete "$INSTDIR\FarPoint.Excel.xml"
  Delete "$INSTDIR\FarPoint.Excel.dll"
  Delete "$INSTDIR\FarPoint.CalcEngine.xml"
  Delete "$INSTDIR\FarPoint.CalcEngine.dll"
  Delete "$INSTDIR\ESRI.style"
  Delete "$INSTDIR\ESRI.ServerStyle"
  Delete "$INSTDIR\ESRI.ArcGIS.Version.dll"
  Delete "$INSTDIR\ESRI.ArcGIS.Output.dll"
  Delete "$INSTDIR\ESRI.ArcGIS.GlobeCore.dll"
  Delete "$INSTDIR\ESRI.ArcGIS.Geometry.dll"
  Delete "$INSTDIR\ESRI.ArcGIS.Geodatabase.dll"
  Delete "$INSTDIR\ESRI.ArcGIS.DisplayUI.dll"
  Delete "$INSTDIR\ESRI.ArcGIS.Controls.dll"
  Delete "$INSTDIR\ESRI.ArcGIS.Carto.dll"
  Delete "$INSTDIR\ESRI.ArcGIS.AxControls.dll"
  Delete "$INSTDIR\ESRI.ArcGIS.ADF.Local.dll"
  Delete "$INSTDIR\ESRI.ArcGIS.3DAnalyst.dll"
  Delete "$INSTDIR\es\DevExpress.XtraEditors.v14.1.resources.dll"
  Delete "$INSTDIR\es\DevExpress.XtraBars.v14.1.resources.dll"
  Delete "$INSTDIR\es\DevExpress.Utils.v14.1.resources.dll"
  Delete "$INSTDIR\es\DevExpress.Data.v14.1.resources.dll"
  Delete "$INSTDIR\es\Castle.Components.Validator.resources.dll"
  Delete "$INSTDIR\DevExpress.XtraEditors.v14.1.xml"
  Delete "$INSTDIR\DevExpress.XtraEditors.v14.1.dll"
  Delete "$INSTDIR\DevExpress.XtraBars.v14.1.xml"
  Delete "$INSTDIR\DevExpress.XtraBars.v14.1.dll"
  Delete "$INSTDIR\DevExpress.Utils.v14.1.xml"
  Delete "$INSTDIR\DevExpress.Utils.v14.1.dll"
  Delete "$INSTDIR\DevExpress.Data.v14.1.xml"
  Delete "$INSTDIR\DevExpress.Data.v14.1.dll"
  Delete "$INSTDIR\DefaultUser"
  Delete "$INSTDIR\default.mxd"
  Delete "$INSTDIR\de\DevExpress.XtraEditors.v14.1.resources.dll"
  Delete "$INSTDIR\de\DevExpress.XtraBars.v14.1.resources.dll"
  Delete "$INSTDIR\de\DevExpress.Utils.v14.1.resources.dll"
  Delete "$INSTDIR\de\DevExpress.Data.v14.1.resources.dll"
  Delete "$INSTDIR\ConfigDatabaseGIS.ini"
  Delete "$INSTDIR\Config.ini"
  Delete "$INSTDIR\Castle.Core.dll"
  Delete "$INSTDIR\Castle.Components.Validator.xml"
  Delete "$INSTDIR\Castle.Components.Validator.pdb"
  Delete "$INSTDIR\Castle.Components.Validator.dll"
  Delete "$INSTDIR\Castle.ActiveRecord.xml"
  Delete "$INSTDIR\Castle.ActiveRecord.Web.xml"
  Delete "$INSTDIR\Castle.ActiveRecord.Web.dll"
  Delete "$INSTDIR\Castle.ActiveRecord.dll"
  Delete "$INSTDIR\ARConfig.xml"
  Delete "$INSTDIR\Antlr3.Runtime.dll"

  Delete "$SMPROGRAMS\$ICONS_GROUP\Uninstall.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\Help.lnk"
  Delete "$DESKTOP\工作面采掘进度管理系统.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\工作面采掘进度管理系统.lnk"

  RMDir "$SMPROGRAMS\$ICONS_GROUP"
  RMDir "$INSTDIR\sv"
  RMDir "$INSTDIR\ru"
  RMDir "$INSTDIR\pt"
  RMDir "$INSTDIR\pl"
  RMDir "$INSTDIR\nl"
  RMDir "$INSTDIR\mk"
  RMDir "$INSTDIR\lv"
  RMDir "$INSTDIR\lt"
  RMDir "$INSTDIR\ja"
  RMDir "$INSTDIR\it"
  RMDir "$INSTDIR\fr"
  RMDir "$INSTDIR\FlashPoint"
  RMDir "$INSTDIR\es"
  RMDir "$INSTDIR\de"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd