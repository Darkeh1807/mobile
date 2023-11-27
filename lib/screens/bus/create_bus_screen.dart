import 'dart:convert';
import 'dart:io';
import 'package:bus_booking/config/theme/palette.dart';
import 'package:bus_booking/config/url/url.dart';
import 'package:bus_booking/provider/token_provider.dart';
import 'package:bus_booking/provider/user_provider.dart';
import 'package:bus_booking/screens/home/app_home.dart';
import 'package:bus_booking/services/post_to_server.dart';
import 'package:bus_booking/services/uploadfile_to_server.dart';
import 'package:bus_booking/utils/loaders.dart';
import 'package:bus_booking/utils/logger.dart';
import 'package:bus_booking/utils/snackbar.dart';
import 'package:bus_booking/utils/toast.dart';
import 'package:bus_booking/utils/ui.dart';
import 'package:bus_booking/widgets/base/custom_primary_button.dart';
import 'package:bus_booking/widgets/base/custome_upload.dart';
import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
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
  TextEditingController contactPersonNameController = TextEditingController();
  TextEditingController contactPersonPhoneController = TextEditingController();
  TextEditingController contactPersonEmailController = TextEditingController();
  TextEditingController contactPersonPositionController =
      TextEditingController();
  TextEditingController noteController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String filename = '';
  File selectedfile = File('');
  String uploadedDocUrl = '';
  bool isLoading = false;

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
    TokenProvider tp = Provider.of<TokenProvider>(context, listen: false);

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
                        'Contact Person Name',
                        style: GoogleFonts.manrope(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Palette.greyText,
                        ),
                      ),
                      addVerticalSpace(8),
                      TextFormField(
                        controller: contactPersonNameController,
                        style: GoogleFonts.manrope(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter bus company contact person name',
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
                            return 'Company contact person name is required';
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
                        'Contact person Phone',
                        style: GoogleFonts.manrope(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Palette.greyText,
                        ),
                      ),
                      addVerticalSpace(8),
                      TextFormField(
                        controller: contactPersonPhoneController,
                        style: GoogleFonts.manrope(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter company person contact  number',
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
                            return ' Company contact person phone is required';
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
                        'Contact person email',
                        style: GoogleFonts.manrope(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Palette.greyText,
                        ),
                      ),
                      addVerticalSpace(8),
                      TextFormField(
                        controller: contactPersonEmailController,
                        style: GoogleFonts.manrope(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter bus company contact email',
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
                            return 'Bus company email is required';
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
                        'Contact person position',
                        style: GoogleFonts.manrope(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Palette.greyText,
                        ),
                      ),
                      addVerticalSpace(8),
                      TextFormField(
                        controller: contactPersonPositionController,
                        style: GoogleFonts.manrope(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter bus company contact person position',
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
                            return 'Company contact person position is  required';
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
                        'Note',
                        style: GoogleFonts.manrope(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Palette.greyText,
                        ),
                      ),
                      addVerticalSpace(8),
                      TextFormField(
                        controller: noteController,
                        minLines: 3,
                        maxLines: null,
                        style: GoogleFonts.manrope(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter note here',
                          hintStyle: GoogleFonts.manrope(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Palette.greyText,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 40,
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
                            setState(() {
                              isLoading = !isLoading;
                            });
                            try {
                              final resp = await uploadFileToServer(
                                  selectedfile, "files");
                              final jresp = jsonDecode(resp.toString());
                              if (jresp["status"] == "success") {
                                setState(() {
                                  uploadedDocUrl =
                                      jresp["data"]["company_docs"][0]["url"];
                                });
                                showToast('Successfully uploaded  doc');
                                setState(() {
                                  isLoading = !isLoading;
                                });
                              } else {
                                setState(() {
                                  isLoading = !isLoading;
                                });
                              }
                            } catch (e) {
                              setState(() {
                                isLoading = !isLoading;
                              });
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
                      Row(
                        children: [
                          isLoading
                              ? Row(
                                  children: [
                                    spinLoader(),
                                    addHorizontalSpace(5),
                                    const Text(
                                        'Uploading document, this will take sometime'),
                                  ],
                                )
                              : Container(),
                        ],
                      )
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
                            Map<String, dynamic> data = {
                              "name": busCompanyNamecontroller.text.trim(),
                              "email": emailController.text.trim(),
                              "mobileNumber": mobileController.text.trim(),
                              "companyDocumentsUrl": uploadedDocUrl,
                              "contactPersonName":
                                  contactPersonNameController.text.trim(),
                              "contactPersonPhone":
                                  contactPersonPhoneController.text.trim(),
                              "contactPersonEmail":
                                  contactPersonEmailController.text.trim(),
                              "contactPersonPosition":
                                  contactPersonPositionController.text.trim(),
                              "note": noteController.text.trim()
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
                            if (jresp["status"] == "success") {
                              cancelLoader();
                              showToast("Successfully created bus company");
                              pushNamedRoute(context, AppHome.routeName);
                            } else if (jresp["message"] ==
                                "Bus Operator already exits") {
                              cancelLoader();
                              showSnackBar(
                                  context, 'Bus company already exists');
                            } else {
                              cancelLoader();
                            }
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
