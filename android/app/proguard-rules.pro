# Flutter
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# SLF4J fix
-dontwarn org.slf4j.**

# Google Play Core (Flutter deferred components)
-dontwarn com.google.android.play.core.**
-keep class com.google.android.play.core.** { *; }