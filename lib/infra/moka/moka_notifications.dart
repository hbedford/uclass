import 'package:uclass/domain/entities/notificationinfo.dart';

class MokaNotifications {
  List<NotificationInfo> notifications = [
    NotificationInfo(
        date: DateTime(2021, 02, 02),
        id: 0,
        title: 'Reagendamento de Prova',
        message:
            'Por motivo de satanas, a prova de BOTAR FOGO NO FLUTTER foi reagendada para 01/03/2021',
        view: false,
        disable: false),
    NotificationInfo(
        date: DateTime(2021, 01, 02),
        id: 1,
        title: 'Data final para realização de exercicio',
        message:
            'A data final para o exercicio Fazer churrasco esta chegando ao fim.O ultimo dia é 04/02/2021',
        view: false,
        disable: false),
  ];
}
