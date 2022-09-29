import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_app/Screens/Add_Pets/AddPet3.dart';
import 'package:pet_app/Screens/HOME/ServicesList.dart';
import 'package:pet_app/SevicesListAll_Screens/Medicines.dart';
import 'package:pet_app/SevicesListAll_Screens/Pregnancy.dart';
import 'package:pet_app/SevicesListAll_Screens/Vactionations.dart';
import 'package:pet_app/UTILS/Utils.dart';
import '../../Componants/Images&Icons.dart';
import '../Screens/Add_Pets/Add_pet2.dart';
import '../Screens/Add_Pets/addPet1.dart';
import '../Screens/BlogDetails.dart';
import '../Screens/CycleTrackingPageViewBuilder/CycleTracking_Page.dart';
import '../SevicesListAll_Screens/Deworming.dart';
import 'package:pet_app/Screens/CycleTrackingPageViewBuilder/CycleTracking1.dart';
import 'package:pet_app/Screens/CycleTrackingPageViewBuilder/CycleTracking3.dart';
import 'package:pet_app/Screens/CycleTrackingPageViewBuilder/CycleTracking5.dart';
import 'package:pet_app/Screens/CycleTrackingPageViewBuilder/Cycle_Tracking4.dart';
import 'package:pet_app/Screens/CycleTrackingPageViewBuilder/WheelList_CycleTracking2.dart';

class ServicesListProvider extends ChangeNotifier {
  static List<String> ImageName = [
    CYCLE_TRACKING,
    MEDICATIONS,
    VACCINATIONS,
    DEWORMING,
    PREGNANCY
  ];

  static List url = [
    'assets/png_image/Group 32.png',
    'assets/png_image/Group 32.png',
    'assets/png_image/Group 32.png',
    'assets/png_image/Group 32.png',
    'assets/png_image/Group 32.png'
  ];

  static List<Widget> PageRoute = [
    CycleTrackingPage(),
    Medicines(),
    Vaccinations(),
    Deworming(),
    Pregnancy()
  ];

  final List<DetailModel> DetailData = List.generate(ImageName.length,
      (index) => DetailModel('${ImageName[index]}', '${url[index]}'));
  get detaildata => DetailData;

  OnClickedList(BuildContext context, int index) {
    Navigate_to(context, PageRoute[index]);
    notifyListeners();
  }
}

////ServiceHelthProvider

class ServiceHealthProvider extends ChangeNotifier {
  List Service = ["Health", "Vets", "Gromming", "Trainig", "illness"];

  int currenindex = 0;

  get data => Service;
  OnTap(int index) {
    currenindex = index;
    notifyListeners();
  }
}

//// BlogDetailListProvider

class BlogDetailProvider extends ChangeNotifier {
  OnClicked(BuildContext context) {
    Navigate_to(context, Blog_Details());
    notifyListeners();
  }
}

////AddPet PageViewProvider

class addPetProvider extends ChangeNotifier {
  List text = ["Select Type", "Fill the Details", "Upload Pictures"];
  List<Widget> pages = [AddPets(), AddPet2(), Addpet3()];

  int CurrentIndex = 0;

  OnChangedPage(int value) {
    CurrentIndex = value;
    notifyListeners();
  }

  ////Clickedd photo providder

  PickedFile? SelectImage = null;

  Opengallery(BuildContext context) async {
    final GalleryImage = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    SelectImage = GalleryImage!;
    notifyListeners();
  }

  OpenCamera(BuildContext context) async {
    final CameraImage = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    SelectImage = CameraImage;
    notifyListeners();
  }
}

class CycleTrackingProvider extends ChangeNotifier {
  List<Widget> pages = [
    Cycle_Tracking1(),
    CycleTracking2(),
    CycleTracking3(),
    Cycle_Tracking(),
    CycleTracking5(),
  ];
  var currentIndex = 0;
  OnChangedPage(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
