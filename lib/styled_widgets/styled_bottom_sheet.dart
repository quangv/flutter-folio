import 'package:flutter/material.dart';
import 'package:flutter_folio/core_packages.dart';
import 'package:provider/provider.dart';

class StyledBottomSheet extends StatelessWidget {
  StyledBottomSheet({required this.child});
  final Widget child;

  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Corners.medRadius, bottom: Radius.zero),
        color: theme.surface1,
      ),
      child: Column(children: [
        VSpace.sm,

        /// Drag Handle
        Container(
          width: 96,
          height: 4,
          decoration: BoxDecoration(borderRadius: Corners.medBorder, color: theme.greyWeak),
        ),

        /// Content
        child
      ]),
    );
  }
}

Future<void> showStyledBottomSheet<T>(BuildContext context, {required Widget child}) async {
  return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Corners.medRadius, bottom: Radius.zero),
      ),
      builder: (BuildContext context) {
        return Wrap(
          children: [
            StyledBottomSheet(child: child),
          ],
        );
      });
}
