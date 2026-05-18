// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get welcome => '欢迎';

  @override
  String get selectLanguage => '选择一种语言开始使用';

  @override
  String get language => '语言';

  @override
  String get startScan => '扫描桌台';

  @override
  String get menuNotFound => '未找到菜单';

  @override
  String price(String amount) {
    return '$amount\$';
  }

  @override
  String get scanTitle => '扫描桌台二维码';

  @override
  String get scanSubtitle => '将相机对准桌台上的二维码';

  @override
  String get navMenu => '菜单';

  @override
  String get navOrder => '订单';

  @override
  String get navCart => '购物车';

  @override
  String addToCart(String price) {
    return '加入购物车 · $price\$';
  }

  @override
  String chooseUpTo(int count) {
    return '选择 $count';
  }

  @override
  String get required => '必选';

  @override
  String get optional => '可选';

  @override
  String get noMenuAvailable => '暂无菜单';

  @override
  String get noMenuSubtitle => '目前没有可显示的菜单，请稍后再试。';

  @override
  String get errorTitle => '出现错误';

  @override
  String get errorSubtitle => '发生意外错误，请重试。';

  @override
  String get tryAgain => '重试';

  @override
  String get orderStatusTitle => '订单状态';

  @override
  String get orderNoActiveTitle => '暂无订单';

  @override
  String get orderNoActiveSubtitle => '您目前没有进行中的订单。下单后，您的订单状态将显示在这里。';

  @override
  String get orderFailedTitle => '订单加载失败';

  @override
  String get orderFailedSubtitle => '无法获取您的订单状态，请重试。';

  @override
  String get estimatedTime => '预计时间';

  @override
  String estimatedTimeMinutes(int minutes) {
    return '$minutes 分钟';
  }

  @override
  String get orderNumber => '订单号';

  @override
  String get yourOrders => '您的订单';

  @override
  String totalItems(int count) {
    return '$count 件商品';
  }

  @override
  String itemQty(int qty) {
    return '${qty}x';
  }

  @override
  String cartTableTitle(int number) {
    return '桌号 $number';
  }

  @override
  String get customerNote => '顾客备注：';

  @override
  String get customerNotePlaceholder => '留下备注..';

  @override
  String get cartTotal => '合计';

  @override
  String get checkout => '结账';

  @override
  String get checkoutConfirmContent => '订单提交后将无法更改，请确认您的订单无误。';

  @override
  String get checkoutFailed => '结账失败';

  @override
  String get removeItemContent => '您确定要从购物车中移除此商品吗？';

  @override
  String get delete => '删除';

  @override
  String get cancel => '取消';

  @override
  String get modalNoteTitle => '添加备注';

  @override
  String get modalNoteSubtitle => '告诉我们您的偏好';

  @override
  String get modalNoteHint => '例如：不要洋葱、加辣、过敏信息...';

  @override
  String get saveNote => '保存备注';

  @override
  String get orderStatusPendingTitle => '待确认';

  @override
  String get orderStatusPendingSubtitle => '等待餐厅确认';

  @override
  String get orderStatusConfirmedTitle => '已确认';

  @override
  String get orderStatusConfirmedSubtitle => '您的订单已确认';

  @override
  String get orderStatusPreparingTitle => '准备中';

  @override
  String get orderStatusPreparingSubtitle => '厨师正在准备您的餐点';

  @override
  String get orderStatusReadyTitle => '已完成';

  @override
  String get orderStatusReadySubtitle => '您的餐点已准备好，即将上桌';

  @override
  String get orderStatusServedTitle => '已上桌';

  @override
  String get orderStatusServedSubtitle => '请慢用';
}
