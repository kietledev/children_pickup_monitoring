import 'dart:async';

import 'package:children_pickup_monitoring/common/constants/color_constants.dart';
import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/presentation/blocs/message_detail/message_detail_bloc.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:record/record.dart';

int page = 1;

class MessageDetailPage extends StatelessWidget {
  const MessageDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final conversation =
        ModalRoute.of(context)!.settings.arguments as Conversation;
    final message = conversation.lastMessage;
    return BlocProvider<MessageDetailBloc>(
      create: (_) => injector<MessageDetailBloc>()
        ..add(DownloadMessageDetail(
            personId: 4, groupId: message!.messageGroupId!, page: page)),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBar(context),
        body: const MessageDetailBody(),
      ),
    );
  }
}

AppBar appBar(BuildContext context) {
  return AppBar(
    leading: Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset('assets/icons/ic_back_appbar.svg', width: 28),
      ),
    ),
    actions: [
      Container(
        height: 36,
        width: 36,
        margin: const EdgeInsets.only(left: 55),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Image.asset('assets/images/Avatar.png'),
      ),
      Expanded(
        child: Container(
          margin: const EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Đoàn Ngọc Viên',
                style: Utils.setStyle(
                    color: ColorConstants.neutralColor1,
                    weight: FontWeight.w600),
              ),
              const SizedBox(height: 0),
              Visibility(
                  child: Row(
                children: [
                  Container(
                    height: 15,
                    margin: const EdgeInsets.only(right: 6),
                    width: 15,
                    decoration: BoxDecoration(
                      color: const Color(0xFF5AD439),
                      border: Border.all(color: Colors.white, width: 2.5),
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                  ),
                  Text(
                    'Trực tuyến',
                    style: Utils.setStyle(
                        color: ColorConstants.neutralColor2, size: 12),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
      const SizedBox(width: 16),
      buildActionAppbar(press: () {}, icon: 'assets/icons/ic_phone.svg'),
      buildActionAppbar(press: () {}, icon: 'assets/icons/ic_gallery.svg'),
      const SizedBox(width: 16)
    ],
  );
}

GestureDetector buildActionAppbar({
  required VoidCallback press,
  required String icon,
}) {
  return GestureDetector(
    onTap: press,
    child: Container(
      width: 19,
      height: 19,
      margin: const EdgeInsets.only(left: 8, right: 8),
      child: SvgPicture.asset(
        icon,
        color: const Color(0xFF2D5ACD),
      ),
    ),
  );
}

class MessageDetailBody extends StatefulWidget {
  const MessageDetailBody({
    Key? key,
  }) : super(key: key);

  @override
  State<MessageDetailBody> createState() => _MessageDetailBodyState();
}

class _MessageDetailBodyState extends State<MessageDetailBody>
    with TickerProviderStateMixin {
  late TextStyle styleMessage1;
  late TextStyle styleMessage2;
  late MessageDetailBloc bloc;
  late CustomKeyboardListener _keyboardListener;
  late double constantHeight = 0;
  late double defaulHeight = 0;
  bool _onFocus = false;
  bool _hasValue = false;
  bool _showGallery = false;
  bool _isRecording = false;

  int _recordDuration = 0;
  int _timeDuration = 0;
  Timer? _timer;
  Timer? _ampTimer;
  final _audioRecorder = Record();

  final String unsent = 'assets/icons/ic_unsent.svg';
  final String sent = 'assets/icons/ic_sent.svg';
  final String received = 'assets/icons/ic_received.svg';
  String path = '';

  final FocusNode _focusNode = FocusNode();
  final TextEditingController _messageController = TextEditingController();

  List<Message> _listMessages = [];
  List<AssetEntity> _assets = [];
  List<double> _listAmp = [];

  @override
  void initState() {
    super.initState();

    styleMessage1 =
        Utils.setStyle(color: ColorConstants.neutralColor1, size: 17);
    styleMessage2 = Utils.setStyle(color: ColorConstants.neutralColor1);
    bloc = BlocProvider.of<MessageDetailBloc>(context);
    _keyboardListener = CustomKeyboardListener()
      ..addListener(onChange: _keyboardHandle);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _messageController.dispose();
    _keyboardListener.dispose();
    _timer?.cancel();
    _ampTimer?.cancel();
    _audioRecorder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        KeyboardUtil.hideKeyboard(context);
        bloc.add(MoreHeightEvent(moreHeight: false));
        _showGallery = false;
      },
      child: Column(
        children: [
          buildListMessages(),
          buildInputActions(),
          buildGallery(),
        ],
      ),
    );
  }

  Expanded buildListMessages() {
    return Expanded(
      child: BlocBuilder<MessageDetailBloc, MessageDetailState>(
        builder: (context, state) {
          if (state is ListMessageState) {
            if (state.status == ListMessageStatus.success) {
              _listMessages.addAll(state.messages!);
            } else if (state.status == ListMessageStatus.add) {
              _listMessages.insert(0, state.messages![0]);
              if (defaulHeight == 0) {
                bloc.add(InputEvent(
                    onFocus: false,
                    hasValue: false,
                    showGallery: _showGallery));
              } else {
                if (_isRecording) {
                  bloc.add(InputEvent(
                      onFocus: false,
                      hasValue: false,
                      showGallery: _showGallery));
                } else {
                  bloc.add(InputEvent(
                      onFocus: true,
                      hasValue: false,
                      showGallery: _showGallery));
                }
              }
            } else {}
          }
          return AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
            reverseDuration: const Duration(milliseconds: 300),
            vsync: this,
            child: ListView.builder(
              itemCount: _listMessages.length,
              reverse: true,
              itemBuilder: (context, index) {
                const int personId = 4;
                final item = _listMessages[index];
                if (item.createdByPersonId == personId) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 1),
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.7),
                        decoration: BoxDecoration(
                          color: ColorConstants.primaryColor2,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6.5),
                          child: Text(item.messageContent!,
                              style: styleMessage1, softWrap: true),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        margin: const EdgeInsets.only(right: 18, bottom: 1),
                        child: SvgPicture.asset(
                          sent,
                          width: 12,
                          height: 12,
                        ),
                      )
                    ],
                  );
                } else {
                  return Row(
                    children: [
                      const SizedBox(width: 12),
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Image.asset('assets/images/Avatar.png'),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 1),
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.7),
                        decoration: BoxDecoration(
                          color: ColorConstants.primaryColor2,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6.5),
                          child: Text(item.messageContent!,
                              style: styleMessage1, softWrap: true),
                        ),
                      ),
                      const SizedBox(width: 18)
                    ],
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }

  Widget buildInputActions() {
    return BlocBuilder<MessageDetailBloc, MessageDetailState>(
        builder: (context, state) {
      if (state is InputState) {
        _onFocus = state.onFocus!;
        _hasValue = state.hasValue!;
        _showGallery = state.showGallery!;
        _isRecording = state.isRecording!;

        if (!_showGallery) {
          bloc.add(GalleryEvent(show: false));
        }
      }
      return Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
        if (!_isRecording)
          if (_onFocus)
            GestureDetector(
              onTap: () {
                bloc.add(
                  InputEvent(
                      onFocus: !_onFocus,
                      hasValue: _hasValue,
                      showGallery: _showGallery),
                );
              },
              child: Container(
                height: 52,
                color: Colors.transparent,
                margin: const EdgeInsets.only(left: 16, right: 12),
                child: Container(
                  margin: const EdgeInsets.only(left: 16, right: 12),
                  child: SvgPicture.asset(
                    'assets/icons/ic_right.svg',
                    height: 18,
                    width: 9,
                  ),
                ),
              ),
            )
          else
            Row(
              children: [
                const SizedBox(width: 3),
                buildAction(press: () {}, icon: 'assets/icons/ic_menu_dot.svg'),
                buildAction(
                    press: () {
                      openCamera();
                    },
                    icon: 'assets/icons/ic_camera_chat.svg'),
                buildAction(
                    press: () {
                      openGallery();
                    },
                    icon: 'assets/icons/ic_picture_chat.svg'),
                buildAction(
                    press: () {
                      _startRecording();
                    },
                    icon: 'assets/icons/ic_microphone_chat.svg'),
              ],
            ),
        Expanded(
          child: Container(
            key: const Key('buildInputText'),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(children: [
                buildInputText(),
                AnimatedContainer(
                  color: Colors.white,
                  duration: const Duration(seconds: 5),
                  curve: Curves.fastOutSlowIn,
                  child: _isRecording
                      ? Row(
                          children: [
                            const SizedBox(width: 5),
                            GestureDetector(
                                onTap: () {
                                  _stopRecording(callback: (String path) {
                                    // bloc.add(AddNewMessage(message: path));
                                  });
                                },
                                child: const Icon(Icons.delete,
                                    color: Colors.red, size: 28)),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                height: 36,
                                decoration: BoxDecoration(
                                  color: ColorConstants.brandColor,
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Spacer(),
                                    _buildTimer(),
                                    const SizedBox(width: 12)
                                  ],
                                ),
                              ),
                            ),
                            // _buildTimer()
                          ],
                        )
                      : null,
                ),
              ]),
            ),
          ),
        ),

        Visibility(
          visible: getBoolValueForSend(),
          child: GestureDetector(
            onTap: () {
              if (_messageController.text.trim().isNotEmpty) {
                bloc.add(AddNewMessage(
                    message: createMessage(
                        messageContent: _messageController.text.trim())));
                _messageController.clear();
              } else if (_isRecording) {
                _stopRecording(callback: (String path) {
                  bloc.add(AddNewMessage(
                      message: createMessage(messageContent: path)));
                });
              }
            },
            child: Container(
              height: 52,
              color: Colors.transparent,
              child: Container(
                margin: const EdgeInsets.only(left: 16, right: 15.5),
                child: SvgPicture.asset(
                  'assets/icons/ic_send_message.svg',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: !getBoolValueForSend(),
          child: Container(
            margin: const EdgeInsets.only(left: 3, right: 7),
            child: buildAction(press: () {}, icon: 'assets/icons/ic_heart.svg'),
          ),
        ) //
      ]);
    });
  }

  Message createMessage({
    int? messageId,
    int? messageGroupId,
    int? messageTypeId,
    int? messageStateId,
    String? messageContent,
    String? messageContentEn,
    String? userFullName,
    String? userFullNameEn,
    bool? visibled,
    bool? isRemoved,
    String? createdDatetime,
    int? createdByPersonId,
    String? updateDatetime,
    int? updatedByPersonId,
    String? messageGalleryName,
    String? messageGalleryMediaLink,
    String? messageGalleryMediaType,
  }) {
    return Message(
      messageId: messageId,
      messageGroupId: messageGroupId,
      messageTypeId: messageTypeId,
      messageStateId: messageStateId,
      messageContent: messageContent,
      messageContentEn: messageContentEn,
      userFullName: userFullName,
      userFullNameEn: userFullNameEn,
      visibled: visibled,
      isRemoved: isRemoved,
      createdDatetime: createdDatetime,
      createdByPersonId: createdByPersonId,
      updateDatetime: updateDatetime,
      updatedByPersonId: updatedByPersonId,
      messageGalleryName: messageGalleryName,
      messageGalleryMediaLink: messageGalleryMediaLink,
      messageGalleryMediaType: messageGalleryMediaType,
    );
  }

  bool getBoolValueForSend() {
    if (_hasValue || _isRecording) {
      return true;
    } else {
      return false;
    }
  }

  Widget buildGallery() {
    return BlocBuilder<MessageDetailBloc, MessageDetailState>(
        builder: (context, state) {
      if (state is MoreHeightState) {
        if (state.moreHeight) {
          defaulHeight = constantHeight;
        } else {
          defaulHeight = 0;
          bloc.add(InputEvent(
              onFocus: false, hasValue: _hasValue, showGallery: _showGallery));
        }
      } else if (state is GalleryState) {
        if (state.show!) {
          _assets = state.assets!;
          bloc.add(MoreHeightEvent(moreHeight: true));
        } else {
          _assets.clear();
        }
      }

      return AnimatedSize(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        reverseDuration: const Duration(milliseconds: 250),
        // vsync: this,
        child: SizedBox(
          height: defaulHeight,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 2, mainAxisSpacing: 2),
            itemCount: _assets.length,
            itemBuilder: (_, index) {
              return AssetThumbnail(asset: _assets[index]);
            },
          ),
        ),
      );
    });
  }

  Widget buildInputText() {
    return TextFormField(
      onChanged: (value) {
        if (!_isRecording) {
          value = value.trim();
          if (value.isNotEmpty) {
            bloc.add(InputEvent(
                onFocus: true, hasValue: true, showGallery: _showGallery));
          } else {
            bloc.add(InputEvent(
                onFocus: false, hasValue: false, showGallery: _showGallery));
          }
        }
      },
      onTap: () {
        _showGallery = false;
        _assets.clear();
        if (!_onFocus) {
          bloc.add(InputEvent(
              onFocus: true, hasValue: _hasValue, showGallery: _showGallery));
        }
      },
      autofocus: true,
      focusNode: _focusNode,
      minLines: 1,
      maxLines: _onFocus ? 6 : 1,
      style: styleMessage1,
      controller: _messageController,
      cursorColor: const Color(0xFF24272E),
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        hintText: "Aa",
        fillColor: const Color(0xFFF3F5FF),
        contentPadding:
            const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(18),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(18),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(18),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(18),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }

  Widget buildAction({required VoidCallback press, required String icon}) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: 52,
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.only(left: 13, right: 13),
          child: SvgPicture.asset(icon),
        ),
      ),
    );
  }

  void _keyboardHandle(bool isVisible) {
    if (isVisible) {
      final EdgeInsets viewInsets = EdgeInsets.fromWindowPadding(
          WidgetsBinding.instance!.window.viewInsets,
          WidgetsBinding.instance!.window.devicePixelRatio);
      if (constantHeight == 0 && viewInsets.bottom != 0) {
        constantHeight = viewInsets.bottom;
        bloc.add(MoreHeightEvent(moreHeight: true));
      } else if (constantHeight != 0) {
        bloc.add(MoreHeightEvent(moreHeight: true));
      } else {
        if (_showGallery) {
          bloc.add(MoreHeightEvent(moreHeight: true));
        } else {
          bloc.add(MoreHeightEvent(moreHeight: false));
        }
      }
    }
  }

  void openCamera() {
    KeyboardUtil.hideKeyboard(context);
    Navigator.pushNamed(context, RouteConstants.camera).then((value) {
      bloc.add(AddNewMessage(
          message: createMessage(messageContent: value.toString())));
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  void openGallery() {
    if (_showGallery) {
      bloc.add(GalleryEvent(show: false));
      FocusScope.of(context).requestFocus(_focusNode);
    } else {
      KeyboardUtil.hideKeyboard(context);
      bloc.add(GalleryEvent(show: true));
    }
    _showGallery = !_showGallery;
  }

  Future<void> _startRecording() async {
    try {
      _isRecording = await _audioRecorder.hasPermission();
      if (_isRecording) {
        await _audioRecorder.start();
        bloc.add(InputEvent(
            onFocus: _onFocus,
            hasValue: _hasValue,
            showGallery: _showGallery,
            isRecording: _isRecording));

        _timeDuration = 0;
        _recordDuration = 0;

        _startTimer();
      } else {
        //Get permision
      }
    } catch (e) {
      print(e);
    }
  }

  Widget _buildTimer() {
    return BlocBuilder<MessageDetailBloc, MessageDetailState>(
        builder: (context, state) {
      if (state is AmplitudeState) {
        if (state.recordDuration % 1000 == 0) {
          _timeDuration = state.recordDuration ~/ 1000;
        }

        _listAmp.add(state.currentAmplitude);
      } else {
        _timeDuration = 0;
        _listAmp.clear();
      }
      final String minutes = _formatNumber(_timeDuration ~/ 60);
      final String seconds = _formatNumber(_timeDuration % 60);
      return Text(
        '$minutes : $seconds',
        style: Utils.setStyle(color: Colors.white, size: 12),
      );
    });
  }

  String _formatNumber(int number) {
    String numberStr = number.toString();
    if (number < 10) {
      numberStr = '0$numberStr';
    }

    return numberStr;
  }

  Future<void> _stopRecording({required Function callback}) async {
    _timer?.cancel();
    _ampTimer?.cancel();
    final String? path = await _audioRecorder.stop();

    // widget.onStop(path!);

    bloc.add(InputEvent(
        onFocus: _onFocus,
        hasValue: _hasValue,
        showGallery: _showGallery,
        isRecording: false));
    callback(path);
  }

  void _startTimer() {
    _timer?.cancel();
    _ampTimer?.cancel();

    _ampTimer =
        Timer.periodic(const Duration(milliseconds: 200), (Timer t) async {
      _recordDuration = _recordDuration + 200;
      final Amplitude _amplitude = await _audioRecorder.getAmplitude();
      bloc.add(AmplitudeEvent(_amplitude.current, _recordDuration.toDouble()));
    });
  }
}
