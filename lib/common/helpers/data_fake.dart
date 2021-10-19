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
const List<MenuPersonal> listMenuPersonal =[
  MenuPersonal(id: 1, title: "Thông tin cá nhân", icon: "assets/icons/ic_information_personal.svg"),
  MenuPersonal(id: 2, title: "Danh sách liên quan", icon: "assets/icons/ic_list_order.svg"),
  MenuPersonal(id: 3, title: "Đổi mật khẩu", icon: "assets/icons/ic_change_password.svg"),
  MenuPersonal(id: 4, title: "Cài đặt ứng dụng", icon: "assets/icons/ic_setting.svg"),

];