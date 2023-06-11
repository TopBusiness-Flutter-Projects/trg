import 'package:flutter/material.dart';
import 'package:trg/features/splash/presentation/screens/splash_screen.dart';



import '../../core/utils/app_strings.dart';


class Routes {
  static const String initialRoute = '/';
  static const String loginRoute = '/login';
  static const String paperexamRegisterRoute = '/paperexamRegister';
  static const String paperdetialsexamRegisterRoute = '/paperdetailsexamRegister';
  static const String homePageScreenRoute = '/homePageScreen';
  static const String monthplanPageScreenRoute = '/monthplanPageScreen';
  static const String onboardingPageScreenRoute = '/onboardingPageScreen';
  static const String podAdsPageScreenRoute = '/podAdsPageScreen';
  static const String lessonClassScreenRoute = '/lessonClassPageScreen';
  static const String sourceReferencesDetailsRoute = '/sourceReferencesDetails';
  static const String examInstructionsRoute = '/examInstructions';
  static const String examHeroScreenRoute = '/examHeroScreen';
}

class AppRoutes {
  static String route = '';

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      // case Routes.loginRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => const LoginScreen(),
      //   );
      // case Routes.lessonClassScreenRoute:
      //   int classId=settings.arguments as int;
      //   return MaterialPageRoute(
      //     builder: (context) => LessonsClassScreen(classId: classId),
      //   );
      //   case Routes.examInstructionsRoute:
      //   List<dynamic> data=settings.arguments as   List<dynamic>;
      //
      //   return MaterialPageRoute(
      //     builder: (context) => ExamInstructions(exam_id: data[0],type: data[1]),
      //   );
      // case Routes.paperexamRegisterRoute:
      //   PaperExamDetialsModel timeDataModel = settings.arguments as PaperExamDetialsModel;
      //
      //   return MaterialPageRoute(
      //     builder: (context) => PaperExmRegisterPage(timeDataModel: timeDataModel),
      //   );
      //   case Routes.paperdetialsexamRegisterRoute:
      //     PaperExam paperExamModel = settings.arguments as PaperExam;
      //
      //   return MaterialPageRoute(
      //     builder: (context) => PaperDetailsExmRegisterPage(paperExamModel: paperExamModel),
      //   );
      // case Routes.monthplanPageScreenRoute:
      //   return PageTransition(
      //     type: PageTransitionType.fade,
      //     alignment: Alignment.center,
      //     duration: const Duration(milliseconds: 1300),
      //     child: MonthPlan(),
      //   );
      // case Routes.homePageScreenRoute:
      //   return PageTransition(
      //     type: PageTransitionType.fade,
      //     alignment: Alignment.center,
      //     duration: const Duration(milliseconds: 1300),
      //     child: Zoom(),
      //   );
      // case Routes.onboardingPageScreenRoute:
      //   return PageTransition(
      //     type: PageTransitionType.fade,
      //     alignment: Alignment.center,
      //     duration: const Duration(milliseconds: 1300),
      //     child: OnBoardingScreen(),
      //   );
      //
      // case Routes.sourceReferencesDetailsRoute:
      //   return PageTransition(
      //     type: PageTransitionType.fade,
      //     alignment: Alignment.center,
      //     duration: const Duration(milliseconds: 300),
      //     child: SourceReferencesDetails(),
      //   );
      //
      // case Routes.podAdsPageScreenRoute:
      //   AdsModelDatum adsModelDatum = settings.arguments as AdsModelDatum;
      //   return PageTransition(
      //     type: PageTransitionType.fade,
      //     alignment: Alignment.center,
      //     duration: const Duration(milliseconds: 1300),
      //     child: PopAdsScreen(
      //       adsDatum: adsModelDatum,
      //     ),
      //   );
      //
      // case Routes.examHeroScreenRoute:
      //   return PageTransition(
      //     type: PageTransitionType.fade,
      //     alignment: Alignment.center,
      //     duration: const Duration(milliseconds: 1300),
      //     child: ExamHeroScreen(),
      //   );

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
