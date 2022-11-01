import 'package:flutter/material.dart';

class HeroExample extends StatefulWidget {
  HeroExample({super.key});

  @override
  State<HeroExample> createState() => _HeroExampleState();
}

class _HeroExampleState extends State<HeroExample> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                height: 40,
                minWidth: 80,
                color: Colors.purple,
                onPressed: () {
                  setState(() {
                    index = 0;
                  });
                },
                child: Text("Tap 1"),
              ),
              MaterialButton(
                height: 40,
                minWidth: 80,
                color: Colors.purple,
                onPressed: () {
                  setState(() {
                    index = 1;
                  });
                },
                child: Text("Tap 2"),
              ),
            ],
          ),
          index == 0
              ? Tap1()
              : index == 1
                  ? Tap2()
                  : Container()
        ],
      ),
    );
  }
}

class Tap1 extends StatelessWidget {
  const Tap1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("ewdew"),
        Text("datdededa"),
        Text("ddddd"),
        Text("dsdsdsds"),
        Text("ddsss"),
        Text("ssdcdscs"),
        Text("dcdscsc"),
        Text("dcdscdsc"),
      ],
    );
  }
}

class Tap2 extends StatelessWidget {
  const Tap2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("data"),
        Text("data"),
        Text("data"),
        Text("data"),
        Text("data"),
        Text("data"),
        Text("data"),
        Text("data"),
      ],
    );
  }
}
