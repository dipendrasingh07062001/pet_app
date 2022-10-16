import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_app/Screens/Add_Pets/AddPet3.dart';
import 'package:pet_app/SevicesListAll_Screens/Medicines.dart';
import 'package:pet_app/SevicesListAll_Screens/Pregnancy.dart';
import 'package:pet_app/SevicesListAll_Screens/Vactionations.dart';
import 'package:pet_app/UTILS/Utils.dart';
import '../Api/Models/ServiceListModel.dart';
import '../Api/Models/addPetModel.dart';
import '../Api/Services.dart';
import '../Screens/Add_Pets/Add_pet2.dart';
import '../Screens/Add_Pets/addPet1.dart';
import '../Screens/CycleTrackingPageViewBuilder/CycleTracking_Page.dart';
import '../SevicesListAll_Screens/Deworming.dart';
import 'package:pet_app/Screens/CycleTrackingPageViewBuilder/CycleTracking1.dart';
import 'package:pet_app/Screens/CycleTrackingPageViewBuilder/CycleTracking3.dart';
import 'package:pet_app/Screens/CycleTrackingPageViewBuilder/CycleTracking5.dart';
import 'package:pet_app/Screens/CycleTrackingPageViewBuilder/Cycle_Tracking4.dart';
import 'package:pet_app/Screens/CycleTrackingPageViewBuilder/WheelList_CycleTracking2.dart';

////ServiceHelthProvider

class ServiceHealthProvider extends ChangeNotifier {
  // List Service = ["Health", "Vets", "Gromming", "Trainig", "illness"];
  static List<Widget> PageRoute = [
    CycleTrackingPage(),
    Medicines(),
    Vaccinations(),
    Deworming(),
    Pregnancy()
  ];
  ServiceModel servicelistmodel = ServiceModel();
  bool loading = false;
  int currentindex = 0;

  getServicelistdata(BuildContext context) async {
    loading = true;
    servicelistmodel = await servicelistApi();
    loading = false;
    notifyListeners();
  }

  onClickedList(BuildContext context, int index) {
    Navigate_to(context, PageRoute[index]);
    notifyListeners();
  }

  // get data => Service;
  OnTap(int index) {
    currentindex = index;
    notifyListeners();
  }
}

////AddPet PageViewProvider

class AddPetProvider extends ChangeNotifier {
  AddPetModel addPetModel = AddPetModel();

  TextEditingController nameCan = TextEditingController();
  TextEditingController parentNmaeCan = TextEditingController();
  String selectedpet = "";

  String weightDropdoun = 'Weight';
  final weightItems = ['Weight', '10', '20', '30', '40', '50', '60'];
  List text = ["Select Type", "Fill the Details", "Upload Pictures"];
  List<Widget> pages = [const AddPets(), const AddPet2(), const Addpet3()];

  int currentIndex = 0;

  onChangedPage(int value) {
    currentIndex = value;
    notifyListeners();
  }

  String gender = 'male';
  onValueChange(String? index) {
    gender = index ?? gender;
    notifyListeners();
  }

  String day = 'daily';
  dayChangevalue(String? index) {
    day = index ?? day;
    notifyListeners();
  }

////select date

  // DateTime currentdate1 = DateTime.now();
  // Future datechange1(BuildContext context) async {
  //   final DateTime? datechange1 = await showDatePicker(
  //       context: context,
  //       initialDate: currentdate1,
  //       firstDate: DateTime(2001),
  //       lastDate: currentdate1);
  //   if (datechange1 != null) {
  //     currentdate1 = datechange1;
  //   }

  //   notifyListeners();
  // }

  String? selectAtdate;
  DateTime? birthDate;
  Future<void> datePicker(context, String selectAtdate) async {
    final datePick = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (datePick != null && datePick != birthDate) {
      birthDate = datePick;
      selectAtdate =
          "${birthDate!.day}-${birthDate!.month}-${birthDate!.year}"; // 08/14/2019

    }
    notifyListeners();
  }
  ////Clickedd photo providder

  PickedFile? selectImage = null;

  Opengallery(BuildContext context) async {
    final GalleryImage = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    selectImage = GalleryImage!;
    notifyListeners();
  }

  OpenCamera(BuildContext context) async {
    final CameraImage = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    selectImage = CameraImage;
    notifyListeners();
  }
}

class CycleTrackingProvider extends ChangeNotifier {
  List<Widget> pages = [
    const Cycle_Tracking1(),
    const CycleTracking2(),
    const CycleTracking3(),
    const Cycle_Tracking(),
    const CycleTracking5(),
  ];
  var currentIndex = 0;
  OnChangedPage(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
