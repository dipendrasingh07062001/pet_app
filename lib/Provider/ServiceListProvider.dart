import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_app/Screens/Add_Pets/AddPet3.dart';
import 'package:pet_app/Screens/EditPet/editPage1.dart';
import 'package:pet_app/Screens/EditPet/editPet3.dart';
import 'package:pet_app/Screens/EditPet/editpage2.dart';
import 'package:pet_app/SevicesListAll_Screens/Medicines.dart';
import 'package:pet_app/SevicesListAll_Screens/Pregnancy.dart';
import 'package:pet_app/SevicesListAll_Screens/Vactionations.dart';
import 'package:pet_app/UTILS/Utils.dart';
import '../Api/Models/My_pet_model.dart';
import '../Api/Models/ServiceListModel.dart';
import '../Api/Models/addPetModel.dart';
import '../Api/Models/getBreedModel.dart';
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
  List<Widget> PageRoute = [
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
  MypetListdata petdata = MypetListdata();
  int currentIndex = 0;
  // var myPetList;

  TextEditingController nameCan = TextEditingController();
  TextEditingController parentNmaeCan = TextEditingController();
  String selectedpet = "";
  String weightDropdoun = 'Weight';
  final weightItems = [
    'Weight',
    '10',
    '15',
    '20',
    '25',
    '30',
    '35',
    '40',
    '45',
    '50',
    '55',
    '60'
  ];
  List text = ["Select Type", "Fill the Details", "Upload Pictures"];
  List<Widget> pages = [const AddPets(), const AddPet2(), const Addpet3()];
  List<Widget> editpetPage = [const EditPet1(), EditPet2(), const Editpate3()];
  GetBreedModel breedModel = GetBreedModel();
  getvalues(MypetListdata petModel) {
    // addPetModel.name = petModel.name ?? "";
    // addPetModel.parentName = petModel.parentname ?? "";
    // addPetModel.breed = petModel.breed ?? "";
    // addPetModel.editdoc = petModel.uploaddocument ?? "";
    // addPetModel.dob = petModel.dob ?? "";
    // addPetModel.editimage = petModel.image ?? "";
    // addPetModel.type = petModel.type ?? "";
    // addPetModel.weight = petModel.weight ?? "";
    // addPetModel.gender = petModel.gendar ?? "";

    petdata = petModel;
    selectedpet = petModel.type ?? "";
    nameCan.text = petModel.name ?? "";
    parentNmaeCan.text = petModel.parentname ?? "";
    weightDropdoun = petModel.weight ?? "";
    gender = petModel.gendar ?? "";

    notifyListeners();
  }

  onChangedPage(int value) {
    currentIndex = value;
    notifyListeners();
  }

  String gender = '';
  onValueChange(String? index) {
    gender = index ?? gender;
    notifyListeners();
  }

  String day = 'daily';
  dayChangevalue(String? index) {
    day = index ?? day;
    notifyListeners();
  }

  String day1 = 'daily';
  dayChangevalue1(String? index) {
    day1 = index ?? day;
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
  onChangedPage(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
