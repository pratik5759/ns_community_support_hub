import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';

class AddBusinessForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;
        bool isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1200;

        return Container(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 32, vertical: 20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // if (!isMobile) ...[
                  //   const SizedBox(width: 18),
                  //   Container(
                  //     width: isTablet ? 400 : 534,
                  //     height: 409,
                  //     decoration: BoxDecoration(
                  //       image: DecorationImage(
                  //         image: AssetImage("assets/images/add_event_img.png"),
                  //         fit: BoxFit.cover,
                  //       ),
                  //     ),
                  //   ),
                  // ],

                  if (!isMobile) ...[
                    const SizedBox(width: 18),
                    Container(
                      width: isTablet ? 400 : 534, // Reduced width
                      height: 400,   // Reduced height
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/add_event_img.png"),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ],


                  Expanded(
                    child: Column(
                      children: [
                        _buildInputRow([
                          _buildInputField('Name',context),
                          _buildInputField('Category', isDropdown: true,dropdownItems: ['one'],context),
                        ]),
                        _buildInputRow([
                          _buildInputField('Description', isMultiline: true,context),
                          Column(
                            children: [
                              _buildInputField('Hours',context),
                              SizedBox(height: 16),
                              _buildInputField('Phone',context),
                            ],
                          ),
                        ]),
                        _buildInputRow([
                          _buildInputField('Location',context),
                          _buildInputField('Website URL', isLink: true,context),
                        ]),
                        SizedBox(height: 16),
                        _buildAttachBusinessImage(),
                        SizedBox(height: 16),
                        _buildAddButton(),
                      ],
                    ),
                  ),

                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInputRow(List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          for (int i = 0; i < children.length; i++) ...[
            Expanded(child: children[i]),
            if (i != children.length - 1) SizedBox(width: 16),
          ],
        ],
      ),
    );
  }

  // Widget _buildInputField(String title, {bool isDropdown = false, bool isLink = false, bool isMultiline = false}) {
  //   return TextFormField(
  //     maxLines: isMultiline ? 3 : 1,
  //     decoration: InputDecoration(
  //       labelText: title,
  //       filled: true,
  //       fillColor: Color(0xFFF2F2F2),
  //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
  //       suffixIcon: isDropdown
  //           ? Icon(Icons.arrow_drop_down, color: Color(0xFF7A6FB5))
  //           : isLink
  //           ? Icon(Icons.link, color: Color(0xFF7A6FB5))
  //           : null,
  //     ),
  //   );
  // }

  Widget _buildInputField(
      String title,BuildContext ctx, {
        bool isDropdown = false,
        bool isLink = false,
        bool isMultiline = false,
        List<String>? dropdownItems,
        TextEditingController? controller,
        ValueNotifier<String?>? dropdownController,
      }) {
    // If it's a dropdown
    if (isDropdown) {
      return DropdownButtonFormField<String>(
        value: dropdownController?.value,  // Bind to the ValueNotifier
        decoration: InputDecoration(
          labelText: title,
          filled: true,
          labelStyle: GoogleFonts.nunito(color: AppTheme.textColor),
          fillColor: Color(0xFFF2F2F2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none, // Removes the outline border
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
        style: GoogleFonts.nunito(color: AppTheme.textColor,fontSize: 16),
        items: dropdownItems?.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (dropdownController != null) {
            dropdownController.value = newValue ?? ''; // Update the selected value
          }
        },
        hint: Text('Select $title'),
        // Customize the dropdown menu
        dropdownColor: Color(0xFFF2F2F2), // Change dropdown menu background color
        icon: Icon(
          Icons.arrow_drop_down,
          color: Color(0xFF7A6FB5), // Icon color can be customized based on theme
        ),
        elevation: 4, // Adds a subtle shadow to the dropdown menu
        isExpanded: true, // Expands the dropdown to fill the width
      );
    }

    // If it's a regular TextFormField
    return TextFormField(
      controller: controller,
      maxLines: isMultiline ? 3 : 1,
      decoration: InputDecoration(
        labelText: title,
        filled: true,
        fillColor: Color(0xFFF2F2F2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none, // Removes the outline border
        ),
        labelStyle: GoogleFonts.nunito(color: AppTheme.textColor),
        suffixIcon: isLink
            ? Icon(Icons.link, color: AppTheme.primaryColor)
            : null,
      ),
    );
  }



  Widget _buildAttachBusinessImage() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Color(0x28000000), blurRadius: 4, offset: Offset(2, 4)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Attach Business Image',
            style: GoogleFonts.nunito(
              color: Color(0xFF695F9B),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 16),
          Icon(Icons.image, color: Color(0xFF7A6FB5)),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      decoration: BoxDecoration(
        color: Color(0xFF7A6FB5),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Color(0x28000000), blurRadius: 4, offset: Offset(2, 4)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, color: Colors.white),
          const SizedBox(width: 10),
          Text(
            'Add Business',
            style: GoogleFonts.nunito(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}