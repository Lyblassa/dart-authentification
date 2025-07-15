import 'package:flutter/services.dart';

String cleanNumber(String number) {
  return number.replaceAll(RegExp(r'[^0-9]'), '');
}

bool validatePhoneNumber(String phoneNumber, String countryCode) {
  String cleaned = cleanNumber(phoneNumber);

  switch (countryCode.toUpperCase()) {
    case 'CA':
      return cleaned.length == 10; // Canada
    case 'FR':
      return cleaned.length == 10; // France
    case 'BE':
      return cleaned.length == 9 || cleaned.length == 10; // Belgique
    case 'CH':
      return cleaned.length == 9 || cleaned.length == 10; // Suisse
    case 'CM': // Cameroun
    case 'SN': // Sénégal
    case 'CD': // RDC
    case 'GN':
      return cleaned.length == 9; // Guinée
    case 'CI':
      return cleaned.length == 10; // Côte d’Ivoire
    case 'BF': // Burkina Faso
    case 'GA':
      return cleaned.length == 8; // Gabon
    default:
      return false;
  }
}

String formatPhoneNumber(String number, String countryCode) {
  String cleaned = cleanNumber(number);
  try {
    switch (countryCode.toUpperCase()) {
      case 'CM':
      case 'SN':
      case 'CD':
      case 'GN':
        return '${cleaned[0]} ${cleaned.substring(1, 3)} ${cleaned.substring(3, 5)} ${cleaned.substring(5, 7)} ${cleaned.substring(7)}';
      case 'BF':
      case 'GA':
        return '${cleaned.substring(0, 2)} ${cleaned.substring(2, 4)} ${cleaned.substring(4, 6)} ${cleaned.substring(6)}';
      case 'FR':
      case 'BE':
      case 'CH':
      case 'CI':
        return '${cleaned.substring(0, 2)} ${cleaned.substring(2, 4)} ${cleaned.substring(4, 6)} ${cleaned.substring(6, 8)} ${cleaned.substring(8)}';
      case 'CA':
        return '${cleaned.substring(0, 3)}-${cleaned.substring(3, 6)}-${cleaned.substring(6)}';
      default:
        return cleaned;
    }
  } catch (e) {
    return cleaned;
  }
}

/// Un formatter maison qui applique ton formatage en temps réel
class PhoneInputFormatter extends TextInputFormatter {
  final String countryCode;

  PhoneInputFormatter({required this.countryCode});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String formatted = formatPhoneNumber(newValue.text, countryCode);
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
