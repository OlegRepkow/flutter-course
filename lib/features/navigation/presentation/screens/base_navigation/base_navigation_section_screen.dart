import 'package:flutter/material.dart';
import 'package:flutter_lab/features/app/screens/page_names.dart';
import 'package:flutter_lab/features/navigation/presentation/widgets/navigation_button.dart';
import 'package:go_router/go_router.dart';

class BaseNavigationSectionScreen extends StatelessWidget {
  const BaseNavigationSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        title: const Text('Base Navigation Section'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          NavigationButton(
            title: 'Simple transition to new screen',
            onTap: () => context.goNamed(ScreenNames.simpleEmptyScreen),
          ),
          NavigationButton(
            title: 'Simple transition with custom transition',
            onTap: () => context.goNamed(
              ScreenNames.simpleEmptyScreenWithCustomTransition,
            ),
          ),
          NavigationButton(
            title: 'Transition with arguments',
            onTap: () => context.goNamed(
              ScreenNames.simpleTransitionWithArguments,
              queryParameters: {'id': '123'},
            ),
          ),
          NavigationButton(
            title: 'Transition with returning data',
            onTap: () async {
              final result = await context.pushNamed<String>(
                ScreenNames.simpleScreenWithReturningData,
                queryParameters: {
                  'guestName': 'Pavlo',
                },
              );

              if (result != null && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  _createSnackBar(context, result),
                );
              }
            },
          ),
          NavigationButton(
            title: 'Navigation to modal bottom sheet',
            onTap: () {
              showModalBottomSheet<void>(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Modal bottom sheet example',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text('Modal bottom sheet example data'),
                        SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

SnackBar _createSnackBar(BuildContext context, String result) {
  return SnackBar(
    content: Row(
      children: [
        const Icon(Icons.card_giftcard, color: Colors.white),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            result,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    ),
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 4),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(6)),
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    dismissDirection: DismissDirection.none,
  );
}
