import 'package:flutter/material.dart';
import 'package:flutter_folio/models/app_model.dart';
import 'package:flutter_folio/models/books_model.dart';
import 'package:flutter_folio/services/cloudinary/cloud_storage_service.dart';
import 'package:flutter_folio/services/firebase/firebase_service.dart';
import 'package:flutter_folio/styles.dart';
import 'package:flutter_folio/themes.dart';
import 'package:provider/provider.dart';

BuildContext? _mainContext;
BuildContext get mainContext => _mainContext!;
bool get hasContext => _mainContext != null;

/// Someone needs to call this so our Commands can access models and services. Usually main_view.dart
void setContext(BuildContext c) {
  _mainContext = c;
}

class BaseAppCommand {
  /// Provide quick lookups for the main Models and Services in the App.
  T getProvided<T>() {
    assert(_mainContext != null, "You must call AbstractCommand.init(BuildContext) method before calling Commands.");
    return _mainContext!.read<T>();
  }

  AppTheme get appTheme => getProvided();

  FirebaseService get firebase => getProvided();
  CloudStorageService get cloudStorage => getProvided();

  AppModel get appModel => getProvided();
  BooksModel get booksModel => getProvided();

  void showToast(String content) {
    TextStyle textStyle = TextStyles.body2.copyWith(color: appModel.theme.inverseTextColor);
    ScaffoldMessenger.of(mainContext).clearSnackBars();
    ScaffoldMessenger.of(mainContext).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: Duration(milliseconds: 1700),
        content: Container(
          padding: EdgeInsets.all(Insets.sm),
          child: Text(content, style: textStyle),
        ),
      ),
    );
  }
}
