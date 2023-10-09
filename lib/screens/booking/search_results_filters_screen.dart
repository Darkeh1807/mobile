import 'package:bus_booking/config/theme/palette.dart';
import 'package:bus_booking/utils/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../widgets/base/custom_primary_button.dart';

class SearchResultsFilterScreen extends StatelessWidget {
  const SearchResultsFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context, null),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "Accra, Ghana - Lagos, Nigeria",
          style: GoogleFonts.manrope(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                "Reset All",
              ))
        ],
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 18,
                left: 20,
                bottom: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bus Type",
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Palette.baseBlack,
                    ),
                  ),
                  ChoiceChip(
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.string("""
      <svg width="17" height="16" viewBox="0 0 17 16" fill="none" xmlns="http://www.w3.org/2000/svg">
      <g clip-path="url(#clip0_482_12891)">
      <path fill-rule="evenodd" clip-rule="evenodd" d="M9.91 1.16992L11.33 2.58992L9.5 4.41992V6.26992L11.1 5.33992L11.26 4.77992L11.77 2.83992L13.7 3.35992L13.19 5.28992L15.12 5.80992L14.6 7.73992L12.1 7.06992L10.5 7.99992L12.1 8.92992L14.6 8.25992L15.12 10.1899L13.19 10.7099L13.7 12.6399L11.77 13.1599L11.26 11.2199L11.1 10.6599L9.5 9.72992V11.5899L11.33 13.4099L9.91 14.8299L8.5 13.3999L7.09 14.8199L5.67 13.3999L7.1 11.9999L7.51 11.5899V9.72992L5.91 10.6599L5.75 11.2199L5.24 13.1599L3.3 12.6399L3.82 10.7099L1.89 10.1899L2.41 8.25992L4.34 8.77992L4.9 8.92992L6.5 7.99992L4.9 7.06992L4.33 7.21992L2.4 7.73992L1.88 5.80992L3.8 5.29992L3.3 3.35992L5.24 2.83992L5.9 5.33992L7.5 6.26992V4.41992L7.09 3.99992L5.67 2.59992L7.1 1.16992L8.5 2.59992L9.91 1.17992V1.16992Z" fill="#698CA5"/>
      </g>
      <defs>
      <clipPath id="clip0_482_12891">
      <rect width="16" height="16" fill="white" transform="translate(0.5)"/>
      </clipPath>
      </defs>
      </svg>
      """),
                        addHorizontalSpace(10),
                        const Text(
                          "Air conditioning",
                        ),
                      ],
                    ),
                    // padding: EdgeInsets.symmetric(
                    //     horizontal: 12, vertical: 12),
                    backgroundColor: Colors.white,
                    elevation: 0,
                    side: const BorderSide(
                      color:
                          // selectedTripType == e
                          //     ? Color(0xFF0402FC)

                          //     :

                          Palette.lightBorder,
                      width: 1,
                    ),
                    selectedColor: Palette.primaryColor,
                    labelStyle: GoogleFonts.quicksand(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color:
                          // selectedTripType == e
                          //     ? Colors.white
                          const Color(0xFF20415B),
                    ),
                    selected: false,
                    onSelected: (bool selected) {
                      // setState(() {
                      //   selectedTripType = selected ? e : "";
                      // });
                    },
                  ),
                  ChoiceChip(
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.string("""
      <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
      <g clip-path="url(#clip0_482_12899)">
      <path fill-rule="evenodd" clip-rule="evenodd" d="M4 3C3.46957 3 2.96086 3.21071 2.58579 3.58579C2.21071 3.96086 2 4.46957 2 5V11C2 12.1 2.9 13 4 13H12C12.5304 13 13.0391 12.7893 13.4142 12.4142C13.7893 12.0391 14 11.5304 14 11V5C14 4.46957 13.7893 3.96086 13.4142 3.58579C13.0391 3.21071 12.5304 3 12 3H4ZM8 6H4V7H5.5V10H6.5V7H8.38L9.5 10H10.5L12 6H11L10 8.67L9 6H8Z" fill="#698CA5"/>
      </g>
      <defs>
      <clipPath id="clip0_482_12899">
      <rect width="16" height="16" fill="white"/>
      </clipPath>
      </defs>
      </svg>
      
      """),
                        addHorizontalSpace(10),
                        const Text(
                          "Entertainment (No Wifi)",
                        ),
                      ],
                    ),
                    // padding: EdgeInsets.symmetric(
                    //     horizontal: 12, vertical: 12),
                    backgroundColor: Colors.white,
                    elevation: 0,
                    side: const BorderSide(
                      color:
                          // selectedTripType == e
                          //     ? Color(0xFF0402FC)

                          //     :

                          Palette.lightBorder,
                      width: 1,
                    ),
                    selectedColor: Palette.primaryColor,
                    labelStyle: GoogleFonts.quicksand(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color:
                          // selectedTripType == e
                          //     ? Colors.white
                          const Color(0xFF20415B),
                    ),
                    selected: false,
                    onSelected: (bool selected) {
                      // setState(() {
                      //   selectedTripType = selected ? e : "";
                      // });
                    },
                  ),
                  addVerticalSpace(10),
                  Row(
                    children: [
                      ChoiceChip(
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.string("""
      <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
      <g clip-path="url(#clip0_482_12907)">
      <path fill-rule="evenodd" clip-rule="evenodd" d="M4.46001 3.64007C4.41273 3.44834 4.32816 3.2678 4.21111 3.10876C4.09406 2.94971 3.94683 2.81528 3.77783 2.71314C3.43651 2.50685 3.02723 2.44459 2.64001 2.54007C2.25279 2.63555 1.91937 2.88094 1.71308 3.22225C1.50679 3.56357 1.44453 3.97286 1.54001 4.36007L2.98001 10.0901C3.48001 12.0901 5.28001 13.5001 7.34001 13.5001H11C11.3978 13.5001 11.7794 13.342 12.0607 13.0607C12.342 12.7794 12.5 12.3979 12.5 12.0001C12.5 11.6022 12.342 11.2207 12.0607 10.9394C11.7794 10.6581 11.3978 10.5001 11 10.5001H7.34001C7.00759 10.4965 6.68578 10.3826 6.42514 10.1762C6.16449 9.96988 5.97978 9.6828 5.90001 9.36007L4.46001 3.64007ZM9.00001 7.79007V7.00007H11V7.80007C11 8.24007 11.54 8.46007 11.85 8.14007L13.65 6.34007C13.7416 6.24661 13.7929 6.12095 13.7929 5.99007C13.7929 5.85919 13.7416 5.73354 13.65 5.64007L11.85 3.85007C11.7795 3.78097 11.6901 3.73428 11.5932 3.71589C11.4962 3.6975 11.3959 3.70823 11.305 3.74673C11.2141 3.78522 11.1366 3.84977 11.0824 3.93222C11.0281 4.01468 10.9994 4.11136 11 4.21007V5.00007H9.00001V4.20007C8.99864 4.10221 8.96857 4.0069 8.91354 3.92596C8.85851 3.84503 8.78093 3.78202 8.69043 3.74476C8.59993 3.70749 8.50049 3.69761 8.40442 3.71633C8.30835 3.73505 8.2199 3.78155 8.15001 3.85007L6.35001 5.65007C6.2584 5.74354 6.20708 5.86919 6.20708 6.00007C6.20708 6.13095 6.2584 6.25661 6.35001 6.35007L8.15001 8.15007C8.22051 8.21917 8.30988 8.26586 8.40687 8.28425C8.50385 8.30265 8.60412 8.29191 8.69502 8.25342C8.78591 8.21492 8.86338 8.15037 8.91766 8.06792C8.97194 7.98546 9.00059 7.88879 9.00001 7.79007Z" fill="#698CA5"/>
      </g>
      <defs>
      <clipPath id="clip0_482_12907">
      <rect width="16" height="16" fill="white"/>
      </clipPath>
      </defs>
      </svg>
      """),
                            addHorizontalSpace(10),
                            const Text(
                              "Standard seat",
                            ),
                          ],
                        ),
                        // padding: EdgeInsets.symmetric(
                        //     horizontal: 12, vertical: 12),
                        backgroundColor: Colors.white,
                        elevation: 0,
                        side: const BorderSide(
                          color:
                              // selectedTripType == e
                              //     ? Color(0xFF0402FC)

                              //     :

                              Palette.lightBorder,
                          width: 1,
                        ),
                        selectedColor: Palette.primaryColor,
                        labelStyle: GoogleFonts.quicksand(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color:
                              // selectedTripType == e
                              //     ? Colors.white
                              const Color(0xFF20415B),
                        ),
                        selected: false,
                        onSelected: (bool selected) {
                          // setState(() {
                          //   selectedTripType = selected ? e : "";
                          // });
                        },
                      ),
                      addHorizontalSpace(30),
                      ChoiceChip(
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.string("""
      <svg width="17" height="16" viewBox="0 0 17 16" fill="none" xmlns="http://www.w3.org/2000/svg">
      <g clip-path="url(#clip0_482_12915)">
      <path fill-rule="evenodd" clip-rule="evenodd" d="M8.16466 13.0702L6.76466 11.6302C6.95387 11.446 7.17768 11.3011 7.42319 11.2038C7.6687 11.1065 7.93104 11.0588 8.19508 11.0635C8.45911 11.0681 8.71961 11.125 8.96155 11.2309C9.20348 11.3367 9.42206 11.4894 9.60466 11.6802L8.16466 13.0702ZM12.4747 8.90022L11.0347 10.3002C10.2981 9.53874 9.28958 9.10055 8.23034 9.08181C7.1711 9.06306 6.14769 9.46528 5.38466 10.2002L3.98466 8.74022C4.55189 8.19058 5.22206 7.75835 5.95673 7.46832C6.69139 7.17828 7.47609 7.03616 8.26581 7.05009C9.05553 7.06403 9.83473 7.23375 10.5587 7.54953C11.2827 7.8653 11.9372 8.32091 12.4847 8.89022L12.4747 8.90022ZM15.3547 6.12022L13.9147 7.52022C12.4412 5.99423 10.422 5.11591 8.30107 5.07841C6.18015 5.0409 4.13115 5.84728 2.60466 7.32022L1.21466 5.88022C3.12158 4.03698 5.68261 3.02675 8.33437 3.07175C10.9861 3.11676 13.5114 4.21333 15.3547 6.12022Z" fill="#698CA5"/>
      </g>
      <defs>
      <clipPath id="clip0_482_12915">
      <rect width="16" height="16" fill="white" transform="translate(0.284973)"/>
      </clipPath>
      </defs>
      </svg>
      
      """),
                            addHorizontalSpace(10),
                            const Text(
                              "Wifi",
                            ),
                          ],
                        ),
                        // padding: EdgeInsets.symmetric(
                        //     horizontal: 12, vertical: 12),
                        backgroundColor: Colors.white,
                        elevation: 0,
                        side: const BorderSide(
                          color:
                              // selectedTripType == e
                              //     ? Color(0xFF0402FC)

                              //     :

                              Palette.lightBorder,
                          width: 1,
                        ),
                        selectedColor: Palette.primaryColor,
                        labelStyle: GoogleFonts.quicksand(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color:
                              // selectedTripType == e
                              //     ? Colors.white
                              const Color(0xFF20415B),
                        ),
                        selected: false,
                        onSelected: (bool selected) {
                          // setState(() {
                          //   selectedTripType = selected ? e : "";
                          // });
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Divider(
              height: 1,
            ),
            addVerticalSpace(15),
            Padding(
              padding: const EdgeInsets.only(bottom: 25, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Departure Time",
                    style: GoogleFonts.manrope(
                      color: Palette.baseBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  addVerticalSpace(13),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "From",
                              style: GoogleFonts.manrope(
                                color: const Color(0xFF64748B),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            addVerticalSpace(8),
                            TimeSelectButton(
                              selecteTime: "",
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 30 / 375,
                        margin: const EdgeInsets.only(left: 10, right: 10, top: 25),
                        height: 1,
                        color: Palette.lightBorder,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "To",
                              style: GoogleFonts.manrope(
                                color: const Color(0xFF64748B),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            addVerticalSpace(8),
                            TimeSelectButton(
                              selecteTime: "",
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              height: 1,
            ),
            addVerticalSpace(10),
            Padding(
              padding: const EdgeInsets.only(bottom: 25, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Arrival Time",
                    style: GoogleFonts.manrope(
                      color: Palette.baseBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  addVerticalSpace(13),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "From",
                              style: GoogleFonts.manrope(
                                color: const Color.fromARGB(255, 182, 192, 206),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            addVerticalSpace(8),
                            TimeSelectButton(
                              selecteTime: "",
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 30 / 375,
                        margin: const EdgeInsets.only(left: 10, right: 10, top: 25),
                        height: 1,
                        color: Palette.lightBorder,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "To",
                              style: GoogleFonts.manrope(
                                color: const Color(0xFF64748B),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            addVerticalSpace(8),
                            TimeSelectButton(
                              selecteTime: "",
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              height: 1,
            ),
            addVerticalSpace(10),
            Padding(
              padding: const EdgeInsets.only(bottom: 25, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Boarding Point",
                    style: GoogleFonts.manrope(
                      color: Palette.baseBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  addVerticalSpace(16),
                  FilterSearchButtonWidget(
                    innerLabel: "Enter/Search boarding point",
                    onTap: () {},
                  )
                ],
              ),
            ),
            const Divider(
              height: 1,
            ),
            addVerticalSpace(10),
            Padding(
              padding: const EdgeInsets.only(bottom: 25, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dropping Point",
                    style: GoogleFonts.manrope(
                      color: Palette.baseBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  addVerticalSpace(16),
                  FilterSearchButtonWidget(
                    innerLabel: "Enter/Search boarding point",
                    onTap: () {},
                  )
                ],
              ),
            ),
            const Divider(
              height: 1,
            ),
            addVerticalSpace(10),
            Padding(
              padding: const EdgeInsets.only(bottom: 25, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bus Operator",
                    style: GoogleFonts.manrope(
                      color: Palette.baseBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  addVerticalSpace(16),
                  FilterSearchButtonWidget(
                    innerLabel: "Enter/Search bus operator",
                    onTap: () {},
                  )
                ],
              ),
            ),
            addVerticalSpace(40),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 24),
              width: double.maxFinite,
              child: Expanded(
                child: CustomPrimaryButton(
                  text: "Apply Filters",
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimeSelectButton extends StatelessWidget {
  const TimeSelectButton({
    super.key,
    required this.selecteTime,
    this.onPressed,
  });
  final String selecteTime;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 0,
          ),
          side: const BorderSide(
            color: Palette.lightBorder,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          alignment: Alignment.centerLeft),
      onPressed: () {
        showTimePicker(context: context, initialTime: TimeOfDay.now());
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "00:00",
            style: GoogleFonts.quicksand(
                color: const Color(0xFFE2E8F0),
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "AM",
                style: GoogleFonts.quicksand(
                    color: Palette.greyText,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              addHorizontalSpace(8),
              const Icon(
                Icons.keyboard_arrow_down,
                color: Palette.greyText,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class FilterSearchButtonWidget extends StatelessWidget {
  const FilterSearchButtonWidget({
    super.key,
    required this.onTap,
    required this.innerLabel,
    this.leading,
  });
  final VoidCallback onTap;
  final String innerLabel;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.maxFinite,
          margin: const EdgeInsets.only(
            bottom: 7,
          ),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 30,
                ),
                side: const BorderSide(
                  color: Palette.lightBorder,
                  width: 2,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.centerLeft),
            onPressed: onTap,
            child: Row(
              children: [
                if (leading != null) leading!,
                addHorizontalSpace(leading != null ? 10 : 0),
                Text(
                  innerLabel,
                  style: GoogleFonts.quicksand(
                      color: Palette.lightBorder,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 20,
          child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: const Icon(Iconsax.search_normal_1,
                  size: 16, color: Palette.greyText)),
        ),
      ],
    );
  }
}
