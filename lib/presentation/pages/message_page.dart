import 'dart:async';

import 'package:children_pickup_monitoring/common/constants/constants.dart';
import 'package:children_pickup_monitoring/common/helpers/helpers.dart';
import 'package:children_pickup_monitoring/data/models/models.dart';
import 'package:children_pickup_monitoring/di/injection.dart';
import 'package:children_pickup_monitoring/domain/entities/entities.dart';
import 'package:children_pickup_monitoring/presentation/blocs/blocs.dart';
import 'package:children_pickup_monitoring/presentation/blocs/message_page/message_page_bloc.dart';
import 'package:children_pickup_monitoring/presentation/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Chat {
  String? name = '';
  String? message = '';
  int? status = 0;
  bool? delete = false;
  bool? online = false;
  String? time = '';
  Chat(
      {this.name,
      this.message,
      this.status,
      this.delete,
      this.online,
      this.time});
}

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MessagePageBloc>(
          create: (BuildContext context) => injector<MessagePageBloc>(),
        ),
      ],
      child: const Scaffold(
        body: SafeArea(
          child: MessageBody(),
        ),
      ),
    );
  }
}

class MessageBody extends StatefulWidget {
  const MessageBody({
    Key? key,
  }) : super(key: key);

  @override
  State<MessageBody> createState() => _MessageBodyState();
}

class _MessageBodyState extends State<MessageBody> {
  final Color active = const Color(0xFFF7931A);

  final Color deactive = const Color(0xFF797D88);

  final String unsent = 'assets/icons/ic_unsent.svg';

  final String sent = 'assets/icons/ic_sent.svg';

  final String received = 'assets/icons/ic_received.svg';

  bool isChat = true;

  bool isContact = false;

  bool isShowDelete = false;

  List<Conversation>? conversations;

  List<Chat> contacts = <Chat>[];

