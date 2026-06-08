import 'package:flutter/material.dart';
import 'package:ipot/extensions/extensions.dart';
import 'package:ipot/l10n/app_localizations.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class ModalNoteSection extends StatefulWidget {
  final String? note;
  const ModalNoteSection({super.key, required this.note});

  @override
  State<ModalNoteSection> createState() => _ModalNoteSectionState();
}

class _ModalNoteSectionState extends State<ModalNoteSection> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  static final int _maxLength = 200;

  @override
  void initState() {
    super.initState();
    if (widget.note.hasValue) {
      _controller.text = widget.note!;
    }
    _controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final mediaQuery = MediaQuery.of(context);
    final hasText = _controller.text.isNotEmpty;
    final charCount = _controller.text.length;
    final isNearLimit = charCount >= (_maxLength * 0.8).toInt();

    return AnimatedPadding(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeOut,
      padding: EdgeInsets.only(bottom: mediaQuery.viewInsets.bottom),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: mediaQuery.padding.bottom + 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 12, bottom: 4),
                child: Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        PhosphorIconsFill.notepad,
                        color: Colors.orange.shade400,
                        size: 18,
                      ),
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.modalNoteTitle,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          l10n.modalNoteSubtitle,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(
                          PhosphorIconsBold.x,
                          size: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(height: 1),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      maxLength: _maxLength,
                      maxLines: 4,
                      minLines: 3,
                      textInputAction: TextInputAction.done,
                      style: TextStyle(fontSize: 14, height: 1.5),
                      decoration: InputDecoration(
                        counterText: '',
                        hintText: l10n.modalNoteHint,
                        contentPadding: EdgeInsets.all(14),
                        suffixIcon: hasText
                            ? Padding(
                                padding: EdgeInsets.only(top: 10, right: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    _controller.clear();
                                    _focusNode.requestFocus();
                                  },
                                  child: Icon(
                                    PhosphorIconsFill.xCircle,
                                    color: Colors.grey.shade400,
                                    size: 18,
                                  ),
                                ),
                              )
                            : null,
                        suffixIconConstraints: BoxConstraints(
                          minWidth: 0,
                          minHeight: 0,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '$charCount / $_maxLength',
                        style: TextStyle(
                          fontSize: 11,
                          color: isNearLimit
                              ? Colors.orange.shade400
                              : Colors.grey.shade400,
                          fontWeight: isNearLimit
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(context),

                            child: Text(
                              l10n.cancel,
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: ElevatedButton(
                            onPressed: () =>
                                Navigator.pop(context, _controller.text),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 6,
                              children: [
                                Icon(PhosphorIconsFill.checkCircle, size: 16),
                                Text(
                                  l10n.saveNote,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
