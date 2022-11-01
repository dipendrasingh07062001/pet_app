import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Screens/Add_Pets/addpet1.dart';
import 'package:pet_app/Screens/EditPet/EditPage.dart';
import 'package:provider/provider.dart';
import '../../Provider/ServiceListProvider.dart';
import '../../UTILS/Utils.dart';

class PetsModal {
  final String petName, ImageUrl;

  PetsModal(
    this.petName,
    this.ImageUrl,
  );
}

class EditPet1 extends StatefulWidget {
  const EditPet1({super.key});

  @override
  State<EditPet1> createState() => _EditPet1State();
}

class _EditPet1State extends State<EditPet1> {
  static List<String> petName = ["Dog", "Cat", "Rabit", "Tutorail"];

  static List url = [
    "assets/svg_icon/icon(2).svg",
    "assets/svg_icon/dfd7003b99a2c504402a0b89dc258c99.svg",
    "assets/svg_icon/icon.svg",
    "assets/svg_icon/icon.svg",
  ];

  final List<PetsModal> PetDetails = List.generate(petName.length,
      (index) => PetsModal('${petName[index]}', '${url[index]}'));

  var h;
  var w;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    print("===" + type2.toString());

    return Stack(
      children: [
        Consumer<AddPetProvider>(
            builder: (BuildContext context, value, Widget? child) {
          value.selectedpet = type2.toString();
          return Padding(
            padding: EdgeInsets.only(top: h * 0.09),
            child: GridView.builder(
              //  physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  crossAxisCount: 2,
                  childAspectRatio: 1),
              itemCount: petName.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      value.selectedpet = petName.elementAt(index);
                      type2 = petName.elementAt(index);
                      // value.addPetModel.type = petName.elementAt(index);
                      // type = value.addPetModel.type;
                      // print('===' + value.addPetModel.type.toString());
                      // print("petName " + value.selectedpet);
                    });
                  },
                  child: Card(
                      color: petName.elementAt(index) == value.selectedpet
                          ? GREEN_CLR
                          : WHITE_CLR,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            PetDetails[index].ImageUrl,
                            height: h * 0.070,
                            color: petName.elementAt(index) == value.selectedpet
                                ? WHITE_CLR
                                : GRAY_CLR,
                          ),
                          SizedBox(
                            height: h * 0.020,
                          ),
                          styleText(
                              PetDetails[index].petName,
                              petName.elementAt(index) == value.selectedpet
                                  ? WHITE_CLR
                                  : GRAY_CLR,
                              FontWeight.normal,
                              16)
                        ],
                      )),
                );
              },
            ),
          );
        }),
      ],
    );
  }
}
