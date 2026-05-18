// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcome => 'Welcome';

  @override
  String get selectLanguage => 'Choose a language to get started';

  @override
  String get language => 'LANGUAGE';

  @override
  String get startScan => 'Scan Table';

  @override
  String price(String amount) {
    return '$amount\$';
  }

  @override
  String get scanTitle => 'Scan the table QR code';

  @override
  String get scanSubtitle =>
      'Point your camera at the QR code\nplaced on your table';

  @override
  String get navMenu => 'Menu';

  @override
  String get navOrder => 'Order';

  @override
  String get navCart => 'Cart';

  @override
  String addToCart(String price) {
    return 'Add to Cart · $price\$';
  }

  @override
  String chooseUpTo(int count) {
    return 'Choose $count';
  }

  @override
  String get required => 'Required';

  @override
  String get optional => 'Optional';

  @override
  String get noMenuAvailable => 'No Menu Available';

  @override
  String get noMenuSubtitle =>
      'There are currently no menu items to display. Please check again later.';

  @override
  String get errorTitle => 'Something Went Wrong';

  @override
  String get errorSubtitle => 'An unexpected error occurred. Please try again.';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get orderStatusTitle => 'Order Status';

  @override
  String get orderNoActiveTitle => 'No Active Orders';

  @override
  String get orderNoActiveSubtitle =>
      'You don\'t have any active orders at the moment. Your order status will appear here once you place an order.';

  @override
  String get orderFailedTitle => 'Failed to Load Order';

  @override
  String get orderFailedSubtitle =>
      'We were unable to retrieve your order status. Please try again.';

  @override
  String get estimatedTime => 'Estimated Time';

  @override
  String estimatedTimeMinutes(int minutes) {
    return '$minutes minutes';
  }

  @override
  String get orderNumber => 'Order Number';

  @override
  String get yourOrders => 'Your Orders';

  @override
  String totalItems(int count) {
    return '$count items';
  }

  @override
  String itemQty(int qty) {
    return '${qty}x';
  }

  @override
  String cartTableTitle(int number) {
    return 'Table $number';
  }

  @override
  String get customerNote => 'Customer Note:';

  @override
  String get customerNotePlaceholder => 'leave a note..';

  @override
  String get cartTotal => 'Total';

  @override
  String get checkout => 'Checkout';

  @override
  String get checkoutConfirmContent =>
      'Once an order has been placed, it cannot be changed. Please make sure to confirm your order correctly.';

  @override
  String get checkoutFailed => 'Checkout failed';

  @override
  String get removeItemContent =>
      'Are you sure you want to remove this item from your shopping cart?';

  @override
  String get delete => 'Delete';

  @override
  String get cancel => 'Cancel';

  @override
  String get modalNoteTitle => 'Add a note';

  @override
  String get modalNoteSubtitle => 'Let us know your preferences';

  @override
  String get modalNoteHint => 'e.g. no onions, extra spicy, allergy info...';

  @override
  String get saveNote => 'Save note';

  @override
  String get orderStatusPendingSubtitle =>
      'Waiting for restaurant confirmation';

  @override
  String get orderStatusConfirmedSubtitle => 'Your order has been confirmed';

  @override
  String get orderStatusPreparingSubtitle => 'Chef is preparing your order';

  @override
  String get orderStatusReadySubtitle => 'Your order is ready to serve';

  @override
  String get orderStatusServedSubtitle => 'Enjoy your meal';
}
