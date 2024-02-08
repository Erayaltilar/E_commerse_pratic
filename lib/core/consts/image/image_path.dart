import 'image_base.dart';

enum ImagePath {
  splash1,
  splash2,
  splash3,
  prev,
  lock,
  email,
  success,
  twitter,
  facebook,
  google,
  pin2,
  marker,
  flash,
  game,
  gift,
  bill,
  discover,
  bell,
  cart
}

extension ImagePathExtension on ImagePath {
  String get path {
    return switch (this) {
      ImagePath.splash1 => '$splashBasePath/splash_1.png',
      ImagePath.splash2 => '$splashBasePath/splash_2.png',
      ImagePath.splash3 => '$splashBasePath/splash_3.png',
      ImagePath.prev => '$iconBasePath/left.svg',
      ImagePath.lock => '$iconBasePath/lock.svg',
      ImagePath.email => '$iconBasePath/email.svg',
      ImagePath.success => '$iconBasePath/success.png',
      ImagePath.twitter => '$iconBasePath/twitter.svg',
      ImagePath.facebook => '$iconBasePath/facebook-2.svg',
      ImagePath.google => '$iconBasePath/google-icon.svg',
      ImagePath.pin2 => '$iconBasePath/pin2.png',
      ImagePath.marker => '$iconBasePath/marker.png',
      ImagePath.flash => '$iconBasePath/Flash Icon.svg',
      ImagePath.game => '$iconBasePath/Game Icon.svg',
      ImagePath.gift => '$iconBasePath/Gift Icon.svg',
      ImagePath.bill => '$iconBasePath/Bill Icon.svg',
      ImagePath.discover => '$iconBasePath/Discover.svg',
      ImagePath.bell => '$iconBasePath/Bell.svg',
      ImagePath.cart => '$iconBasePath/Cart Icon.svg',
    };
  }
}
