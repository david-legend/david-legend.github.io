import 'package:flutter/material.dart';
import 'package:aerium/core/utils/functions.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';

class ExperienceSection extends StatelessWidget {
  ExperienceSection({
    required this.duration,
    required this.position,
    required this.company,
    required this.location,
    required this.roles,
    this.companyUrl,
    this.roleTextStyle,
    this.companyTextStyle,
    this.locationTextStyle,
    this.durationTextStyle,
    this.positionTextStyle,
    this.onTap,
  });

  final String duration;
  final String position;
  final String? company;
  final String? companyUrl;
  final String location;
  final List<String> roles;
  final GestureTapCallback? onTap;
  final TextStyle? roleTextStyle;
  final TextStyle? locationTextStyle;
  final TextStyle? companyTextStyle;
  final TextStyle? positionTextStyle;
  final TextStyle? durationTextStyle;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      child: ListView(
        children: [
          Row(
            children: [
              Text(
                position,
                style: positionTextStyle ??
                    theme.textTheme.headline6!.copyWith(
                      color: AppColors.complimentColor2,
                    ),
              ),
              SpaceW4(),
              InkWell(
                onTap: onTap ?? (() => Functions.launchUrl(companyUrl!)),
                child: Text(
                  '@' + company!,
                  style: companyTextStyle ??
                      theme.textTheme.headline6!.copyWith(
                        color: AppColors.complimentColor1,
                      ),
                ),
              )
            ],
          ),
          Text(
            location,
            style: locationTextStyle ??
                theme.textTheme.bodyText1!.copyWith(
                  fontSize: Sizes.TEXT_SIZE_16,
                  color: AppColors.accentColor,
                ),
          ),
          SpaceH4(),
          Text(
            duration,
            style: durationTextStyle ??
                theme.textTheme.bodyText1!.copyWith(
                  fontSize: Sizes.TEXT_SIZE_16,
                  color: AppColors.accentColor,
                ),
          ),
          SpaceH16(),
          ..._buildRoles(roles),
        ],
      ),
    );
  }

  List<Widget> _buildRoles(List<String> roles) {
    List<Widget> roleWidgets = [];
    for (var index = 0; index < roles.length; index++) {
      roleWidgets.add(Role(role: roles[index]));
      roleWidgets.add(SpaceH8());
    }

    return roleWidgets;
  }
}

class Role extends StatelessWidget {
  Role({
    required this.role,
    this.roleTextStyle,
    this.icon = Icons.arrow_right,
    this.iconSize = Sizes.ICON_SIZE_18,
    this.color = AppColors.complimentColor1,
  });

  final String role;
  final TextStyle? roleTextStyle;
  final IconData icon;
  final Color color;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      children: [
        Icon(
          icon,
          size: iconSize,
          color: color,
        ),
        SpaceW8(),
        Expanded(
          child: Text(
            role,
            style: roleTextStyle ??
                theme.textTheme.bodyText1!.copyWith(
                  color: AppColors.accentColor3,
                ),
          ),
        ),
      ],
    );
  }
}
