# Personal Website — Flutter Web

An earlier personal website built with Flutter Web, with separate mobile and desktop layouts. This repository preserves that version as a web-interface learning project.

## Features

- Personal introduction and about section.
- Separate layouts for narrow and wide screens.
- Reusable navigation and footer widgets.

The original README references [the hosted website](https://joaovtr.netlify.com). Availability of that deployment has not been verified; the instructions below run the source locally.

## Run from source

Requires Flutter with a bundled Dart SDK matching `>=3.0.6 <4.0.0`, as declared in [pubspec.yaml](pubspec.yaml). Use a compatible SDK with the checked-in dependency lockfile.

```bash
git clone https://github.com/JoaoVtrxx/WebSiteJoao.git
cd WebSiteJoao
flutter pub get
flutter devices
```

For web development, run with Chrome:

```bash
flutter run -d chrome
```

To generate the web build:

```bash
flutter build web
```

The generated site is written to `build/web`.

## Code map

| Path | Purpose |
| --- | --- |
| [`lib/screens/responsive_layout.dart`](lib/screens/responsive_layout.dart) | Switches between mobile and desktop layouts at 1000 px |
| [`lib/screens/desktop_body.dart`](lib/screens/desktop_body.dart) | Desktop page composition |
| [`lib/screens/mobile_body.dart`](lib/screens/mobile_body.dart) | Mobile page composition |
| [`lib/widgets`](lib/widgets) | Navigation, introduction, about and footer widgets |
