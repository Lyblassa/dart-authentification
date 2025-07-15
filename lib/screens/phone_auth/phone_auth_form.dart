import 'package:auth_demo/widgets/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'otp_form.dart';
import 'package:provider/provider.dart';
import '../../repositories/auth_repository.dart';
import '../../widgets/phone_validator.dart'; // adapte ton chemin
import '../../utils/auth_errors.dart';

class PhoneAuthForm extends StatefulWidget {
  const PhoneAuthForm({super.key});

  @override
  State<PhoneAuthForm> createState() => _PhoneAuthFormState();
}

class _PhoneAuthFormState extends State<PhoneAuthForm> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController pseudoController = TextEditingController();

  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode pseudoFocusNode = FocusNode();

  Country _selectedCountry = Country(
    phoneCode: '1',
    countryCode: 'CA',
    e164Sc: 1,
    geographic: true,
    level: 1,
    name: 'Canada',
    example: '5141234567',
    displayName: 'Canada',
    displayNameNoCountryCode: 'Canada',
    e164Key: '',
  );

  @override
  void dispose() {
    phoneFocusNode.dispose();
    pseudoFocusNode.dispose();
    phoneController.dispose();
    pseudoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: MountainClipper(),
              child: Container(
                width: double.infinity,
                height: 300.h,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFE1F5FE), Color(0xFFB3E5FC)],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 40.h, bottom: 16.h),
                  child: Lottie.asset(
                    'lib/assets/animations/saluer.json',
                    width: 180.w,
                    height: 180.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Entre ton numéro de téléphone",
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "pour continuer",
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 14.sp,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  GestureDetector(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        showPhoneCode: true,
                        countryFilter: [
                          'CA',
                          'CM',
                          'SN',
                          'FR',
                          'BE',
                          'CH',
                          'CD',
                          'CI',
                          'BF',
                          'GN',
                          'GA',
                        ],
                        countryListTheme: CountryListThemeData(
                          flagSize: 25,
                          backgroundColor: Colors.white,
                          textStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                          bottomSheetHeight: 500,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                          inputDecoration: InputDecoration(
                            labelText: 'Rechercher',
                            hintText: 'Commence à taper...',
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color(0xFF8C98A8).withOpacity(0.2),
                              ),
                            ),
                          ),
                        ),
                        onSelect: (Country country) {
                          setState(() {
                            _selectedCountry = country;
                            phoneController
                                .clear(); // remet à zéro pour formater correctement
                          });
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 15.h,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.circular(12.r),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _selectedCountry.flagEmoji,
                            style: TextStyle(fontSize: 24.sp),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Text(
                              '${_selectedCountry.name} (+${_selectedCountry.phoneCode})',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.sp,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  TextField(
                    controller: phoneController,
                    focusNode: phoneFocusNode,
                    keyboardType: TextInputType.phone,
                    cursorColor: const Color(0xFF00A8FC),
                    inputFormatters: [
                      PhoneInputFormatter(
                        countryCode: _selectedCountry.countryCode,
                      ),
                    ],
                    decoration: InputDecoration(
                      prefixText: "+${_selectedCountry.phoneCode} ",
                      prefixStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16.sp,
                      ),
                      hintText: "Numéro de téléphone",
                      hintStyle: TextStyle(fontSize: 15.sp),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(
                          color: Color(0xFF00A8FC),
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  TextField(
                    controller: pseudoController,
                    focusNode: pseudoFocusNode,
                    cursorColor: const Color(0xFF00A8FC),
                    style: TextStyle(fontFamily: 'Nunito', fontSize: 16.sp),
                    decoration: InputDecoration(
                      hintText: "pseudo, surnom",
                      hintStyle: TextStyle(fontSize: 15.sp),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  _buildLayeredButton(
                    label: "continuer",
                    onTap: () async {
                      final rawNumber = phoneController.text.trim();
                      final isoCode = _selectedCountry.countryCode;
                      if (rawNumber.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(AuthErrors.emptyPhoneNumber)),
                        );
                        return;
                      }

                      final pseudoError = AuthErrors.validatePseudo(
                        pseudoController.text,
                      );

                      if (pseudoError != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(pseudoError),
                            backgroundColor:
                                Colors.red, // ✅ ici ton fond sera rouge
                          ),
                        );
                        return;
                      }

                      if (!validatePhoneNumber(rawNumber, isoCode)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Numéro invalide pour ${_selectedCountry.name}",
                            ),
                          ),
                        );
                        return;
                      }

                      final cleaned = cleanNumber(rawNumber);
                      final phone = "+${_selectedCountry.phoneCode}$cleaned";

                      final authRepo = context.read<AuthRepository>();

                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        useRootNavigator: true,
                        builder: (_) => const LoadingPage(
                          message: 'Vérification du numéro...',
                        ),
                      );

                      try {
                        await authRepo.signInWithPhone(phone, (verificationId) {
                          Navigator.of(context, rootNavigator: true).pop();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => OTPForm(
                                verificationId: verificationId,
                                phoneNumber: phone,
                                pseudo: pseudoController.text.trim(),
                              ),
                            ),
                          );
                        });
                      } catch (e) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Erreur: ${e.toString()}')),
                        );
                      }
                    },
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "nous vous enverrons un message",
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 12.sp,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLayeredButton({
    required String label,
    required VoidCallback onTap,
  }) {
    double height = 56.h;
    double offsetY = 4.h;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: offsetY,
            left: 0,
            right: 0,
            child: Container(
              height: height,
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
          Container(
            height: height,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              label,
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MountainClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 60.h);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height,
      size.width * 0.5,
      size.height - 40.h,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height - 80.h,
      size.width,
      size.height - 40.h,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
