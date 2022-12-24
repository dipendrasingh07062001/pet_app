import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_app/Api/ApiBaseUrl.dart';
import 'package:pet_app/Api/Models/addPetModel.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:provider/provider.dart';
import '../../Provider/Provider.dart';
import '../../Provider/ServiceListProvider.dart';
import '../../UTILS/Utils.dart';

class PetsModal {
  final String petName, ImageUrl;

  PetsModal(
    this.petName,
    this.ImageUrl,
  );
}

var type;

class AddPets extends StatefulWidget {
  const AddPets({super.key});

  @override
  State<AddPets> createState() => _AddPetsState();
}

class _AddPetsState extends State<AddPets> {
  static List<String> petName = ["Dog", "Cat", "Rabit", "Tutorail"];
  String selectedpet = "";

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

    return Stack(
      children: [
        Padding(
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
                  selectedpet = petName.elementAt(index);
                  context.read<CurrentPage>().onpettap(selectedpet);
                  // AddPetModel.type = selectedpet;
                  // context.read<CurrentPage>().controller.nextPage(
                  //       duration: Duration(milliseconds: 300),
                  //       curve: Curves.ease,
                  //     );
                  // context.read<CurrentPage>().currentIndex++;
                  // addPetModel.type = petName.elementAt(index);
                  // type = addPetModel.type;
                  // print("==" + type);
                  // print('===' + addPetModel.type.toString());

                  // print("petName " + value.selectedpet);
                },
                child: Card(
                    color: petName.elementAt(index) == selectedpet ||
                            petName.elementAt(index) == AddPetModel.type
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
                          color: petName.elementAt(index) == selectedpet ||
                                  petName.elementAt(index) == AddPetModel.type
                              ? WHITE_CLR
                              : GRAY_CLR,
                        ),
                        SizedBox(
                          height: h * 0.020,
                        ),
                        styleText(
                            PetDetails[index].petName,
                            petName.elementAt(index) == selectedpet ||
                                    petName.elementAt(index) == AddPetModel.type
                                ? WHITE_CLR
                                : GRAY_CLR,
                            FontWeight.normal,
                            16)
                      ],
                    )),
              );
            },
          ),
        )
      ],
    );
  }
}
