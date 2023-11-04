// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:bus_booking/config/theme/palette.dart';
import 'package:bus_booking/config/url/url.dart';
import 'package:bus_booking/provider/token_provider.dart';
import 'package:bus_booking/provider/user_provider.dart';
import 'package:bus_booking/services/post_to_server.dart';
import 'package:bus_booking/services/uploadfile_to_server.dart';
import 'package:bus_booking/utils/loaders.dart';
import 'package:bus_booking/utils/logger.dart';
import 'package:bus_booking/utils/toast.dart';
import 'package:bus_booking/utils/ui.dart';
import 'package:bus_booking/widgets/base/custom_primary_button.dart';
import 'package:bus_booking/widgets/base/custome_upload.dart';
import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateBusScreen extends StatefulWidget {
  const CreateBusScreen({
    super.key,
  });

  static const String routeName = '/create-bus';

  @override
  State<CreateBusScreen> createState() => _CreateBusScreenState();
}

class _CreateBusScreenState extends State<CreateBusScreen> {
  TextEditingController busCompanyNamecontroller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController companyDocumentsUrlController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String filename = '';
  File selectedfile = File('');
  String uploadedDocUrl = '';

  selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        selectedfile = File(result.files.single.path.toString());
      });
    }

    setState(() {
      filename = result!.files.single.name;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserProvider up = context.watch<UserProvider>();
    TokenProvider tp = context.watch<TokenProvider>();
    emailController.text = up.userModel.email!;
    mobileController.text = up.userModel.phone!;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              vertical: 18,
              horizontal: 20,
            ),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context, null);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                        ),
                      ),
                      addHorizontalSpace(61),
                      Text(
                        "Register as a bus company",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.manrope(
                          color: Palette.tertiaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  addVerticalSpace(3),
                  Text(
                    "Enter your details to continue",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.manrope(
                        color: Palette.tertiaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  addVerticalSpace(23),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: GoogleFonts.manrope(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Palette.greyText,
                        ),
                      ),
                      addVerticalSpace(8),
                      TextFormField(
                        controller: busCompanyNamecontroller,
                        style: GoogleFonts.manrope(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter bus company name (eg. VIP)',
                          hintStyle: GoogleFonts.manrope(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Palette.greyText,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 13,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Color(0xFFE1E7EE),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Bus name is required';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  addVerticalSpace(20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: GoogleFonts.manrope(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Palette.greyText),
                      ),
                      addVerticalSpace(8),
                      TextFormField(
                        controller: emailController,
                        style: GoogleFonts.manrope(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'example@gmail.com',
                          hintStyle: GoogleFonts.manrope(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Palette.greyText),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 13),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Color(0xFFE1E7EE),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'email is required';
                          } else if (!EmailValidator.validate(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  addVerticalSpace(20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mobile',
                        style: GoogleFonts.manrope(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Palette.greyText),
                      ),
                      addVerticalSpace(8),
                      TextFormField(
                        controller: mobileController,
                        obscureText: false,
                        style: GoogleFonts.manrope(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Enter company mobile number',
                          hintStyle: GoogleFonts.manrope(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Palette.greyText,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 13),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Color(0xFFE1E7EE),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Mobile number is required';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  addVerticalSpace(20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Upload company document',
                        style: GoogleFonts.manrope(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Palette.greyText),
                      ),
                      addVerticalSpace(8),
                      InkWell(
                        onTap: () async {
                          await selectFile();
                          // ignore: unnecessary_null_comparison
                          if (selectedfile != null) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const Center(
                                    child: SpinKitCircle(
                                      color: Palette.primaryColor,
                                    ),
                                  );
                                });
                            try {
                              final resp = await uploadFileToServer(
                                  selectedfile, "files");
                              final jresp = jsonDecode(resp);
                              if (jresp["status"] == "success") {
                                setState(() {
                                  uploadedDocUrl =
                                      jresp["data"]["company_docs"][0]["url"];
                                });
                                showToast('Successfully uploaded  doc');
                                Navigator.pop(context);
                              } else {
                                Navigator.pop(context);
                              }
                            } catch (e) {
                              Navigator.pop(context);
                              logs.d(e);
                            }
                          }
                        },
                        child: CustomUplaoder(
                          title: filename.isNotEmpty
                              ? filename
                              : 'Click to uplaod company document',
                        ),
                      ),
                    ],
                  ),
                  addVerticalSpace(30),
                  CustomPrimaryButton(
                    text: "Register",
                    onPressed: () async {
                      bool isValidForm = _formKey.currentState!.validate();
                      if (isValidForm) {
                        if (uploadedDocUrl.isNotEmpty) {
                          showProgressLoader();
                          try {
                            final data = {
                              "name": busCompanyNamecontroller.text.trim(),
                              "email": emailController.text.trim(),
                              "mobileNumber": mobileController.text.trim(),
                              "companyDocumentsUrl": uploadedDocUrl,
                            };
                            logs.d(data);
                            final resp = await postDataToServer(
                              '${Url.busCompany}/bus-company',
                              data,
                              context,
                              authToken: tp.authToken,
                            );
                            final jresp = jsonDecode(resp);
                            logs.d(jresp);
                            cancelLoader();
                          } catch (e) {
                            cancelLoader();
                            logs.d(e);
                          }
                        } else {
                          showToast(
                              "No document has been submitted, upload one");
                          cancelLoader();
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
