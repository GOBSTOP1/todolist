  part of 'theme_bloc.dart';

  abstract class ThemeState {
    ThemeData themeData = light;
     
  }
  class ThemeLight extends ThemeState{
   @override
  late final ThemeData themeData;
    ThemeLight(this.themeData);


     
  }
  class ThemeDark extends ThemeState{
   @override
  late final ThemeData themeData;
    ThemeDark(this.themeData);
    
  }
// Future<ThemeData> getTheme()async{
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   final String? theme = prefs.getString('theme');
//   if(theme=='dark'){
//     return dark;
//   } else if(theme == 'light'){
//     return light;
//   } else {
//     return light;
//   }
// }