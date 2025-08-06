import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/dropdown/age_dropdown_cubit.dart';
import '../../bloc/dropdown/age_dropdown_state.dart';

class AgeDropdown extends StatelessWidget {
  const AgeDropdown({super.key});
  @override
  Widget build(BuildContext context) {
    final ageOptions = [
      'Under 18',
      '18 - 24',
      '25 - 34',
      '35 - 44',
      '45+',
    ];
    return BlocProvider(
      create: (_) => AgeDropdownCubit(),
      child: BlocBuilder<AgeDropdownCubit, AgeDropdownState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              color: Color(0xffF4F4F4),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(0, 3), // vị trí bóng đổ
                ),
              ],
            ),
            height: 50,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                value: (state.selectedAge?.isEmpty ?? true) ? null : state.selectedAge,
                hint: Text(
                  'Age Range',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Satoshi',
                  ),
                ),
                items: ageOptions.map((age){
                  return DropdownMenuItem(
                    value: age,
                    child: Text(
                      age,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Satoshi'
                      ),
                    ),
                  );
                }).toList(),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                isExpanded: true,
                onChanged: (value) {
                  context.read<AgeDropdownCubit>().selectAge(value.toString());
                },

                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 6,
                        spreadRadius: 2,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                ),

                menuItemStyleData: const MenuItemStyleData(
                  height: 48,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}