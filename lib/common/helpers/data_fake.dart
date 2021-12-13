class MenuPersonal{
  final int id;
  final String title;
  final String icon;
  const MenuPersonal( {
    required this.id,
    required this.title,
    required this.icon,
  });
}
class TimeModel {
  final int id;
  final String time;
  const TimeModel({
    required this.id,
    required this.time,
  });
}
const List<MenuPersonal> listMenuPersonal =[
  MenuPersonal(id: 1, title: "Thông tin cá nhân", icon: "assets/icons/ic_information_personal.svg"),
  MenuPersonal(id: 2, title: "Danh sách liên quan", icon: "assets/icons/ic_list_order.svg"),
  MenuPersonal(id: 3, title: "Đổi mật khẩu", icon: "assets/icons/ic_change_password.svg"),
  MenuPersonal(id: 4, title: "Cài đặt ứng dụng", icon: "assets/icons/ic_setting.svg"),
];
const List<String> listday = ['01','02','03','04','05','06','07','08','09','10','11','12','13','14','15',
  '16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31'];
const List<String> listmonth = ['01','02','03','04','05','06','07','08','09','10','11','12'];

const List<TimeModel> listTime = [
  TimeModel(id: 1, time: "10:00"),
  TimeModel(id: 2, time: "16:00"),
  TimeModel(id: 3, time: "10:30"),
  TimeModel(id: 4, time: "16:30"),
  TimeModel(id: 5, time: "11:00"),
  TimeModel(id: 6, time: "17:00"),
  TimeModel(id: 7, time: "11:30"),
  TimeModel(id: 8, time: "17:30"),
];