import 'dart:io';

import 'getBreedModel.dart';

class AddPetModel {
  static bool isedit = false;
  static String? type;
  static String? petId;
  static String? name;
  static GetBreedModel? breed;
  static String? gender;
  static String? weight;
  static String? parentName;
  static String? dob;
  static File? uploadDocumnt;
  static List<File> addPetIamge = [];
  static List<String> editimage = [];
  static String? editdoc;
}

disposAddpetModle() {
  AddPetModel.isedit = false;
  AddPetModel.type = null;
  AddPetModel.petId = null;
  AddPetModel.name = null;
  AddPetModel.breed = null;
  AddPetModel.gender = null;
  AddPetModel.weight = null;
  AddPetModel.parentName = null;
  AddPetModel.dob = null;
  AddPetModel.uploadDocumnt = null;
  AddPetModel.addPetIamge = [];
  AddPetModel.editimage = [];
  AddPetModel.editdoc = null;
}
