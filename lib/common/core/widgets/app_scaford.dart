import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';


class AppScaford<T extends Bloc> extends StatelessWidget {
  const AppScaford(
      {Key? key,
      required this.body,
      this.title,
      this.isScroll = false,
      this.isBack = true,
      this.onReveiveArguments,
      this.onWillPop,
      this.padding = 16,
      this.safeArea = true,
      this.footer})
      : super(key: key);
  final Widget body;
  final String? title;
  final Function(Object params, T bloc)? onReveiveArguments;
  final Function()? onWillPop;
  final bool isScroll;
  final bool isBack;
  final double padding;
  final bool safeArea;
  final Widget? footer;

  Future<bool> _willPopCallback() async {
    onWillPop?.call();
    return Future.value(isBack);
  }

  @override
  Widget build(BuildContext context) {
    final bloc = GetIt.I.get<T>();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && onReveiveArguments != null) {
      onReveiveArguments!(args, bloc);
    }
    return WillPopScope(
      onWillPop: () => _willPopCallback(),
      child: BlocProvider.value(
        value: bloc,
        child: Stack(
          children: [
            Positioned.fill(
              child: Scaffold(
                extendBodyBehindAppBar: true,
                backgroundColor: Colors.white,
                appBar: (title == null || title!.isEmpty)
                    ? null
                    : AppBar(
                        title: Text(title!),
                        centerTitle: true,
                        leading: isBack
                            ? IconButton(
                                icon: const Icon(Icons.arrow_back_ios),
                                onPressed: () => Navigator.pop(context),
                                padding: EdgeInsets.zero,
                              )
                            : const SizedBox(),
                      ),
                body: Container(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  child: SafeArea(
                      top: safeArea,
                      bottom: safeArea,
                      left: safeArea,
                      right: safeArea,
                      child: !isScroll
                          ? (body)
                          : SingleChildScrollView(
                              child: body,
                            )),
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: footer ?? const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
