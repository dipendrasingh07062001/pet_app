import 'package:flutter/material.dart';

class BotomSeetopen extends StatefulWidget {
  const BotomSeetopen({super.key});

  @override
  State<BotomSeetopen> createState() => _BotomSeetopenState();
}

class _BotomSeetopenState extends State<BotomSeetopen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: () {
          setState(() {
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                context: context,
                builder: (ctx) => Demo());
          });
        },
        color: Colors.purple,
        child: const Text("open seet"),
      ),
    );
  }
}

class Demo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DemoState();
}

class DemoState extends State<Demo> with SingleTickerProviderStateMixin {
  String? birthDateInString;
  DateTime? birthDate;
  int index = 0;

  bool _isExpended1 = false;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Container(
          height: 700,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16))),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text("Establishment Information",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            SizedBox(
                height: 600,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Container(
                          // height: Get.height*0.085,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                          child: ExpansionTile(
                            onExpansionChanged: (b) {
                              setState(() {
                                _isExpended1 = !_isExpended1;
                              });
                            },
                            title: const Text("Clause one",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                )),
                            trailing: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Icon(_isExpended1
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down),
                            ),
                            children: [
                              Divider(
                                height: 1,
                                color: Colors.black.withOpacity(0.3),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 50),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 15, left: 15),
                                              child: Text(
                                                "Clause Clasification",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10, left: 15),
                                              child: Text(
                                                "LVE-272",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10, left: 15),
                                              child: Text(
                                                "Risk",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              height: 22,
                                              width: 70,
                                              margin: const EdgeInsets.only(
                                                  left: 10, top: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Colors.red
                                                      .withOpacity(0.1)),
                                              child: const Text(
                                                "Risk: 2",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.red,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10, left: 15),
                                              child: Text(
                                                "Picture",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    top: 15, left: 15),
                                                child: Text(
                                                  "Sub Clause name",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 10, left: 15),
                                                child: Text(
                                                  "${birthDateInString.toString()}",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    top: 10, left: 15),
                                                child: Text(
                                                  "Comments ",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    top: 10, left: 15),
                                                child: SizedBox(
                                                  width: 135,
                                                  child: Text(
                                                    "Main Occupancy",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        GestureDetector(
                                            child: const Icon(
                                                Icons.calendar_today),
                                            onTap: () async {
                                              final datePick =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
                                                      firstDate: DateTime(1900),
                                                      lastDate: DateTime(2100));
                                              if (datePick != null &&
                                                  datePick != birthDate) {
                                                setState(() {
                                                  birthDate = datePick;
                                                  // isDateSelected = true;

                                                  birthDateInString =
                                                      "${birthDate!.month}/${birthDate!.day}/${birthDate!.year}"; // 08/14/2019
                                                });
                                              }
                                            }),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                              'assets/png_image/profile.png'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                              'assets/png_image/profile.png'),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    })),
          ]));
    });
  }
}
