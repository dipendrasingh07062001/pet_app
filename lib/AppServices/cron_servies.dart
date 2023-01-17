import 'package:cron/cron.dart';

import '../Api/Services.dart';

cron_services() {
  final cron = Cron();
  cron.schedule(Schedule.parse('*/1 * * * *'), () async {
    print('every three minutes');
    await getreminderData();
  });
}
