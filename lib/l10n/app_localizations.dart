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

  /// Main welcome text on onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// Subtitle on language selection screen
  ///
  /// In en, this message translates to:
  /// **'Choose a language to get started'**
  String get selectLanguage;

  /// Language section label
  ///
  /// In en, this message translates to:
  /// **'LANGUAGE'**
  String get language;

  /// Button text to start scanning table QR code
  ///
  /// In en, this message translates to:
  /// **'Scan Table'**
  String get startScan;

  /// Snackbar message when scanned menu/table is not found
  ///
  /// In en, this message translates to:
  /// **'Menu not found'**
  String get menuNotFound;

  /// Formatted price text
  ///
  /// In en, this message translates to:
  /// **'{amount}\$'**
  String price(String amount);

  /// Title on QR scanner screen
  ///
  /// In en, this message translates to:
  /// **'Scan the table QR code'**
  String get scanTitle;

  /// Instruction text for scanning QR code
  ///
  /// In en, this message translates to:
  /// **'Point your camera at the QR code\nplaced on your table'**
  String get scanSubtitle;

  /// Bottom navigation menu tab
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get navMenu;

  /// Bottom navigation order tab
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get navOrder;

  /// Bottom navigation cart tab
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get navCart;

  /// Button text to add item to cart
  ///
  /// In en, this message translates to:
  /// **'Add to Cart · {price}\$'**
  String addToCart(String price);

  /// Option selection limit text
  ///
  /// In en, this message translates to:
  /// **'Choose {count}'**
  String chooseUpTo(int count);

  /// Required section label
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// Optional section label
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get optional;

  /// Title when menu data is empty
  ///
  /// In en, this message translates to:
  /// **'No Menu Available'**
  String get noMenuAvailable;

  /// Subtitle when menu data is empty
  ///
  /// In en, this message translates to:
  /// **'There are currently no menu items to display. Please check again later.'**
  String get noMenuSubtitle;

  /// Generic error title
  ///
  /// In en, this message translates to:
  /// **'Something Went Wrong'**
  String get errorTitle;

  /// Generic error subtitle
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred. Please try again.'**
  String get errorSubtitle;

  /// Retry button text
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// Order status page title
  ///
  /// In en, this message translates to:
  /// **'Order Status'**
  String get orderStatusTitle;

  /// Title when user has no active orders
  ///
  /// In en, this message translates to:
  /// **'No Active Orders'**
  String get orderNoActiveTitle;

  /// Subtitle when user has no active orders
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any active orders at the moment. Your order status will appear here once you place an order.'**
  String get orderNoActiveSubtitle;

  /// Title shown when loading order fails
  ///
  /// In en, this message translates to:
  /// **'Failed to Load Order'**
  String get orderFailedTitle;

  /// Subtitle shown when loading order fails
  ///
  /// In en, this message translates to:
  /// **'We were unable to retrieve your order status. Please try again.'**
  String get orderFailedSubtitle;

  /// Estimated preparation time label
  ///
  /// In en, this message translates to:
  /// **'Estimated Time'**
  String get estimatedTime;

  /// Estimated preparation time in minutes
  ///
  /// In en, this message translates to:
  /// **'{minutes} minutes'**
  String estimatedTimeMinutes(int minutes);

  /// Order number label
  ///
  /// In en, this message translates to:
  /// **'Order Number'**
  String get orderNumber;

  /// User orders section title
  ///
  /// In en, this message translates to:
  /// **'Your Orders'**
  String get yourOrders;

  /// Total items count
  ///
  /// In en, this message translates to:
  /// **'{count} items'**
  String totalItems(int count);

  /// Item quantity text
  ///
  /// In en, this message translates to:
  /// **'{qty}x'**
  String itemQty(int qty);

  /// Table number title on cart page
  ///
  /// In en, this message translates to:
  /// **'Table {number}'**
  String cartTableTitle(int number);

  /// Customer note label
  ///
  /// In en, this message translates to:
  /// **'Customer Note:'**
  String get customerNote;

  /// Placeholder for customer note input
  ///
  /// In en, this message translates to:
  /// **'leave a note..'**
  String get customerNotePlaceholder;

  /// Cart total label
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get cartTotal;

  /// Checkout button text
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// Checkout confirmation dialog content
  ///
  /// In en, this message translates to:
  /// **'Once an order has been placed, it cannot be changed. Please make sure to confirm your order correctly.'**
  String get checkoutConfirmContent;

  /// Checkout failed error message
  ///
  /// In en, this message translates to:
  /// **'Checkout failed'**
  String get checkoutFailed;

  /// Confirmation text for removing cart item
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove this item from your shopping cart?'**
  String get removeItemContent;

  /// Delete button text
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Cancel button text
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Title for note modal
  ///
  /// In en, this message translates to:
  /// **'Add a note'**
  String get modalNoteTitle;

  /// Subtitle for note modal
  ///
  /// In en, this message translates to:
  /// **'Let us know your preferences'**
  String get modalNoteSubtitle;

  /// Hint text for note input
  ///
  /// In en, this message translates to:
  /// **'e.g. no onions, extra spicy, allergy info...'**
  String get modalNoteHint;

  /// Save note button text
  ///
  /// In en, this message translates to:
  /// **'Save note'**
  String get saveNote;

  /// Pending order status title
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get orderStatusPendingTitle;

  /// Pending order status description
  ///
  /// In en, this message translates to:
  /// **'Waiting for restaurant confirmation'**
  String get orderStatusPendingSubtitle;

  /// Confirmed order status title
  ///
  /// In en, this message translates to:
  /// **'Confirmed'**
  String get orderStatusConfirmedTitle;

  /// Confirmed order status description
  ///
  /// In en, this message translates to:
  /// **'Your order has been confirmed'**
  String get orderStatusConfirmedSubtitle;

  /// Preparing order status title
  ///
  /// In en, this message translates to:
  /// **'Preparing'**
  String get orderStatusPreparingTitle;

  /// Preparing order status description
  ///
  /// In en, this message translates to:
  /// **'Chef is preparing your order'**
  String get orderStatusPreparingSubtitle;

  /// Ready order status title
  ///
  /// In en, this message translates to:
  /// **'Ready'**
  String get orderStatusReadyTitle;

  /// Ready order status description
  ///
  /// In en, this message translates to:
  /// **'Your order is ready to serve'**
  String get orderStatusReadySubtitle;

  /// Served order status title
  ///
  /// In en, this message translates to:
  /// **'Served'**
  String get orderStatusServedTitle;

  /// Served order status description
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
