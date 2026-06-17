import 'package:flutter/material.dart';
import 'package:banking_ui/viewmodels/bank_viewmodel.dart';

class ViewModelProvider extends InheritedNotifier<BankViewModel> {
  const ViewModelProvider({
    super.key,
    required BankViewModel viewModel,
    required super.child,
  }) : super(notifier: viewModel);

  static BankViewModel of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<ViewModelProvider>();
    assert(provider != null, "No ViewModelProvider found in context");
    return provider!.notifier!;
  }
}
