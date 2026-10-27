import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class PinDialog extends StatefulWidget {
  const PinDialog({
    required this.title,
    required this.subtitle,
    required this.isEnableMode,
    required this.onSubmit,
    super.key,
  });

  final String title;
  final String subtitle;
  final bool isEnableMode;
  final void Function(String pin) onSubmit;

  @override
  State<PinDialog> createState() => _PinDialogState();
}

class _PinDialogState extends State<PinDialog> {
  final _pinController = TextEditingController();

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.isEnableMode ? Icons.lock : Icons.lock_open,
              size: 48,
              color: widget.isEnableMode ? Colors.red : Colors.green,
            ),
            const SizedBox(height: 16),
            Text(
              widget.title,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              widget.subtitle,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _pinController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: const InputDecoration(
                labelText: 'PIN Code',
                hintText: 'Enter PIN',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.pin),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: context.pop,
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () => widget.onSubmit(_pinController.text.trim()),
                  child: Text(widget.isEnableMode ? 'Enable' : 'Disable'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
