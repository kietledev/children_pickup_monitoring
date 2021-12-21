
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/common/helpers/preferences.dart';
import 'package:children_pickup_monitoring/data/models/class_room_model.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/domain/entities/staff_class_detail.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DropdownSelectedClassroomByTeacher<T>   extends StatefulWidget {
  final bool selected;
  final ValueChanged<List<int>> onSelect;
  final bool hideDropdownUnderline;
  final String? dropdownTitleTileHintText;
  final String? dropdownTitleTileText;
  final DropdownStyle dropdownStyle;
  final List<ClassRoomModel> items;
  final Widget expandedIcon;
  final Widget collapsedIcon;
  final List<StaffClassDetail> listStaffClassDetail;
  DropdownSelectedClassroomByTeacher({
    required this.items,
    required this.listStaffClassDetail,
    required this.onSelect,
    this.selected = false,
    this.hideDropdownUnderline = false,
    this.dropdownTitleTileHintText,
    this.dropdownTitleTileText,
    this.expandedIcon = const Icon(
      Icons.keyboard_arrow_down,
      color: ColorConstants.brandColor,
      size: 24,
    ),
    this.collapsedIcon = const Icon(
      Icons.keyboard_arrow_up,
      color: ColorConstants.brandColor,
      size: 24,
    ),
    this.dropdownStyle = const DropdownStyle(),
  });
  @override
  State<StatefulWidget> createState() => _DropdownSelectedClassroomByTeacher();
}
class _DropdownSelectedClassroomByTeacher extends State<DropdownSelectedClassroomByTeacher> with TickerProviderStateMixin {
  bool showDropdown = false;
  final LayerLink _layerLink = LayerLink();
  final List _selectedTitles = [];
  final List<int> _selectedTitlesIndex = [];
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  late Animation<double> _rotateAnimation;
  bool _isScroll = true;
  bool _isOpen = false;
  final _controller = TextEditingController();
  OverlayEntry? _overlayEntry;
  @override
  void initState() {
    super.initState();
     for( int i =0; i <widget.listStaffClassDetail.length;i++){
       _selectedTitles.add(widget.listStaffClassDetail[i].className!);
       _selectedTitlesIndex.add(widget.listStaffClassDetail[i].classId!.toInt());

     }
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _rotateAnimation = Tween(begin: 0.0, end: 0.5).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

  }
  void _onItemSelect(bool selected, int index) {
    if (selected == true) {
      setState(() {
        _selectedTitles.add(widget.items[index].className);
        _selectedTitlesIndex.add(widget.items[index].classId!);
      });
    } else {
      setState(() {
        _selectedTitles.remove(widget.items[index].className);
        _selectedTitlesIndex.remove(widget.items[index].classId);
      });
    }
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Widget dropdownTile() => Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _selectedTitles.isEmpty
            ? Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(widget.dropdownTitleTileText!,
                  style: TextStyle(fontSize: 14, color: ColorConstants.neutralColor2,fontFamily: FontsConstants.notoSans)),
            ))
            : Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(_selectedTitles.join(',').toString(),
                  style: TextStyle(fontSize: 14, color: ColorConstants.neutralColor1, fontFamily: FontsConstants.notoSans)),
            )),
        !_isOpen ? widget.expandedIcon : widget.collapsedIcon,

      ],
    );
    return CompositedTransformTarget(
      link: this._layerLink,
      child: Column(
        children: [
          InkWell(
            onTap: (){
              setState(() {
                _isScroll = false;
                final prefs = Preferences();
                prefs.setIsScroll(_isScroll);
                _toggleDropdown();
              });
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(6)
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: widget.hideDropdownUnderline
                      ? const Border(
                      bottom: BorderSide(color: Colors.transparent))
                      : Border(bottom: BorderSide(color: Colors.transparent, width: 2),),
                ),
                child: widget.dropdownTitleTileHintText == null
                    ? dropdownTile()
                    : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.dropdownTitleTileHintText}',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    dropdownTile(),
                    const SizedBox(
                      height: 2,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject()! as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);
    var topOffset = offset.dy + size.height + 5;
    return OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: (){
          _toggleDropdown(close: true);
        },
        behavior: HitTestBehavior.translucent,
        child: StatefulBuilder(
          builder: (context,setState){
            return Stack(
              children: [
                Positioned(
                  left: offset.dx,
                  top: topOffset,
                  width: widget.dropdownStyle.width ?? size.width,
                  child:Material(
                      elevation: 3,
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      child: (widget.items.length == 0)
                          ? Container(
                        height: 120,
                        child: Center(
                          child: Text("Không có dữ liệu"),
                        ),
                      )
                          : Container(
                        height: 120,
                        child: ScrollConfiguration(
                          behavior: MyBehavior(),
                          child: ListView.builder(
                              padding: EdgeInsets.all(1),
                              itemCount: widget.items.length,
                              itemBuilder: (context,index){
                                return CheckboxListTile(
                                    title:Text("${widget.items[index].className}",style: TextStyle(fontSize: 14, color: ColorConstants.neutralColor1, fontFamily: FontsConstants.notoSans),),
                                    value: _selectedTitles.contains(widget.items[index].className),
                                    selected: widget.selected,
                                    onChanged: (bool? selected){
                                      setState(() {
                                        _controller.text;
                                        _onItemSelect(selected!, index);
                                        widget.onSelect(_selectedTitlesIndex);
                                      });
                                    }
                                );
                              }
                          ),
                        ),
                      )
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
  void _toggleDropdown({bool close = false}) async {
    if (_isOpen || close) {
      await _animationController.reverse();
      this._overlayEntry!.remove();
      setState(() {
        _isOpen = false;
        _isScroll = true;
        final prefs = Preferences();
        prefs.setIsScroll(_isScroll);
      });
    } else {
      this._overlayEntry = this._createOverlayEntry();
      Overlay.of(context)!.insert(this._overlayEntry!);
      setState(() => _isOpen = true);
      _animationController.forward();
    }
  }
}
