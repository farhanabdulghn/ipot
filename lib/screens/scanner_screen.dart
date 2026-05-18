import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ipot/components/buttons/app_icon_button.dart';
import 'package:ipot/components/loadings/loading.dart';
import 'package:ipot/extensions/extensions.dart';
import 'package:ipot/l10n/app_localizations.dart';
import 'package:ipot/screens/main_frame_screen.dart';
import 'package:ipot/state/actions/table/table_state.dart';
import 'package:ipot/state/stores/cart/cart_notifier.dart';
import 'package:ipot/utils/app_route_annotation.dart';
import 'package:ipot/utils/enums.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

@AutoRoute()
class ScannerScreen extends ConsumerStatefulWidget {
  const ScannerScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends ConsumerState<ScannerScreen>
    with SingleTickerProviderStateMixin {
  final _controller = MobileScannerController();
  bool _torchOn = false;
  bool _scanned = false;

  late final AnimationController _lineController;
  late final Animation<double> _lineAnim;

  void _toggleTorch() {
    setState(() => _torchOn = !_torchOn);
    _controller.toggleTorch();
  }

  void _handleBarcode(BarcodeCapture barcodes) async {
    if (_scanned) return;
    final value = barcodes.barcodes.firstOrNull?.rawValue ?? '';
    if (value.isEmpty) return;

    setState(() => _scanned = true);
    _controller.stop();
    Loading(context).start();

    try {
      final tableId = await ref.read(checkStatusTableProvider(value).future);
      if (!mounted) return;

      if (tableId.hasValue) {
        Loading(context).stop();
        ref.read(cartProvider.notifier).setTableId(tableId);
        context.pushAndRemoveUntil(
          MainFrameScreen(tableId: tableId!),
          (route) => false,
          transition: false,
        );
      }
    } catch (e) {
      if (!mounted) return;
      Loading(context).stop();
      context.showSnackBar(AppLocalizations.of(context)!.menuNotFound);
      setState(() => _scanned = false);
      _controller.start();
    }
  }

  List<Widget> _buildCorners(double size, double radius) {
    const len = 28.0;
    const thick = 3.0;
    const color = Colors.white;

    Widget corner({
      required AlignmentGeometry alignment,
      required BorderRadius borderRadius,
    }) => Align(
      alignment: alignment,
      child: Container(
        width: len,
        height: len,
        decoration: BoxDecoration(
          border: Border(
            top:
                (borderRadius.topLeft != Radius.zero ||
                    borderRadius.topRight != Radius.zero)
                ? BorderSide(color: color, width: thick)
                : BorderSide.none,
            left:
                (borderRadius.topLeft != Radius.zero ||
                    borderRadius.bottomLeft != Radius.zero)
                ? BorderSide(color: color, width: thick)
                : BorderSide.none,
            bottom:
                (borderRadius.bottomLeft != Radius.zero ||
                    borderRadius.bottomRight != Radius.zero)
                ? BorderSide(color: color, width: thick)
                : BorderSide.none,
            right:
                (borderRadius.topRight != Radius.zero ||
                    borderRadius.bottomRight != Radius.zero)
                ? BorderSide(color: color, width: thick)
                : BorderSide.none,
          ),
          borderRadius: borderRadius,
        ),
      ),
    );

    return [
      corner(
        alignment: Alignment.topLeft,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10)),
      ),
      corner(
        alignment: Alignment.topRight,
        borderRadius: const BorderRadius.only(topRight: Radius.circular(10)),
      ),
      corner(
        alignment: Alignment.bottomLeft,
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10)),
      ),
      corner(
        alignment: Alignment.bottomRight,
        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10)),
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    _lineController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _lineAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _lineController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _lineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    const frameSize = 260.0;
    const frameRadius = 20.0;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          MobileScanner(controller: _controller, onDetect: _handleBarcode),
          ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.black54,
              BlendMode.srcOut,
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    backgroundBlendMode: BlendMode.dstOut,
                  ),
                ),
                Center(
                  child: Container(
                    width: frameSize,
                    height: frameSize,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(frameRadius),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: SizedBox(
              width: frameSize,
              height: frameSize,
              child: Stack(
                children: [
                  ..._buildCorners(frameSize, frameRadius),
                  AnimatedBuilder(
                    animation: _lineAnim,
                    builder: (_, _) => Positioned(
                      top: _lineAnim.value * (frameSize - 2),
                      left: 16,
                      right: 16,
                      child: Container(
                        height: 2,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.white.withValues(alpha: 0.8),
                              Colors.transparent,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIconButton(
                    onTap: () => Navigator.pop(context),
                    icon: PhosphorIconsBold.arrowLeft,
                    type: TypeVariant.transparent,
                  ),
                  AppIconButton(
                    onTap: _toggleTorch,
                    icon: _torchOn
                        ? PhosphorIconsFill.flashlight
                        : PhosphorIconsRegular.flashlight,
                    type: _torchOn
                        ? TypeVariant.white
                        : TypeVariant.transparent,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.fromLTRB(32, 0, 32, 40),
                child: Column(
                  spacing: 8,
                  children: [
                    Text(
                      l10n.scanTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.3,
                      ),
                    ),
                    Text(
                      l10n.scanSubtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.55),
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
