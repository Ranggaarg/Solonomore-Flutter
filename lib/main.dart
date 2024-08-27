import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solonomore_flutter/bloc/auth/auth_cubit.dart';
import 'package:solonomore_flutter/bloc/upload_file/upload_file_cubit.dart';
import 'package:solonomore_flutter/bloc/user/user_cubit.dart';
import 'package:solonomore_flutter/general_observer.dart';
import 'package:solonomore_flutter/pages/auth/splash/splash.dart';
import 'package:solonomore_flutter/repositories/auth_repository.dart';
import 'package:solonomore_flutter/repositories/upload_file_repository.dart';
import 'package:solonomore_flutter/repositories/user_repository.dart';

void main() {
  Bloc.observer = MyObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});    

  final AuthRepository authRepository = AuthRepository();
  final UserRepository userRepository = UserRepository();
  final FileRepository fileRepository = FileRepository();

  @override
  Widget build(BuildContext context){
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) => AuthCubit(authRepository: authRepository),),
        BlocProvider<UserCubit>(create: (context) => UserCubit(userRepository)),
        BlocProvider<UploadFileCubit>(create: (context) => UploadFileCubit(fileRepository: fileRepository),)
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 800),
          builder: (_, child) {
            return MaterialApp(
              theme: ThemeData(primarySwatch: Colors.red),
              title: 'SoloNoMore',
              home: child,
            );
          },
          child: const SplashScreen(),   
        ),
    );
  }
}



