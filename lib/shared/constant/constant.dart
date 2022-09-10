import 'package:flutter/cupertino.dart';

import '/modules/login/login_screen.dart';
import '/shared/components/components.dart';
import '/shared/network/local/cache_helper.dart';

/////////////////////////////////
void userLogout(context) {
  CacheHelper.removeDataFromSharedPreferences(key: 'userToken').then(
    (value) {
      if (value) {
        navigateAndFinish(context, LoginScreen());
      }
    },
  );
}

/////////////////////////////////
void closeKeyboard(context) {
  // To close keyboard
  FocusScope.of(context).unfocus();
}

/////////////////////////////////
dynamic userToken = '';

/////////////////////////////////
var shopLayoutItems = {
  'en': [
    'Home',
    'Categories',
    'Favorites',
    'Settings',
  ],
  'ar': [
    'घर',
    'श्रेणियाँ',
    'पसंदीदा',
    'समायोजन',
  ],
};

/////////////////////////////////
Map appWords = {
  'loginTitle': {
    'en': 'Log in to your account',
    'ar': 'अपने खाते में प्रवेश करें',
  },
  'login': {
    'en': 'LOGIN',
    'ar': 'लॉग इन करें',
  },
  'noAccount': {
    'en': 'Don\'t have an account?',
    'ar': 'खाता नहीं है',
  },
  'haveAccount': {
    'en': 'Do you already have an account?',
    'ar': 'क्या आपका पूर्व निर्मित खाता है',
  },
  'createAccount': {
    'en': 'Create a new account',
    'ar': 'एक नया खाता बनाएं',
  },
  'register': {
    'en': 'REGISTER',
    'ar': 'रजिस्टर करें',
  },
  'logout': {
    'en': 'LOGOUT',
    'ar': 'लॉग आउट',
  },
  /////////////
  'username': {
    'en': 'Username',
    'ar': 'उपयोगकर्ता नाम',
  },
  'usernameError': {
    'en': 'Please enter your username',
    'ar': 'अपने उपयोगकर्ता नाम दर्ज करें',
  },
  'email': {
    'en': 'Email Address',
    'ar': 'ईमेल पता',
  },
  'emailError': {
    'en': 'Please enter a valid email address',
    'ar': 'कृपया एक वैध ई - मेल एड्रेस डालें',
  },
  'password': {
    'en': 'Password',
    'ar': 'पासवर्ड',
  },
  'passwordError': {
    'en': 'Password is too short',
    'ar': 'पारण बहुत छोटा है',
  },
  'phone': {
    'en': 'Phone',
    'ar': 'फ़ोन',
  },
  'phoneError': {
    'en': 'Please enter your phone number',
    'ar': 'कृपया अपना फोन नंबर दर्ज करें',
  },
  //////////////
  'home': {
    'en': 'Home',
    'ar': 'घर',
  },
  'categories': {
    'en': 'Categories',
    'ar': 'श्रेणियाँ',
  },
  'products': {
    'en': 'Products',
    'ar': 'उत्पादों',
  },
  'favorites': {
    'en': 'Favorites',
    'ar': 'पसंदीदा',
  },
  'settings': {
    'en': 'Settings',
    'ar': 'समायोजन',
  },
  /////////
  'cart': {
    'en': 'Shopping Cart',
    'ar': 'शॉपिंग कार्ट',
  },
  'addCart': {
    'en': 'Add to cart',
    'ar': 'कार्ट में जोड़ें',
  },
  'total': {
    'en': 'Total',
    'ar': 'कुल',
  },
  'checkout': {
    'en': 'CHECKOUT',
    'ar': 'चेक आउट',
  },
  ///////////
  'account': {
    'en': 'Account',
    'ar': 'खाता',
  },
  'update': {
    'en': 'Updating Data',
    'ar': 'डेटा अपडेट करना',
  },
  ///////////
  'theme': {
    'en': 'Theme',
    'ar': 'थीम',
  },
  'lightMode': {
    'en': 'Light Mode',
    'ar': 'लाइट मोड',
  },
  'darkMode': {
    'en': 'Dark Mode',
    'ar': 'डार्क मोड',
  },
  'themeTitle1': {
    'en': 'Choose your application mode',
    'ar': 'अपना आवेदन मोड चुनें',
  },
  'themeTitle2': {
    'en': 'Choose your accent color',
    'ar': 'अपना उच्चारण रंग चुनें',
  },
  ///////////
  'language': {
    'en': 'Language',
    'ar': 'भाषा',
  },
  'changeLanguage': {
    'en': 'Please wait while changing the application language',
    'ar': 'कृपया आवेदन की भाषा बदलते समय प्रतीक्षा करें',
  },
  'arabic': {
    'en': 'Hindi',
    'ar': 'हिन्दी',
  },
  ///////////
  'search': {
    'en': 'Search...',
    'ar': 'खोज...',
  },
  'noSearch': {
    'en': 'No results found',
    'ar': 'कोई परिणाम नहीं मिला',
  },
  ////////////
  'messageAdding': {
    'en': 'Added Successfully',
    'ar': 'सफलतापूर्वक जोड़ा गया',
  },
  'price': {
    'en': 'INR',
    'ar': 'रुपया',
  },
    ////////////
  'payment': {
    'en': 'Payment Method',
    'ar': 'भुगतान का तरीका',
  },
};
