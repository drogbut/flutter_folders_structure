import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_folders_structure/modules/authentication/presenter/providers/gender_and_age_provider/display_age_cubit.dart';

import '../../../../../core/constants/my_styles.dart';
import '../../../../../core/extensions/context.dart';
import '../../../../../core/utilities/dialog.dart';
import '../../providers/gender_and_age_provider/age_selection_cubit.dart';
import '../../providers/gender_and_age_provider/display_age_state.dart';
import 'age_container.dart';

class AgeRangeButton extends StatelessWidget {
  const AgeRangeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgeSelectionCubit, String>(
      builder: (context, selectedAge) {
        return ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(MyStyles.xLargeBorderRadius),
            side: BorderSide(color: context.colorScheme.primary),
          ),
          leading: Text(selectedAge),
          trailing: const Icon(Icons.keyboard_arrow_down),
          onTap: () => _showGenderDialog(context),
        );
      },
    );
  }

  Future<void> _showGenderDialog(BuildContext context) async {
    return await myBottomSheet(
      context,
      MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: context.read<AgeSelectionCubit>(),
          ),
          BlocProvider.value(value: context.read<AgesDisplayCubit>()..displayAges())
        ],
        child: SizedBox(
            height: MediaQuery.of(context).size.height / 2.7,
            child: BlocBuilder<AgesDisplayCubit, DisplayAgeState>(
              builder: (context, state) {
                if (state is AgesLoading) {
                  return Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  );
                }

                if (state is AgesLoaded) {
                  return AgeContainer(ages: state.agesSnapshot);
                }

                if (state is AgesLoadFailure) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(state.errorMessage),
                  );
                }

                return const SizedBox();
              },
            )),
      ),
    );
  }
}