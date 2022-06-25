import 'dart:async';

import 'package:flutter/material.dart';
import 'package:leepy/values/colors.dart';
import 'package:leepy/values/strings.dart';
import 'package:lottie/lottie.dart';

import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer = Timer.periodic(const Duration(), (timer) {});

  final HomeController _controller = HomeController();
  final _minuteTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: AppColors.primaryColor,
        elevation: 2,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                AppColors.gradienteColor1,
                AppColors.gradienteColor2,
              ],
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/moon.json',
              width: MediaQuery.of(context).size.width * 0.17,
            ),
            const Text(
              Strings.leepy,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              AppColors.gradienteColor1,
              AppColors.gradienteColor2,
            ],
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              Strings.sleepAfter,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.05,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: TextField(
                keyboardType: TextInputType.number,
                enabled: true,
                controller: _minuteTextController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: Strings.minuteHint,
                ),
                onSubmitted: (_) {
                  _controller.isActive = true;
                  _controller.duration =
                      double.parse(_minuteTextController.text);
                  _controller.timerfunc();
                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, _) => Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: CircularProgressIndicator(
                        backgroundColor: AppColors.white,
                        color: AppColors.primaryColor,
                        value: (_controller.start / _controller.duration)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Text(
                    _controller.start.toString(),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.primaryColor,
                    ),
                    onPressed: _controller.isActive
                        ? () => _controller.stopTimer()
                        : null,
                    child: const Text(Strings.cancelTimer),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _minuteTextController.dispose();
    _controller.dispose();
    super.dispose();
  }
}
