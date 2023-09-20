import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  const BaseAppBar(
      {Key? key,
      this.title = '',
      this.titleColor = Colors.black,
      this.titleSize = 24,
      this.shadowColor = Colors.transparent,
      this.height = kToolbarHeight,
      this.showBackButton = true,
      this.backButtonCallBack,
      this.actions,
      this.leading})
      : super(key: key);

  final String title;
  final Color titleColor;
  final double titleSize;
  final Color shadowColor;
  final double height;
  final bool showBackButton;
  final VoidCallback? backButtonCallBack;
  final List<Widget>? actions;
  final Widget? leading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: _buildTitle(),
      actions: actions,
      shadowColor: shadowColor,
      elevation: 1,
      leading: _buildLeading(context),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);

  Widget _buildLeading(BuildContext context) {
    return showBackButton
        ? Row(
      mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: backButtonCallBack ??
                    () {
                      Navigator.of(context).pop();
                    },
                child: const Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: Icon(Icons.arrow_back_ios),
                ),
              ),
            leading ?? const SizedBox(),
          ],
        )
        : const SizedBox();
  }

  Widget _buildTitle() {
    return Text(
      title,
      style: TextStyle(
          color: titleColor, fontSize: titleSize, fontWeight: FontWeight.w300),
      overflow: TextOverflow.ellipsis,
    );
  }
}
