import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:verbuildno/verbuildno.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _bundleIdentifier = 'Unknown';
  String _numberOfCore = 'Unknown';

  final _verbuildnoPlugin = Verbuildno();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    String bundleIdentifier;
    String numberOfCore;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _verbuildnoPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    try {
      bundleIdentifier = await _verbuildnoPlugin.getBundleIdentifer() ??
          'Unknown bundle identifer';
    } on Exception {
      bundleIdentifier = 'Failed to get bundle identifier.';
    }

    try {
      numberOfCore = await _verbuildnoPlugin.getNumberOfCore() ??
          'Unknown number of core';
    } on Exception {
      numberOfCore = 'Failed to get number of core.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _bundleIdentifier = bundleIdentifier;
      _numberOfCore = numberOfCore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Bundle Id: $_bundleIdentifier\n'),
              Text('Running on: $_platformVersion\n'),
              Text('Number Of Core: $_numberOfCore')
            ],
          ),
        ),
      ),
    );
  }
}
