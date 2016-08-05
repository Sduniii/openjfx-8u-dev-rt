echo Copying Forwarding Headers...
@rem %1 argument is used for graphics. It can be cg or cairo
@rem %2 argument is used for network. It can be cf or curl

@mkdir 2>NUL "%CONFIGURATIONBUILDDIR%\include\private\WebCore"
@mkdir 2>NUL "%CONFIGURATIONBUILDDIR%\include\WebCore"
@mkdir 2>NUL "%CONFIGURATIONBUILDDIR%\include\WebCore\ForwardingHeaders"
@mkdir 2>NUL "%CONFIGURATIONBUILDDIR%\include\WebCore\ForwardingHeaders\bindings"
@mkdir 2>NUL "%CONFIGURATIONBUILDDIR%\include\WebCore\ForwardingHeaders\parser"
@mkdir 2>NUL "%CONFIGURATIONBUILDDIR%\include\WebCore\ForwardingHeaders\runtime"
@mkdir 2>NUL "%CONFIGURATIONBUILDDIR%\include\WebCore\ForwardingHeaders\masm"
@mkdir 2>NUL "%CONFIGURATIONBUILDDIR%\include\WebCore\ForwardingHeaders\profiler"
@mkdir 2>NUL "%CONFIGURATIONBUILDDIR%\include\WebCore\ForwardingHeaders\heap"
@mkdir 2>NUL "%CONFIGURATIONBUILDDIR%\include\WebCore\ForwardingHeaders\inspector"
@mkdir 2>NUL "%CONFIGURATIONBUILDDIR%\include\WebCore\ForwardingHeaders\interpreter"
@mkdir 2>NUL "%CONFIGURATIONBUILDDIR%\include\WebCore\ForwardingHeaders\yarr"
@mkdir 2>NUL "%CONFIGURATIONBUILDDIR%\include\WebCoreTestSupport"

@xcopy /y /d "%ProjectDir%..\config.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%CONFIGURATIONBUILDDIR%\obj%PlatformArchitecture%\WebCore\DerivedSources\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\Modules\filesystem\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\Modules\gamepad\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\Modules\geolocation\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\Modules\indexeddb\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\Modules\mediacontrols\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\Modules\mediasource\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\Modules\navigatorcontentutils\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\Modules\notifications\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\Modules\quota\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\Modules\webdatabase\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\Modules\websockets\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\accessibility\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\accessibility\win\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\inspector\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\loader\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\loader\appcache\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\loader\archive\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\loader\archive\cf\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\loader\cache\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\loader\icon\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\history\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\history\cf\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\html\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\html\forms\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\html\parser\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\html\shadow\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\html\track\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\css\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\platform\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\platform\animation\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\platform\audio\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\platform\cf\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\platform\cf\win\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\platform\graphics\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\platform\graphics\%1\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\platform\graphics\filters\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\platform\graphics\transforms\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\platform\graphics\ca\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\platform\graphics\ca\win\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\platform\graphics\gstreamer\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\platform\graphics\win\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\platform\graphics\win\%1\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\platform\graphics\opentype\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\platform\graphics\opengl\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\platform\graphics\texmap\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\platform\mock\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\platform\text\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\platform\text\icu\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\platform\text\transcoder\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\platform\win\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\platform\network\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\platform\network\%2\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\platform\spi\cg\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\platform\sql\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\platform\cairo\cairo\src\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\bindings\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\bindings\generic\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\bindings\js\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\page\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\page\scrolling\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\page\animation\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\page\win\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\bridge\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\bridge\c\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\bridge\jsc\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\plugins\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\plugins\win\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\rendering\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\rendering\line\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\rendering\style\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\rendering\shapes\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\rendering\svg\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\editing\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\dom\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\xml\parser\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>null
@xcopy /y /d "%ProjectDir%..\xml\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\svg\animation\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\svg\graphics\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\svg\properties\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\svg\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\storage\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\style\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\workers\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\ForwardingHeaders\bindings\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore\ForwardingHeaders\bindings" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\ForwardingHeaders\parser\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore\ForwardingHeaders\parser" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\ForwardingHeaders\runtime\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore\ForwardingHeaders\runtime" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\ForwardingHeaders\masm\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore\ForwardingHeaders\masm" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\ForwardingHeaders\profiler\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore\ForwardingHeaders\profiler" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\ForwardingHeaders\heap\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore\ForwardingHeaders\heap" >nul 2>nul
@xcopy /y /d "%ProjectDir%..\ForwardingHeaders\inspector\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore\ForwardingHeaders\inspector" >nul  2>nul
@xcopy /y /d "%ProjectDir%..\ForwardingHeaders\interpreter\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore\ForwardingHeaders\interpreter" >nul  2>nul
@xcopy /y /d "%ProjectDir%..\ForwardingHeaders\yarr\*.h" "%CONFIGURATIONBUILDDIR%\include\WebCore\ForwardingHeaders\yarr" >nul 2>nul

@xcopy /y /d "%ProjectDir%..\testing\js\WebCoreTestSupport.h" "%CONFIGURATIONBUILDDIR%\include\WebCoreTestSupport" >nul 2>nul

@set DerivedSourcesDirectory=%CONFIGURATIONBUILDDIR%\obj%PlatformArchitecture%\WebCore\DerivedSources
@set PrivateHeadersDirectory=%CONFIGURATIONBUILDDIR%\include\private\WebCore

@if exist "%CONFIGURATIONBUILDDIR%\buildfailed" del "%CONFIGURATIONBUILDDIR%\buildfailed"
