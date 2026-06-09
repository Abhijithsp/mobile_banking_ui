import 'package:banking_ui/utils/constants/assets.dart';
import 'package:banking_ui/utils/constants/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final _formKey = GlobalKey<FormState>();
  final _numberController = TextEditingController();
  final _nameController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();

  String _cardNumber = "•••• •••• •••• ••••";
  String _cardholderName = "YOUR NAME";
  String _expiryDate = "MM/YY";
  String _cardAsset = Assets.cardsVisaYellow;
  Color _cardColor = const Color(0xFF161D28);

  @override
  void initState() {
    super.initState();
    _numberController.addListener(_updateCardNumber);
    _nameController.addListener(_updateCardholderName);
    _expiryController.addListener(_updateExpiryDate);
  }

  void _updateCardNumber() {
    setState(() {
      String text = _numberController.text;
      if (text.isEmpty) {
        _cardNumber = "•••• •••• •••• ••••";
      } else {
        _cardNumber = text;
      }

      // Dynamic Card type detection
      if (text.startsWith('5')) {
        _cardAsset = Assets.cardsMastercard;
        _cardColor = const Color(0xFF7C2D12); // Mastercard dark red
      } else {
        _cardAsset = Assets.cardsVisaYellow;
        _cardColor = const Color(0xFF161D28); // Default Visa color
      }
    });
  }

  void _updateCardholderName() {
    setState(() {
      if (_nameController.text.isEmpty) {
        _cardholderName = "YOUR NAME";
      } else {
        _cardholderName = _nameController.text.toUpperCase();
      }
    });
  }

  void _updateExpiryDate() {
    setState(() {
      if (_expiryController.text.isEmpty) {
        _expiryDate = "MM/YY";
      } else {
        _expiryDate = _expiryController.text;
      }
    });
  }

  @override
  void dispose() {
    _numberController.dispose();
    _nameController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Styles.primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Add Card",
          style: GoogleFonts.outfit(
            color: Styles.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          children: [
            // Live Preview Card
            Container(
              margin: const EdgeInsets.only(bottom: 24.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Row(
                  children: [
                    // Left (70%)
                    Expanded(
                      flex: 7,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        height: 170,
                        color: _cardColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  _cardAsset,
                                  width: 60,
                                  height: 40,
                                  fit: BoxFit.contain,
                                  errorBuilder: (c, e, s) => const Icon(
                                    Icons.credit_card,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                                Container(
                                  width: 32,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    color: Colors.amber.withValues(alpha: 0.7),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              _cardholderName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.outfit(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'CARD NUMBER',
                                  style: GoogleFonts.outfit(
                                    color: Colors.white.withValues(alpha: 0.5),
                                    fontSize: 9,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.8,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  _cardNumber,
                                  style: GoogleFonts.outfit(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Right (30%)
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                        height: 170,
                        color: Styles.yellowColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Styles.greenColor.withValues(alpha: 0.15),
                              ),
                              child: Icon(
                                Icons.swipe_vertical_rounded,
                                color: Styles.accentColor,
                                size: 20,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  'VALID',
                                  style: GoogleFonts.outfit(
                                    color: Styles.accentColor.withValues(alpha: 0.6),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  _expiryDate,
                                  style: GoogleFonts.outfit(
                                    color: Styles.accentColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Form inputs
            _buildInputField(
              controller: _nameController,
              label: "Cardholder Name",
              icon: Icons.person_outline_rounded,
              placeholder: "e.g. Abhijith S P",
              keyboardType: TextInputType.name,
              validator: (val) => val == null || val.isEmpty ? "Name is required" : null,
            ),
            const SizedBox(height: 16),
            _buildInputField(
              controller: _numberController,
              label: "Card Number",
              icon: Icons.credit_card_rounded,
              placeholder: "e.g. 5233 4440 4629 5225",
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16),
                CardNumberFormatter(),
              ],
              validator: (val) {
                if (val == null || val.isEmpty) return "Card number is required";
                if (val.replaceAll(' ', '').length < 16) return "Enter a valid 16-digit card number";
                return null;
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: _buildInputField(
                    controller: _expiryController,
                    label: "Expiry Date",
                    icon: Icons.calendar_month_outlined,
                    placeholder: "MM/YY",
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                      ExpiryDateFormatter(),
                    ],
                    validator: (val) {
                      if (val == null || val.isEmpty) return "Required";
                      if (val.length < 5) return "Invalid date";
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: _buildInputField(
                    controller: _cvvController,
                    label: "CVV",
                    icon: Icons.lock_outline_rounded,
                    placeholder: "•••",
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                    validator: (val) {
                      if (val == null || val.isEmpty) return "Required";
                      if (val.length < 3) return "Invalid";
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 36),

            // Save card button
            Container(
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: Styles.buttonColor.withValues(alpha: 0.25),
                    blurRadius: 15,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Styles.buttonColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Card saved successfully!"),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  "SAVE CARD",
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required String placeholder,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.outfit(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Styles.primaryColor,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          validator: validator,
          style: GoogleFonts.outfit(
            fontSize: 15,
            color: Styles.primaryColor,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: GoogleFonts.outfit(
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w400,
            ),
            prefixIcon: Icon(icon, color: Colors.grey.shade400, size: 20),
            filled: true,
            fillColor: Styles.whiteColor,
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: Styles.greenColor,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Helpers for formatters
class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write(' '); // Add space after 4 digits
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}

class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex == 2 && nonZeroIndex != text.length) {
        buffer.write('/'); // Add slash after month
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}
