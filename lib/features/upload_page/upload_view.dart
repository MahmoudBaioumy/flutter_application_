import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_/core/Network/local_storage.dart';
import 'package:flutter_application_/core/function/bialog.dart';
import 'package:flutter_application_/core/function/routing.dart';
import 'package:flutter_application_/core/utils/appcolors.dart';
import 'package:flutter_application_/core/utils/text_styles.dart';
import 'package:flutter_application_/core/widget/customBu.dart';
import 'package:flutter_application_/features/Home/presentation/buttom_nav/buttom_nav.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

String? path;
String name = '';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (path != null && name.isNotEmpty) {
                  AppLocal.cacheData(AppLocal.IMAGE_KEY, path);
                  AppLocal.cacheData(AppLocal.NAME_KEY, name);
                  AppLocal.cacheData(AppLocal.ISUPLOAD_KEY, true);
                  pushwithReplacement(context, const bottom_nav());
                } else if (path == null && name.isNotEmpty) {
                  showErrorDialog(context, 'Please Upload Your image');
                } else if (path != null && name.isEmpty) {
                  showErrorDialog(context, 'Enter Your Name');
                } else {
                  showErrorDialog(
                      context, 'Please Upload Your image and Enter Your Name');
                }
              },
              child:
                  Text('Done', style: getTitelstyle(color: appcolors.lemonada)))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: (path != null)
                    ? FileImage(File(path!)) as ImageProvider
                    : const AssetImage(
                        'assets/user.png',
                      ),
              ),
              const Gap(20),
              SizedBox(
                  width: 220,
                  height: 45,
                  child: CustomButton(
                      text: 'Upload From Camera',
                      onPressed: () {
                        uploadFromCamera();
                      })),
              const Gap(7),
              SizedBox(
                  width: 220,
                  height: 45,
                  child: CustomButton(
                      text: 'Upload From Gallery',
                      onPressed: () {
                        uploadFromGallery();
                      })),
              const Gap(20),
              Divider(
                thickness: .5,
                endIndent: 20,
                indent: 20,
                color: appcolors.lemonada,
              ),
              const Gap(20),
              TextFormField(
                style: getbodystyle(),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    hintText: 'Enter Your Name',
                    prefixIcon: Icon(
                      Icons.person,
                      color: appcolors.lemonada,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  uploadFromCamera() async {
    // OPEN CAMERA AND PICK IMAGE
    var pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }

  uploadFromGallery() async {
    var pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }
}
