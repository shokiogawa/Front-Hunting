import 'package:demo_flutter_project/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _homeViewModel = ref.read(homeViewModelProvider);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
              const Color(0xff9941d8).withOpacity(0.7),
              const Color(0xffff4500).withOpacity(0.8),
            ],
                stops: const [
              0.0,
              1.0
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 200),
            const Text(
              "JobSeed",
              style: TextStyle(fontSize: 40, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            const Text(
              "会社の選考状況を一目で確認 ！ \n就活支援アプリ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 150),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: () {
                    Navigator.of(context)
                    .pushNamedAndRemoveUntil(
                        '/main_screen', (route) => false);
                    _homeViewModel.saveIsPassT();
                  },

                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "就職活動を始める。",
                      style: TextStyle(color: Colors.red, fontSize: 17),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
