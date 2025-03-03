import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:ns_community_support_hub/core/common_widgets/custom_dialouge.dart';
import 'package:ns_community_support_hub/features/business_directory/business_directory_provider.dart';
import 'package:ns_community_support_hub/features/business_directory/models/category_model.dart';
import 'package:provider/provider.dart';


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
                    child: Consumer<BusinessDirectoryProvider>(
                      builder: (context, value, child) {
                        return Column(
                          children: [
                            _buildInputRow([
                              _buildInputField(title: 'Name',ctx: context,provider:value,controller: value.nameController),
                              _buildInputField(title: 'Category',ctx: context,isTypeAhead: true,provider:value,controller: value.categoryController,suggestions: value.categories),
                              //_buildInputField('Category', isDropdown: true,dropdownItems: ['one'],context),
                            ]),
                            _buildInputRow([
                              _buildInputField(title: 'Description', isMultiline: true,ctx: context,provider: value,controller: value.descriptionController),
                              Column(
                                children: [
                                  _buildInputField(title: 'Hours',ctx: context,provider: value,controller: value.workingHoursController),
                                  SizedBox(height: 16),
                                  _buildInputField(title: 'Phone',ctx: context,provider: value,controller: value.phoneNumberController),
                                ],
                              ),
                            ]),
                            _buildInputRow([
                              _buildInputField(title: 'Location',ctx: context,provider: value,controller: value.locationController,onChanged: value.onAddressChanged),
                              _buildInputField(title: 'Website URL', isLink: true,ctx: context,provider: value,controller: value.websiteController),
                            ]),
                            SizedBox(height: 16),
                            _buildAttachBusinessImage(value),
                            SizedBox(height: 16),
                            _buildAddButton(value,context),
                          ],
                        );
                      },
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

  Widget _buildInputField(
       {
        required String title,
        required BuildContext ctx,
        required BusinessDirectoryProvider provider,
        bool isTypeAhead = false,
        bool isLink = false,
        bool isMultiline = false,
        List<CategoryModel>? suggestions,  // Now accepting List<Category>
        required TextEditingController controller,
         void Function(String)? onChanged
      }) {
    if (isTypeAhead) {
      return TypeAheadField<CategoryModel>(
        controller: controller,
        suggestionsCallback: (pattern) {
          return suggestions!
              .where((category) => category.name.toLowerCase().contains(pattern.toLowerCase()))
              .toList();
        },
        builder: (context, textEditingController, focusNode) {
          return TextField(
            controller: textEditingController,
            focusNode: focusNode,
            decoration: InputDecoration(
              labelText: title,
              filled: true,
              fillColor: const Color(0xFFF2F2F2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              labelStyle: GoogleFonts.nunito(color: AppTheme.textColor),
            ),
            style: GoogleFonts.nunito(color: AppTheme.textColor, fontSize: 16),
          );
        },
        itemBuilder: (context, CategoryModel suggestion) {
          return ListTile(
            title: Text(
              suggestion.name, // Displaying category name
              style: GoogleFonts.nunito(fontSize: 16),
            ),
          );
        },
        onSelected: (CategoryModel suggestion) {
          /// Update selected category in BusinessDirectoryProvider
          //provider.updateSelectedCategory(suggestion);

          /// Also update the text field's controller
          controller.text = suggestion.name;
        },
        emptyBuilder: (context) => const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'No matches found',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        decorationBuilder: (context, child) {
          return Material(
            elevation: 4.0,
            borderRadius: BorderRadius.circular(16),
            child: child,
          );
        },
      );
    }

    return TextFormField(
      controller: controller,
      maxLines: isMultiline ? 3 : 1,
      onChanged: isTypeAhead ?   null : onChanged,
      decoration: InputDecoration(
        labelText: title,
        filled: true,
        fillColor: const Color(0xFFF2F2F2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        labelStyle: GoogleFonts.nunito(color: AppTheme.textColor),
        suffixIcon: isLink ? Icon(Icons.link, color: AppTheme.primaryColor) : null,
      ),
    );
  }

  Widget _buildAttachBusinessImage(BusinessDirectoryProvider provider) {
    return GestureDetector(
      onTap: () {
        if (kIsWeb) {
          // running on the web!
          provider.pickImageWeb();
        } else {
          // NOT running on the web! You can check for additional platforms here.
          provider.pickImageAndroid();
        }
      },
      child: Container(
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
                color: AppTheme.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              provider.image?.path ?? '',
              style: GoogleFonts.nunito(
                color: AppTheme.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 16),
            Icon(Icons.image, color: AppTheme.primaryColor),
          ],
        ),
      ),
    );
  }

  Widget _buildAddButton(BusinessDirectoryProvider provider,BuildContext ctx) {
    return GestureDetector(
      onTap: () async {
        await provider.onAddBusiness(ctx).then(
          (value) {
            if (ctx.mounted) {
              showAppDialog(
                ctx,
                'Business Added Successfully',
                DialogType.success,
                'Okay',
                () {
                  ctx.pop();
                },
              );
            }
          },
        );
      },
      child: Container(
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
      ),
    );
  }
}