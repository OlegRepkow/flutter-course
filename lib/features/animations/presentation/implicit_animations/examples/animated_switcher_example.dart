import 'package:flutter/material.dart';

enum TransitionType {
  fade, //uses by default
  scale,
  slide,
  rotation,
}

class AnimatedSwitcherExample extends StatefulWidget {
  const AnimatedSwitcherExample({super.key});

  @override
  State<AnimatedSwitcherExample> createState() =>
      _AnimatedSwitcherExampleState();
}

class _AnimatedSwitcherExampleState extends State<AnimatedSwitcherExample> {
  bool _showFirst = true;
  TransitionType _selectedTransition = TransitionType.scale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedSwitcher Example'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'AnimatedSwitcher automatically animates between old and new '
              'child widgets when the child property changes. This is useful '
              'for switching between widgets with smooth transitions.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Interactive AnimatedSwitcher',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _showFirst = !_showFirst;
                          });
                        },
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                                return switch (_selectedTransition) {
                                  TransitionType.scale => ScaleTransition(
                                    scale: animation,
                                    child: child,
                                  ),
                                  TransitionType.fade => FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  ),
                                  TransitionType.slide => SlideTransition(
                                    position: animation.drive(
                                      Tween<Offset>(
                                        begin: const Offset(1.0, 1.0),
                                        end: Offset.zero,
                                      ).chain(
                                        CurveTween(curve: Curves.easeOutBack),
                                      ),
                                    ),
                                    child: child,
                                  ),
                                  TransitionType.rotation => RotationTransition(
                                    turns: animation,
                                    child: child,
                                  ),
                                };
                              },
                          child: _showFirst
                              ? Container(
                                  key: const ValueKey('first'),
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                                )
                              : Container(
                                  key: const ValueKey('second'),
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select Transition Type:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DropdownButton<TransitionType>(
                      value: _selectedTransition,
                      isExpanded: true,
                      items: TransitionType.values.map((TransitionType type) {
                        return DropdownMenuItem<TransitionType>(
                          value: type,
                          child: Text(type.name.toUpperCase()),
                        );
                      }).toList(),
                      onChanged: (TransitionType? newTransition) {
                        if (newTransition != null) {
                          setState(() {
                            _selectedTransition = newTransition;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
