import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:hair_salon/models/staff/staff_model.dart';
import 'package:hair_salon/repository/manage_staff_api/manage_staff_repo.dart';

class StaffServicesRepositoryImpl extends StaffServicesRepository {
  static final Reference _storageReference = FirebaseStorage.instance.ref();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<StaffModel>> fetchStaffList() async {
    try {
      final QuerySnapshot snapshot = await _firestore.collection('staff').get();
      return snapshot.docs.map((doc) {
        return StaffModel.fromJson(doc.data() as Map<String, dynamic>)
            .copyWith(uid: doc.id);
      }).toList();
    } catch (e) {
      Get.snackbar('error'.tr,
          'error_fetching_staff_list'.trParams({'error': e.toString()}));
      rethrow;
    }
  }

  Future<void> updateStaffServices({
    required String staffUid,
    required List<String> services,
  }) async {
    final doc = FirebaseFirestore.instance.collection('staff').doc(staffUid);
    await doc.update({'listOfServices': services});
  }

  @override
  Future<StaffModel> addStaffMember(StaffModel staff) async {
    try {
      DocumentReference docRef =
          await _firestore.collection('staff').add(staff.toJson());
      String uid = docRef.id;
      await docRef.update({'uid': uid});
      Get.snackbar('success'.tr, 'staff_member_added_successfully'.tr);

      return staff.copyWith(uid: uid);
    } catch (e) {
      Get.snackbar('error'.tr,
          'failed_to_add_staff_member'.trParams({'error': e.toString()}));
      rethrow;
    }
  }

  @override
  Future<void> removeStaffMember(String uid) async {
    try {
      DocumentReference docRef = _firestore.collection('staff').doc(uid);
      await docRef.delete();
      Get.snackbar('success'.tr, 'staff_member_removed_successfully'.tr);
    } catch (e) {
      Get.snackbar('error'.tr,
          'failed_to_remove_staff_member'.trParams({'error': e.toString()}));
      rethrow;
    }
  }

  @override
  Future<String> uploadProfileImage({
    required Uint8List? imageFile,
    required String uid,
  }) async {
    await _storageReference
        .child('profile_images')
        .child(uid)
        .putData(imageFile!);
    return await _storageReference
        .child('profile_images/$uid')
        .getDownloadURL();
  }

  @override
  Future<void> updateStaffMember(
      String uid, Map<String, dynamic> updatedFields) async {
    try {
      await _firestore.collection('staff').doc(uid).update(updatedFields);
      Get.snackbar('success'.tr, 'staff_member_updated_successfully'.tr);
    } catch (e) {
      Get.snackbar('error'.tr,
          'failed_to_update_staff_member'.trParams({'error': e.toString()}));
      rethrow;
    }
  }
}
