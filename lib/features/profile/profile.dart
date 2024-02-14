import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_/core/Network/local_storage.dart';
import 'package:flutter_application_/core/utils/appcolors.dart';
import 'package:flutter_application_/core/utils/text_styles.dart';
import 'package:flutter_application_/core/widget/showbielog.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class profile_view extends StatefulWidget {
  const profile_view({super.key});

  @override
  State<profile_view> createState() => _profile_viewState();
}

class _profile_viewState extends State<profile_view> {
  String? path;
  String? name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppLocal.getCachedData(AppLocal.IMAGE_KEY).then((value) {
      setState(() {
        path = value;
      });
      AppLocal.getCachedData(AppLocal.NAME_KEY).then((value) {
        setState(() {
          name = value;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  backgroundImage: path != null
                      ? FileImage(File(path!)) as ImageProvider
                      : const AssetImage('assets/user.png'),
                  maxRadius: 90,
                ),
                CircleAvatar(
                  backgroundColor: appcolors.containerBg,
                  child: IconButton(
                      onPressed: () {
                        ShowImageDialog(context, onTapCamera: () {
                          uploadfromcamera();
                        }, onTapGallery: () {
                          uploadfromgallary();
                        });
                      },
                      icon: Icon(
                        Icons.camera_alt,
                        color: appcolors.lemonada,
                      )),
                )
              ],
            ),
            const Gap(30),
            Divider(
              thickness: 1,
              color: appcolors.lemonada,
            ),
            const Gap(30),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: appcolors.containerBg,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Text(
                        '$name',
                        style: getTitelstyle(),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            {
                              ShowNameDialog(context, name);
                              setState(() {});
                            }
                          },
                          icon: Icon(
                            Icons.edit,
                            color: appcolors.lemonada,
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  uploadfromcamera() async {
    var pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }

  uploadfromgallary() async {
    var pickedimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedimage != null) {
      setState(() {
        path = pickedimage.path;
      });
    }
  }
}
