import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh'),
  ];

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose your language'**
  String get selectLanguage;

  /// No description provided for @startScan.
  ///
  /// In en, this message translates to:
  /// **'Scan Table'**
  String get startScan;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'{amount}\$'**
  String price(String amount);

  /// No description provided for @scanTitle.
  ///
  /// In en, this message translates to:
  /// **'Scan the table QR code'**
  String get scanTitle;

  /// No description provided for @scanSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Point your camera at the QR code\nplaced on your table'**
  String get scanSubtitle;

  /// No description provided for @navMenu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get navMenu;

  /// No description provided for @navOrder.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get navOrder;

  /// No description provided for @navCart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get navCart;

  /// No description provided for @addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart · {price}\$'**
  String addToCart(String price);

  /// No description provided for @chooseUpTo.
  ///
  /// In en, this message translates to:
  /// **'Choose {count}'**
  String chooseUpTo(int count);

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// No description provided for @optional.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get optional;

  /// No description provided for @noMenuAvailable.
  ///
  /// In en, this message translates to:
  /// **'No Menu Available'**
  String get noMenuAvailable;

  /// No description provided for @noMenuSubtitle.
  ///
  /// In en, this message translates to:
  /// **'There are currently no menu items to display. Please check again later.'**
  String get noMenuSubtitle;

  /// No description provided for @errorTitle.
  ///
  /// In en, this message translates to:
  /// **'Something Went Wrong'**
  String get errorTitle;

  /// No description provided for @errorSubtitle.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred. Please try again.'**
  String get errorSubtitle;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// No description provided for @orderStatusTitle.
  ///
  /// In en, this message translates to:
  /// **'Order Status'**
  String get orderStatusTitle;

  /// No description provided for @orderNoActiveTitle.
  ///
  /// In en, this message translates to:
  /// **'No Active Orders'**
  String get orderNoActiveTitle;

  /// No description provided for @orderNoActiveSubtitle.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any active orders at the moment. Your order status will appear here once you place an order.'**
  String get orderNoActiveSubtitle;

  /// No description provided for @orderFailedTitle.
  ///
  /// In en, this message translates to:
  /// **'Failed to Load Order'**
  String get orderFailedTitle;

  /// No description provided for @orderFailedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We were unable to retrieve your order status. Please try again.'**
  String get orderFailedSubtitle;

  /// No description provided for @estimatedTime.
  ///
  /// In en, this message translates to:
  /// **'Estimated Time'**
  String get estimatedTime;

  /// No description provided for @estimatedTimeMinutes.
  ///
  /// In en, this message translates to:
  /// **'{minutes} minutes'**
  String estimatedTimeMinutes(int minutes);

  /// No description provided for @orderNumber.
  ///
  /// In en, this message translates to:
  /// **'Order Number'**
  String get orderNumber;

  /// No description provided for @yourOrders.
  ///
  /// In en, this message translates to:
  /// **'Your Orders'**
  String get yourOrders;

  /// No description provided for @totalItems.
  ///
  /// In en, this message translates to:
  /// **'{count} items'**
  String totalItems(int count);

  /// No description provided for @itemQty.
  ///
  /// In en, this message translates to:
  /// **'{qty}x'**
  String itemQty(int qty);

  /// No description provided for @cartTableTitle.
  ///
  /// In en, this message translates to:
  /// **'Table {number}'**
  String cartTableTitle(int number);

  /// No description provided for @customerNote.
  ///
  /// In en, this message translates to:
  /// **'Customer Note:'**
  String get customerNote;

  /// No description provided for @customerNotePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'leave a note..'**
  String get customerNotePlaceholder;

  /// No description provided for @cartTotal.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get cartTotal;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @checkoutConfirmContent.
  ///
  /// In en, this message translates to:
  /// **'Once an order has been placed, it cannot be changed. Please make sure to confirm your order correctly.'**
  String get checkoutConfirmContent;

  /// No description provided for @checkoutFailed.
  ///
  /// In en, this message translates to:
  /// **'Checkout failed'**
  String get checkoutFailed;

  /// No description provided for @removeItemContent.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove this item from your shopping cart?'**
  String get removeItemContent;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @modalNoteTitle.
  ///
  /// In en, this message translates to:
  /// **'Add a note'**
  String get modalNoteTitle;

  /// No description provided for @modalNoteSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Let us know your preferences'**
  String get modalNoteSubtitle;

  /// No description provided for @modalNoteHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. no onions, extra spicy, allergy info...'**
  String get modalNoteHint;

  /// No description provided for @saveNote.
  ///
  /// In en, this message translates to:
  /// **'Save note'**
  String get saveNote;

  /// No description provided for @orderStatusPendingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Waiting for restaurant confirmation'**
  String get orderStatusPendingSubtitle;

  /// No description provided for @orderStatusConfirmedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your order has been confirmed'**
  String get orderStatusConfirmedSubtitle;

  /// No description provided for @orderStatusPreparingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Chef is preparing your order'**
  String get orderStatusPreparingSubtitle;

  /// No description provided for @orderStatusReadySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your order is ready to serve'**
  String get orderStatusReadySubtitle;

  /// No description provided for @orderStatusServedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enjoy your meal'**
  String get orderStatusServedSubtitle;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
