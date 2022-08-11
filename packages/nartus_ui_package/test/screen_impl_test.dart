import 'package:flutter/cupertino.dart'
    show CupertinoApp, CupertinoPageScaffold, CupertinoNavigationBar;
import 'package:flutter_test/flutter_test.dart';
import 'package:nartus_ui_package/nartus_ui.dart';
import 'package:flutter/material.dart'
    show FloatingActionButton, Icons, MaterialApp, Scaffold, IconButton, AppBar;

part 'screen_test_data.dart';

void main() {
  group('Test when screen has no floating button, no action, no title', () {
    testWidgets(
        'When OS is iOS and no floating button, show Cupertino page scaffold without floating button',
            (widgetTester) async {
          debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

          final screen = CupertinoApp(
            builder: (context, widget) =>
            widget ?? const TestScreenBlank(),
          );

          await widgetTester.pumpWidget(screen);
          await widgetTester.pumpAndSettle();

          expect(find.byType(CupertinoPageScaffold), findsOneWidget);
          expect(find.text('Sample Test'), findsOneWidget);
          expect(find.byType(FloatingActionButton), findsNothing);
          expect(find.byType(TextButton), findsNothing);
          expect(find.byType(IconButton), findsNothing);

          debugDefaultTargetPlatformOverride = null;
        });

    testWidgets(
        'When OS is android, show Material scaffold without floating button',
            (widgetTester) async {
          debugDefaultTargetPlatformOverride = TargetPlatform.android;

          const screen = MaterialApp(
            home: TestScreenBlank(),
          );

          await widgetTester.pumpWidget(screen);
          await widgetTester.pumpAndSettle();

          expect(find.byType(Scaffold), findsOneWidget);
          expect(find.text('Sample Test'), findsOneWidget);
          expect(find.byType(FloatingActionButton), findsNothing);
          expect(find.byType(TextButton), findsNothing);
          expect(find.byType(IconButton), findsNothing);

          debugDefaultTargetPlatformOverride = null;
        });

    testWidgets(
        'When OS is windows, show Material scaffold without floating button',
            (widgetTester) async {
          debugDefaultTargetPlatformOverride = TargetPlatform.windows;

          const screen = MaterialApp(
            home: TestScreenBlank(),
          );

          await widgetTester.pumpWidget(screen);
          await widgetTester.pumpAndSettle();

          expect(find.byType(Scaffold), findsOneWidget);
          expect(find.text('Sample Test'), findsOneWidget);
          expect(find.byType(FloatingActionButton), findsNothing);
          expect(find.byType(TextButton), findsNothing);
          expect(find.byType(IconButton), findsNothing);

          debugDefaultTargetPlatformOverride = null;
        });
  });

  group('Test when screen has floating button', () {
    testWidgets(
        'When OS is iOS, show Cupertino page scaffold with floating button',
            (widgetTester) async {
          debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

          final screen = CupertinoApp(
            builder: (context, widget) =>
            widget ?? const TestScreenWithFloatingButton(),
          );

          await widgetTester.pumpWidget(screen);
          await widgetTester.pumpAndSettle();

          expect(find.byType(CupertinoPageScaffold), findsOneWidget);
          expect(find.text('Sample Test'), findsOneWidget);
          expect(find.byType(FloatingActionButton), findsOneWidget);
          expect(find.byType(TextButton), findsNothing);
          expect(find.byType(IconButton), findsNothing);

          debugDefaultTargetPlatformOverride = null;
        });

    testWidgets(
        'When OS is android, show Material scaffold with floating button',
            (widgetTester) async {
          debugDefaultTargetPlatformOverride = TargetPlatform.android;

          const screen = MaterialApp(
            home: TestScreenWithFloatingButton(),
          );

          await widgetTester.pumpWidget(screen);
          await widgetTester.pumpAndSettle();

          expect(find.byType(Scaffold), findsOneWidget);
          expect(find.text('Sample Test'), findsOneWidget);
          expect(find.byType(FloatingActionButton), findsOneWidget);
          expect(find.byType(TextButton), findsNothing);
          expect(find.byType(IconButton), findsNothing);

          debugDefaultTargetPlatformOverride = null;
        });

    testWidgets(
        'When OS is windows, show Material scaffold with floating button',
            (widgetTester) async {
          debugDefaultTargetPlatformOverride = TargetPlatform.windows;

          const screen = MaterialApp(
            home: TestScreenWithFloatingButton(),
          );

          await widgetTester.pumpWidget(screen);
          await widgetTester.pumpAndSettle();

          expect(find.byType(Scaffold), findsOneWidget);
          expect(find.text('Sample Test'), findsOneWidget);
          expect(find.byType(FloatingActionButton), findsOneWidget);
          expect(find.byType(TextButton), findsNothing);
          expect(find.byType(IconButton), findsNothing);

          debugDefaultTargetPlatformOverride = null;
        });
  });

  group('Test when screen has Text action button', () {
    testWidgets(
        'When OS is iOS, show Cupertino page scaffold with text button',
            (widgetTester) async {
          debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

          final screen = CupertinoApp(
            builder: (context, widget) => const TestScreenWithTextAction(),
          );

          await widgetTester.pumpWidget(screen);
          await widgetTester.pumpAndSettle();

          expect(find.byType(CupertinoPageScaffold), findsOneWidget);
          expect(find.text('Sample Test'), findsOneWidget);
          expect(find.byType(FloatingActionButton), findsNothing);

          // title text
          expect(find.descendant(of: find.byType(CupertinoNavigationBar),
              matching: find.text('Title')), findsOneWidget);

          // action button is text
          expect(find.byType(TextButton), findsOneWidget);
          expect(find.text('action'), findsOneWidget);

          // no icon button
          expect(find.byType(IconButton), findsNothing);

          debugDefaultTargetPlatformOverride = null;
        });

    testWidgets(
        'When OS is android, show Material scaffold with floating button',
            (widgetTester) async {
          debugDefaultTargetPlatformOverride = TargetPlatform.android;

          const screen = MaterialApp(
            home: TestScreenWithTextAction(),
          );

          await widgetTester.pumpWidget(screen);
          await widgetTester.pumpAndSettle();

          expect(find.byType(Scaffold), findsOneWidget);
          expect(find.text('Sample Test'), findsOneWidget);
          expect(find.byType(FloatingActionButton), findsNothing);

          // title
          expect(find.descendant(of: find.byType(AppBar),
              matching: find.text('Title')), findsOneWidget);

          // action button is text
          expect(find.byType(TextButton), findsOneWidget);
          expect(find.text('action'), findsOneWidget);

          // no icon button
          expect(find.byType(IconButton), findsNothing);

          debugDefaultTargetPlatformOverride = null;
        });

    testWidgets(
        'When OS is windows, show Material scaffold with floating button',
            (widgetTester) async {
          debugDefaultTargetPlatformOverride = TargetPlatform.windows;

          const screen = MaterialApp(
            home: TestScreenWithTextAction(),
          );

          await widgetTester.pumpWidget(screen);
          await widgetTester.pumpAndSettle();

          expect(find.byType(Scaffold), findsOneWidget);
          expect(find.text('Sample Test'), findsOneWidget);
          expect(find.byType(FloatingActionButton), findsNothing);

          // title
          expect(find.descendant(of: find.byType(AppBar),
              matching: find.text('Title')), findsOneWidget);

          // action button is text
          expect(find.byType(TextButton), findsOneWidget);
          expect(find.text('action'), findsOneWidget);

          // no icon button
          expect(find.byType(IconButton), findsNothing);
          debugDefaultTargetPlatformOverride = null;
        });
  });

  group('test when screen has Icon action button', () { });

  group('Test when screen has title', () { });
}
