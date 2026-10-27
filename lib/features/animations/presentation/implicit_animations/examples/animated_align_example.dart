import 'package:flutter/material.dart';

class AnimatedAlignExample extends StatefulWidget {
  const AnimatedAlignExample({super.key});

  @override
  State<AnimatedAlignExample> createState() => _AnimatedAlignExampleState();
}

class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {
  Alignment _alignment = Alignment.center;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedAlign Example'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'AnimatedAlign Example',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'AnimatedAlign automatically animates between old and new '
              'alignment values when the alignment property changes. This is '
              'useful for moving widgets within their parent container.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Interactive AnimatedAlign',
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
                      child: AnimatedAlign(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        alignment: _alignment,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.orange.withValues(alpha: 0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _alignment = Alignment.topLeft;
                            });
                          },
                          child: const Text('Top Left'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _alignment = Alignment.topCenter;
                            });
                          },
                          child: const Text('Top Center'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _alignment = Alignment.topRight;
                            });
                          },
                          child: const Text('Top Right'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _alignment = Alignment.centerLeft;
                            });
                          },
                          child: const Text('Center Left'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _alignment = Alignment.center;
                            });
                          },
                          child: const Text('Center'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _alignment = Alignment.centerRight;
                            });
                          },
                          child: const Text('Center Right'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _alignment = Alignment.bottomLeft;
                            });
                          },
                          child: const Text('Bottom Left'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _alignment = Alignment.bottomCenter;
                            });
                          },
                          child: const Text('Bottom Center'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _alignment = Alignment.bottomRight;
                            });
                          },
                          child: const Text('Bottom Right'),
                        ),
                      ],
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
