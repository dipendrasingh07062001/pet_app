import 'package:flutter/material.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/UTILS/Utils.dart';
import '../../Api/Models/My_pet_model.dart';
import '../../Api/Services.dart';
import '../../Componants/Images&Icons.dart';
import '../Add_Pets/addPet.dart';

class My_Pets extends StatefulWidget {
  const My_Pets({super.key});

  @override
  State<My_Pets> createState() => _My_PetsState();
}

class _My_PetsState extends State<My_Pets> {
  MyPetModel result = MyPetModel();

  bool isloading = false;

  @override
  void initState() {
    super.initState();
    mypetApi().then((value) {
      setState(() {
        result = value;
        print(result.mypetdata.toString());
      });
    });
  }

  var h;
  var w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: WHITE70_CLR,
      appBar: DefaultAppBar(MY_PET),
      floatingActionButton: FloatingActionButton(
        backgroundColor: WHITE70_CLR,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            side: BorderSide(color: GREEN_CLR)),
        onPressed: () {
          Navigate_to(context, const AddPetpage());
        },
        child: Icon(
          Icons.add,
          size: 40,
          color: GREEN_CLR,
        ),
        heroTag: "b1",
      ),
      body: result.mypetdata == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.only(top: 10, left: 15),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: result.mypetdata?.length,
                  itemBuilder: (BuildContext context, int index) {
                    // print("======" + result.mypetdata![index].name.toString());
                    return Stack(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                right: w * 0.030,
                                top: h * 0.055,
                                bottom: h * 0.020,
                                left: w * 0.3),
                            child: Container(
                              // height: h*0.45,
                              width: w * 0.6,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: DROP_CLR.withOpacity(0.2),
                                        blurRadius: 10)
                                  ]),
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: w * 0.028,
                                      right: w * 0.01,
                                      top: h * 0.010,
                                      bottom: h * 0.010),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        styleText(
                                            result.mypetdata![index].name
                                                .toString(),
                                            BLACK_CLR,
                                            FontWeight.bold,
                                            16),
                                        styleText(
                                            result.mypetdata![index].parentname
                                                .toString(),
                                            GRAY_CLR,
                                            FontWeight.normal,
                                            13),
                                        styleText(
                                            result.mypetdata![index].gendar
                                                .toString(),
                                            GRAY_CLR,
                                            FontWeight.normal,
                                            13),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            styleText(
                                                result.mypetdata![index].weight
                                                    .toString(),
                                                BLACK_CLR,
                                                FontWeight.normal,
                                                15),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  height: 28,
                                                  width: 28,
                                                  child: GestureDetector(
                                                    onTap: () => Navigate_to(
                                                        context,
                                                        const AddPetpage()),
                                                    child: const CircleAvatar(
                                                      backgroundColor:
                                                          FADE_BLUE_CLR,
                                                      child: Icon(
                                                        Icons.edit,
                                                        color: WHITE70_CLR,
                                                        size: 15,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 28,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      deleteDialog(context, () {
                                                        setState(() {
                                                          deletepetApi(result
                                                                  .mypetdata![
                                                                      index]
                                                                  .id
                                                                  .toString())
                                                              .then((value) {
                                                            mypetApi()
                                                                .then((value) {
                                                              result = value;
                                                              print(result
                                                                  .mypetdata
                                                                  .toString());
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                              setState(() {});
                                                            });
                                                          }).catchError((e) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(SnackBar(
                                                                    backgroundColor:
                                                                        GREEN_CLR,
                                                                    content: Text(
                                                                        e.toString())));
                                                          });
                                                        });
                                                      }, DELETE_PET);
                                                    },
                                                    child: const CircleAvatar(
                                                      backgroundColor:
                                                          FADE_BLUE_CLR,
                                                      child: Icon(
                                                        Icons.delete,
                                                        color: WHITE70_CLR,
                                                        size: 15,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ])),
                            )),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            result.mypetdata![index].image.toString(),
                            width: w * 0.315,
                            height: h * 0.195,
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) {
                              return Container();
                            },
                          ),
                        ),
                      ],
                    );
                  }),
            ),
    );
  }
}