  final GlobalKey<AnimatedListState> conversationListKey = GlobalKey();
  late MessagePageBloc _messagePageBloc;
  UserModel? userModel;
  int personId = -1;
  @override
  void initState() {
    super.initState();
    getUserId();
    _messagePageBloc = BlocProvider.of<MessagePageBloc>(context);

  }
  getUserId() async {
    userModel = await getUser();
    personId = userModel!.personId.toInt();
    _messagePageBloc.add(GetAllConversations(personId: personId, page: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg_body_a.png'),
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
        ),
      ),
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  height: 60,
                  margin: const EdgeInsets.only(top: 16, left: 24, right: 24),
                  child: buildHeaderTab()),
              Container(
                margin: const EdgeInsets.only(
                    left: 24, top: 10, right: 24, bottom: 16),
                height: 36,
                child: CupertinoSearchTextField(
                    padding: const EdgeInsetsDirectional.fromSTEB(4, 6, 5, 8),
                    prefixInsets: const EdgeInsetsDirectional.only(start: 12),
                    backgroundColor: const Color(0xFFE3EEF2),
                    style: Utils.setStyle(color: const Color(0xFF797D88))
                  // focusNode: focusSearch,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                height: 80,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return buildItemHorizontalContact(context, index);
                  },
                ),
              ),
              buildBodyTab(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeaderTab() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 50,
          child: GestureDetector(
            onTap: () {
              setState(() {
                setState(() {
                  if (!isChat) {
                    isContact = isChat;
                    isChat = !isChat;
                  }
                });
              });
            },
            child: Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_message.svg',
                    width: 12,
                    height: 12,
                    color: isChat ? active : deactive,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Chat',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: FontsConstants.notoSans,
                      fontWeight: FontWeight.w600,
                      color: isChat ? active : deactive,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: SvgPicture.asset(
            'assets/icons/ic_line_message.svg',
            height: 24,
          ),
        ),
        Expanded(
          flex: 50,
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (!isContact) {
                  isChat = isContact;
                  isContact = !isContact;
                }
              });
            },
            child: Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_users.svg',
                    width: 12,
                    height: 12,
                    color: isContact ? active : deactive,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Danh bạ',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: FontsConstants.notoSans,
                      fontWeight: FontWeight.w600,
                      color: isContact ? active : deactive,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildBodyTab() {
    return Stack(
      children: [
        Visibility(
          visible: isChat,
          child: Container(
            margin: const EdgeInsets.only(top: 24),
            child: BlocBuilder<MessagePageBloc, MessagePageState>(
              builder: (context, state) {
                if (state is MessagePageLoadingState) {

                }else{
                  if (state is MessagePageSuccessState) {
                    EasyLoading.dismiss();
                    conversations= state.conversations;
                    return AnimatedList(
                      key: conversationListKey,
                      initialItemCount: conversations!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index, animation) {
                        return buildItemChat(context, index, animation);
                      },
                    );
                  }
                }
                return Container();
              },
            ),
          ),
        ),
        Visibility(
          visible: isContact,
          child: Container(
            margin: const EdgeInsets.only(top: 24),
            child: ListView.builder(
              itemCount: contacts.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return buildItemContact(context, index);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget buildItemHorizontalContact(BuildContext context, int indext) {
    return GestureDetector(
      // onTap: () => Navigator.pushNamed(context, ConversationScreen.routeName),
      child: Container(
        width: 52,
        margin: const EdgeInsets.only(right: 37),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: Image.asset('assets/images/Avatar.png'),
                ),
                // ignore: sized_box_for_whitespace
                Container(
                  height: 52,
                  width: 52,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        color: const Color(0xFF5AD439),
                        border: Border.all(color: Colors.white, width: 2.5),
                        borderRadius: BorderRadius.circular(7.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              'Stark',
              style: Utils.setStyle(color: const Color(0xFF24272E), size: 14),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }

  Widget buildItemChat(
      BuildContext context, int index, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: SlideMenu(
        key: UniqueKey(),
        press: () => pushToChatDetail(index),
        menuItems: [
          Container(
            color: Colors.transparent,
            margin: const EdgeInsets.only(bottom: 12),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  removeItemAtIndex(index);
                },
                child: SvgPicture.asset(
                  'assets/icons/ic_delete_circle.svg',
                  width: 40,
                  height: 40,
                ),
              ),
            ),
          ),
        ],
        child: SizedBox(
          height: 88,
          child: Container(
            color: Colors.white,
            margin: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      top: 8, left: 24, right: 12, bottom: 8),
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset('assets/images/Avatar.png'),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        conversations![index].groupTitle! +
                            conversations![index].userFullName!,
                        style: Utils.setStyle(
                            color: const Color(0xFF24272E),
                            weight: FontWeight.w600),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        conversations![index].lastMessage!.messageContent!,
                        style: Utils.setStyle(
                            color: const Color(0xFF797D88), size: 14),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                /*
                Container(
                  height: 52,
                  width: 52,
                  margin: const EdgeInsets.only(right: 12),
                  child: Center(
                    child: SvgPicture.asset(
                      getStatusIcon(conversations[index].status!),
                      width: 16,
                      height: 16,
                    ),
                  ),
                ),
                */
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildItemContact(BuildContext context, int index) {
    return SizedBox(
        height: 72,
        child: GestureDetector(
          onTap: () => pushToChatDetail(index),
          child: Container(
            color: Colors.white,
            margin: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                Container(
                    margin: const EdgeInsets.only(
                        top: 8, left: 24, right: 12, bottom: 8),
                    height: 52,
                    child: buildAvatarContact(index)),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contacts[index].name!,
                        style: Utils.setStyle(
                            color: const Color(0xFF24272E),
                            weight: FontWeight.w600),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  margin: const EdgeInsets.only(right: 14),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/ic_wave_circle.svg',
                      width: 32,
                      height: 32,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget buildAvatarContact(int index) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
          ),
          child: Image.asset('assets/images/Avatar.png'),
        ),
        SizedBox(
          height: 52,
          width: 52,
          child: contacts[index].online!
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 15,
                    margin: const EdgeInsets.only(right: 6),
                    width: 15,
                    decoration: BoxDecoration(
                      color: const Color(0xFF5AD439),
                      border: Border.all(color: Colors.white, width: 2.5),
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                  ),
                )
              : Align(
                  alignment: Alignment.bottomLeft,
                  child: contacts[index].time != null
                      ? Container(
                          margin: const EdgeInsets.only(right: 6, bottom: 1),
                          decoration: BoxDecoration(
                            color: const Color(0xFFC7F0BB).withOpacity(0.8),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(left: 4, right: 4),
                            child: Text(
                              contacts[index].time!,
                              style: const TextStyle(
                                color: Colors.black,
                                fontFamily: FontsConstants.notoSans,
                                fontWeight: FontWeight.w500,
                                fontSize: 8,
                              ),
                            ),
                          ),
                        )
                      : null,
                ),
        ),
      ],
    );
  }

  String getStatusIcon(int status) {
    if (status == 0) {
      return unsent;
    } else if (status == 1) {
      return sent;
    } else {
      return received;
    }
  }

  void removeItemAtIndex(int index) {
    conversationListKey.currentState!.removeItem(
        index, (context, animation) => buildItemChat(context, index, animation),
        duration: const Duration(milliseconds: 250));
    Timer(const Duration(milliseconds: 250), () {
      conversations!.removeAt(index);
    });
  }

  void pushToChatDetail(int index) {
    Navigator.pushNamed(context, RouteConstants.messageDetail, arguments: conversations![index]).then((value) => getUser().then((value) => context.read<MessagePageBloc>().add(GetAllConversations(personId: personId, page: 1))));
  }
}
