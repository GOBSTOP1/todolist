  part of 'theme_bloc.dart';

  abstract class ThemeState {
    late ThemeData currentTheme = AppThemes.lightTheme;
     
  }
  class ThemeCurrent extends ThemeState{
  @override
  late final ThemeData currentTheme;

  ThemeCurrent(this.currentTheme);
    
  }

  Future<ThemeData> getTheme() async {
   var box = await Hive.openBox('theme');

    var currentTheme =  box.get('current');
    if(currentTheme ==  'light'){
      return AppThemes.lightTheme;
    } else if(currentTheme ==  'dark'){
      return AppThemes.darkTheme;
    } else {
      return  AppThemes.darkTheme;
    }
  }
  void setDark() async{
    var box = await Hive.openBox('theme');
    await box.put('current', 'dark' );
  }
  void setLight() async{
    var box = await Hive.openBox('theme');
    await box.put('current', 'light' );
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