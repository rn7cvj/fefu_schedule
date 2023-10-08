import 'package:fefu_schedule/controllers/schedule/converter.dart';
import 'package:fefu_schedule/logger.dart';
import 'package:fefu_schedule/models/lesson.dart';
import 'package:mobx/mobx.dart';

part '../../gen/controllers/schedule/controller.g.dart';

class ScheduleController = ScheduleControllerStore with _$ScheduleController;

abstract class ScheduleControllerStore with Store {
  ScheduleControllerStore({required ScheduleConverter scheduleConverter}) : _scheduleConverter = scheduleConverter;

  final ScheduleConverter _scheduleConverter;

  Future<void> getGroupSchedule() async {
    ScheduleResponse response = await _scheduleConverter.getGroupSchedule(
      "Б9122-01.03.02сп",
      DateTime.now().subtract(Duration(days: 1)),
      DateTime.now().add(Duration(days: 1)),
    );

    logger.i(response.status);
  }
}
