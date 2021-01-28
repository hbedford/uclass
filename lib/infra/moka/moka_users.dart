import 'package:uclass/domain/entities/user.dart';

class MokaUsers {
  User userLogin = User(
      id: 2,
      image: 'assets/avatar3.png',
      email: 'marcio@marcio.com.br',
      name: 'Marcio',
      password: '123456',
      phone: '(22)92222-2222',
      type: 1);
  List<User> students = [
    User(
        id: 0,
        image: 'assets/avatar1.png',
        email: 'carlos@carlos.com.br',
        name: 'Carlos',
        password: '123456',
        phone: '(11)91111-1111',
        type: 0),
    User(
        id: 1,
        image: 'assets/avatar2.png',
        email: 'mayara@mayara.com.br',
        name: 'Mayara',
        password: '123456',
        phone: '(00)90000-0000',
        type: 0)
  ];
  List<User> teachers = [
    User(
        id: 2,
        image: 'assets/avatar3.png',
        email: 'marcio@marcio.com.br',
        name: 'Marcio',
        password: '123456',
        phone: '(22)92222-2222',
        type: 1),
    User(
        id: 3,
        image: 'assets/avatar3.png',
        email: 'junior@junior.com.br',
        name: 'Junior',
        password: '123456',
        phone: '(33)93333-3333',
        type: 1),
  ];
}
