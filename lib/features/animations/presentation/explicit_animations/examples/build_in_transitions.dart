import 'package:flutter/material.dart';

class BuildInTransitionExample extends StatefulWidget {
  const BuildInTransitionExample({
    super.key,
  });

  @override
  State<BuildInTransitionExample> createState() =>
      _BuildInTransitionExampleState();
}

class _BuildInTransitionExampleState extends State<BuildInTransitionExample>
    with TickerProviderStateMixin {
  late final _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Built-in Transitions'),
        backgroundColor: Colors.green.shade100,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _TransitionCard(
                title: 'FadeTransition',
                transition: FadeTransition(
                  opacity: _controller,
                  child: const FlutterLogo(size: 100),
                ),
              ),
              _TransitionCard(
                title: 'ScaleTransition',
                transition: ScaleTransition(
                  scale: Tween<double>(
                    begin: 0.5,
                    end: 1.0,
                  ).animate(_controller),
                  child: const FlutterLogo(size: 100),
                ),
              ),
              _TransitionCard(
                title: 'SlideTransition',
                transition: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset.zero,
                    end: const Offset(0.3, 0),
                  ).animate(_controller),
                  child: const FlutterLogo(size: 100),
                ),
              ),
              _TransitionCard(
                title: 'RotationTransition',
                transition: RotationTransition(
                  turns: Tween<double>(
                    begin: 0,
                    end: 0.5,
                  ).animate(_controller),
                  child: const FlutterLogo(size: 100),
                ),
              ),
              _TransitionCard(
                title: 'SizeTransition',
                transition: SizeTransition(
                  sizeFactor: Tween<double>(
                    begin: 0.3,
                    end: 1.0,
                  ).animate(_controller),
                  child: const Center(child: FlutterLogo(size: 100)),
                ),
              ),
              _TransitionCard(
                title: 'AlignTransition',
                transition: SizedBox(
                  height: 120,
                  child: AlignTransition(
                    alignment: Tween<Alignment>(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).animate(_controller),
                    child: const FlutterLogo(size: 60),
                  ),
                ),
              ),
              _TransitionCard(
                title: 'DecoratedBoxTransition',
                transition: DecoratedBoxTransition(
                  decoration: DecorationTween(
                    begin: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(0),
                    ),
                    end: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ).animate(_controller),
                  child: const FlutterLogo(size: 100),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _TransitionCard extends StatelessWidget {
  const _TransitionCard({
    required this.title,
    required this.transition,
  });

  final String title;
  final Widget transition;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.amber.shade100,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.amber.shade200,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: transition,
          ),
        ],
      ),
    );
  }
}
