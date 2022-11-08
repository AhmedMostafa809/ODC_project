import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_day_one/Bussiness_logic/login/login_cubit.dart';
import 'package:odc_day_one/Bussiness_logic/register/register_cubit.dart';
import 'package:odc_day_one/presentation/screens/Home_screens_director/NotesApp/Notes.dart';
import 'package:odc_day_one/presentation/screens/register/Splash_Screen.dart';
import 'package:sizer/sizer.dart';

import 'data/data_provider/local/cache_helper.dart';
import 'data/data_provider/remote/dio_helper.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginCubit(),),
          BlocProvider(create: (context) => RegisterCubit(),),
        ],
        child: MaterialApp(

          debugShowCheckedModeBanner: false,
          title: 'Sizer',
          routes: {
            '/details': (context) => NotesScreen(),
          },
          home: SplashScreen() ,
        ),
      );

        }
    );
}
}