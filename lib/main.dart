import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  log('Launch pointer test app');
  runApp(const TestApp());
}

class TestApp extends StatefulWidget {
  const TestApp({super.key});

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  PointerEvent? latestPointerEvent;

  void _pointerEvent(PointerEvent event) {
    log('Got pointer event: $event');
    setState(() {
      latestPointerEvent = event;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        title: 'Input Event Tester',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Listener(
              onPointerDown: _pointerEvent,
              onPointerMove: _pointerEvent,
              onPointerUp: _pointerEvent,
              child: Container(
                color: Colors.lightBlueAccent,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Latest pointer event:\n${latestPointerEvent?.toStringShort()} ${latestPointerEvent?.localPosition}',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }

}
