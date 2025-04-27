import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_connect/core/notifications/fcm_notification.dart';
import 'package:smart_connect/features/it_support_screens/view_models/cubit/it_support_cubit.dart';
import 'package:smart_connect/features/medical_screens/show_medical_request/view_models/show_medical_request_cubit/show_medical_request_cubit.dart';
import 'package:smart_connect/features/teacher_screens/create_meeting/view_models/creat_metting_cubit.dart';
import 'package:smart_connect/features/teacher_screens/view_meeting/view_models/cubit/view_meeting_cubit.dart';
import 'package:smart_connect/features/technician_screens/view_models/cubit/technician_request_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

void setupDI() {
  final supabase = Supabase.instance.client;

  getIt.registerLazySingleton<SupabaseClient>(() => supabase);
  getIt.registerLazySingleton<FirebaseMessaging>(
      () => FirebaseMessaging.instance);
  getIt.registerLazySingleton<NotificationsHelper>(() => NotificationsHelper());
  getIt.registerFactory<ViewMeetingCubit>(() => ViewMeetingCubit());
  getIt.registerFactory<CreatMettingCubit>(() => CreatMettingCubit());
  getIt.registerFactory<ItSupportCubit>(() => ItSupportCubit());
  getIt.registerFactory<ShowMedicalRequestCubit>(
      () => ShowMedicalRequestCubit());
  getIt.registerFactory<TechnicianRequestCubit>(
      () => TechnicianRequestCubit());

}
