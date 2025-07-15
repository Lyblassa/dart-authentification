class AuthErrors {
  static String emptyPhoneNumber =
      "Le numéro de téléphone ne peut pas être vide.";
  static String invalidPhoneNumber =
      "Le numéro de téléphone n'est pas valide pour ce pays.";
  static String emptyPseudo = "Le pseudo est obligatoire.";
  static String unknownError =
      "Une erreur inconnue est survenue. Veuillez réessayer.";

  /// ⚡ Idéal : mettre validatePseudo comme méthode statique aussi !
  static String? validatePseudo(String pseudo) {
    if (pseudo.trim().isEmpty) {
      return emptyPseudo;
    }
    return null;
  }
}
