adb install TeatroTvBrowser.apk && \
adb shell am start -n "com.iwedia.teatro.teatrotvbrowser/com.iwedia.teatro.teatrotvbrowser.TeatroTvBrowserMain" \
  --es url "https://ytlr-cert.appspot.com/latest/main.html?&test_type=encryptedmedia-test#1640094194374" && \
adb logcat -c && \
adb logcat > ~/syrmia/teatro/log.txt