import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ipot/app_routes.dart';
import 'package:ipot/models/language/language_model.dart';
import 'package:ipot/state/stores/locale/locale_notifier.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const _languages = [
  LanguageModel(
    locale: Locale('en'),
    flag: '🇺🇸',
    label: 'English',
    sublabel: 'United States',
  ),
  LanguageModel(
    locale: Locale('zh'),
    flag: '🇨🇳',
    label: '中文',
    sublabel: 'Chinese (Simplified)',
  ),
];

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLocale = ref.watch(localeProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 48),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  PhosphorIconsFill.forkKnife,
                  color: Colors.white,
                  size: 22,
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87,
                  letterSpacing: -0.5,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Choose a language to get started',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
              ),
              SizedBox(height: 40),
              Text(
                'LANGUAGE',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade400,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 12),
              ...List.generate(_languages.length, (i) {
                final lang = _languages[i];
                final isSelected = selectedLocale == lang.locale;

                return Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                    onTap: () =>
                        ref.read(localeProvider.notifier).set(lang.locale),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeOut,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.black87
                            : Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: isSelected
                              ? Colors.black87
                              : Colors.grey.shade200,
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(lang.flag, style: TextStyle(fontSize: 26)),
                          SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  lang.label,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black87,
                                  ),
                                ),
                                Text(
                                  lang.sublabel,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: isSelected
                                        ? Colors.white60
                                        : Colors.grey.shade500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 200),
                            opacity: isSelected ? 1 : 0,
                            child: Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Icon(
                                PhosphorIconsBold.check,
                                size: 12,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, AppRoute.scanner),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Icon(PhosphorIconsFill.qrCode, size: 18),
                      Text(
                        'Scan Table',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
