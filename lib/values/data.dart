part of 'values.dart';

class CertificationData {
  CertificationData({
    required this.title,
    required this.image,
    required this.imageSize,
    required this.url,
    required this.awardedBy,
  });

  final String image;
  final double imageSize;
  final String url;
  final String title;
  final String awardedBy;
}

class ProjectDetails {
  ProjectDetails({
    required this.projectImage,
    required this.projectName,
    required this.projectDescription,
    this.technologyUsed,
    required this.isPublic,
    this.isLive,
    required this.isOnPlayStore,
    this.playStoreUrl,
    this.webUrl,
    this.hasBeenReleased,
    this.gitHubUrl,
  });

  final String projectImage;
  final String projectName;
  final String projectDescription;
  final bool isPublic;
  final bool isOnPlayStore;
  final bool? isLive;
  final bool? hasBeenReleased;
  final String? playStoreUrl;
  final String? gitHubUrl;
  final String? webUrl;
  final String? technologyUsed;
}

class ExperienceData {
  ExperienceData({
    required this.position,
    required this.roles,
    required this.location,
    required this.duration,
    required this.company,
    this.companyUrl,
  });

  final String company;
  final String? companyUrl;
  final String location;
  final String duration;
  final String position;
  final List<String> roles;
}

class SkillData {
  SkillData({
    required this.skillName,
    required this.skillLevel,
  });

  final String skillName;
  final double skillLevel;
}

class SubMenuData {
  SubMenuData({
    required this.title,
    this.isSelected,
    this.content,
    this.skillData,
    this.isAnimation = false,
  });

  final String title;
  final String? content;
  final List<SkillData>? skillData;
  bool isAnimation;
  bool? isSelected;
}

class Data {
  static List<NavItemData> menuItems = [
    NavItemData(name: StringConst.HOME, route: StringConst.HOME_PAGE),
    NavItemData(name: StringConst.ABOUT, route: StringConst.ABOUT_PAGE),
    NavItemData(name: StringConst.WORKS, route: StringConst.WORKS_PAGE),
    NavItemData(
      name: StringConst.EXPERIENCE,
      route: StringConst.EXPERIENCE_PAGE,
    ),
    NavItemData(
      name: StringConst.CERTIFICATIONS,
      route: StringConst.CERTIFICATION_PAGE,
    ),
    NavItemData(name: StringConst.CONTACT, route: StringConst.CONTACT_PAGE),
  ];

  static List<SocialData> socialData = [
    SocialData(
      name: StringConst.GITHUB,
      iconData: FontAwesomeIcons.github,
      url: StringConst.GITHUB_URL,
    ),
    SocialData(
      name: StringConst.LINKED_IN,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
    SocialData(
      name: StringConst.TWITTER,
      iconData: FontAwesomeIcons.twitter,
      url: StringConst.TWITTER_URL,
    ),
    SocialData(
      name: StringConst.INSTAGRAM,
      iconData: FontAwesomeIcons.instagram,
      url: StringConst.INSTAGRAM_URL,
    ),
    SocialData(
      name: StringConst.TELEGRAM,
      iconData: FontAwesomeIcons.telegram,
      url: StringConst.TELEGRAM_URL,
    ),
  ];

  static List<String> mobileTechnologies = [
    "Android",
    "Flutter",
    "Java Android",
    "Kotlin",
    "Dart"
  ];

  static List<String> otherTechnologies = [
    "HTML 5",
    "CSS 3",
    "JavaScript",
    "Wordpress",
    "React JS",
    "Node JS",
    "Git",
    "Laravel",
    "PHP",
    "Dart",
    "SQL",
    "C++",
    "Firebase",
  ];
  static List<SocialData> socialData1 = [
    SocialData(
      name: StringConst.GITHUB,
      iconData: FontAwesomeIcons.github,
      url: StringConst.GITHUB_URL,
    ),
    SocialData(
      name: StringConst.LINKED_IN,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
    SocialData(
      name: StringConst.TWITTER,
      iconData: FontAwesomeIcons.twitter,
      url: StringConst.TWITTER_URL,
    ),
  ];

  static List<SocialData> socialData2 = [
    SocialData(
      name: StringConst.LINKED_IN,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
    SocialData(
      name: StringConst.TWITTER,
      iconData: FontAwesomeIcons.twitter,
      url: StringConst.TWITTER_URL,
    ),
    SocialData(
      name: StringConst.INSTAGRAM,
      iconData: FontAwesomeIcons.instagram,
      url: StringConst.INSTAGRAM_URL,
    ),
    SocialData(
      name: StringConst.TELEGRAM,
      iconData: FontAwesomeIcons.telegram,
      url: StringConst.TELEGRAM_URL,
    ),
  ];

  static List<SkillData> skillData = [
    SkillData(skillLevel: 95, skillName: StringConst.FLUTTER),
    SkillData(skillLevel: 70, skillName: StringConst.JAVA),
    SkillData(skillLevel: 78, skillName: StringConst.ANDROID),
    SkillData(skillLevel: 70, skillName: StringConst.KOTLIN),
    SkillData(skillLevel: 80, skillName: StringConst.JAVASCRIPT),
    SkillData(skillLevel: 80, skillName: StringConst.PHP),
    SkillData(skillLevel: 80, skillName: StringConst.LARAVEL),
    SkillData(skillLevel: 80, skillName: StringConst.SQL),
    SkillData(skillLevel: 90, skillName: StringConst.WORDPRESS),
    SkillData(skillLevel: 80, skillName: StringConst.BOOTSTRAP),
    SkillData(skillLevel: 80, skillName: StringConst.HTML_CSS),
  ];

  static List<SubMenuData> subMenuData = [
    SubMenuData(
      title: StringConst.KEY_SKILLS,
      isSelected: true,
      isAnimation: true,
      skillData: skillData,
    ),
    SubMenuData(
      title: StringConst.EDUCATION,
      isSelected: false,
      content: StringConst.EDUCATION_TEXT,
    ),
  ];
  static List<ProjectItemData> recentWorks = [
    // ProjectItemData(
    //   title: StringConst.FLUTTER_CATALOG,
    //   subtitle: StringConst.FLUTTER_CATALOG,
    //   platform: StringConst.FLUTTER_CATALOG_PLATFORM,
    //   primaryColor: AppColors.flutter_catalog,
    //   image: ImagePath.FLUTTER_CATALOG_COVER,
    //   portfolioDescription: StringConst.FLUTTER_CATALOG_DETAIL,
    //   imageSize: 0.15,
    //   isPublic: true,
    //   isOnPlayStore: true,
    //   technologyUsed: StringConst.FLUTTER,
    //   gitHubUrl: StringConst.FLUTTER_CATALOG_GITHUB_URL,
    //   playStoreUrl: StringConst.FLUTTER_CATALOG_PLAYSTORE_URL,
    // ),
    ProjectItemData(
      title: StringConst.DROP,
      subtitle: StringConst.DROP,
      platform: StringConst.DROP_PLATFORM,
      primaryColor: AppColors.drop,
      image: ImagePath.DROP_COVER,
      portfolioDescription: StringConst.DROP_DETAIL,
      imageSize: 0.15,
      isPublic: true,
      isOnPlayStore: true,
      technologyUsed: StringConst.FLUTTER,
      gitHubUrl: StringConst.DROP_GITHUB_URL,
      playStoreUrl: StringConst.DROP_PLAYSTORE_URL,
    ),
    ProjectItemData(
      title: StringConst.ROAM,
      subtitle: StringConst.ROAM,
      primaryColor: AppColors.roam,
      platform: StringConst.ROAM_PLATFORM,
      image: ImagePath.ROAM_COVER,
      portfolioDescription: StringConst.ROAM_DETAIL,
      imageSize: 0.15,
      isPublic: true,
      isOnPlayStore: true,
      technologyUsed: StringConst.FLUTTER,
      gitHubUrl: StringConst.ROAM_GITHUB_URL,
      playStoreUrl: StringConst.ROAM_PLAYSTORE_URL,
    ),
    //  ProjectItemData(
    //   title: StringConst.LOGIN_CATALOG,
    //   primaryColor: AppColors.login_catalog,
    //   subtitle: StringConst.LOGIN_CATALOG,
    //    platform: StringConst.LOGIN_CATALOG_PLATFORM,
    //   image: ImagePath.LOGIN_CATALOG_COVER,
    //   portfolioDescription: StringConst.LOGIN_CATALOG_DETAIL,
    //   imageSize: 0.15,
    //   isPublic: true,
    //   isOnPlayStore: true,
    //   technologyUsed: StringConst.FLUTTER,
    //   gitHubUrl: StringConst.LOGIN_CATALOG_GITHUB_URL,
    //   playStoreUrl: StringConst.LOGIN_CATALOG_PLAYSTORE_URL,
    // ),
    ProjectItemData(
      title: StringConst.FOODY_BITE,
      subtitle: StringConst.FOODY_BITE_SUBTITLE,
      primaryColor: AppColors.foodybite,
      platform: StringConst.FOODY_BITE_PLATFORM,
      image: ImagePath.FOODY_BITE_COVER,
      portfolioDescription: StringConst.FOODY_BITE_DETAIL,
      imageSize: 0.15,
      isPublic: true,
      isOnPlayStore: true,
      technologyUsed: StringConst.FLUTTER,
      gitHubUrl: StringConst.FOODY_BITE_GITHUB_URL,
      playStoreUrl: StringConst.FOODY_BITE_PLAYSTORE_URL,
    ),
    ProjectItemData(
      title: StringConst.NIMBUS,
      subtitle: StringConst.NIMBUS,
      primaryColor: AppColors.nimbus,
      platform: StringConst.NIMBUS_PLATFORM,
      image: ImagePath.NIMBUS_COVER,
      portfolioDescription: StringConst.NIMBUS_DETAIL,
      imageSize: 0.15,
      isPublic: true,
      isOnPlayStore: true,
      technologyUsed: StringConst.FLUTTER,
      gitHubUrl: StringConst.NIMBUS_GITHUB_URL,
      webUrl: StringConst.NIMBUS_WEB_URL,
    ),
  ];

  static List<ProjectItemData> projects = [
    ProjectItemData(
      title: StringConst.OTP_TEXT_FIELD,
      subtitle: StringConst.OTP_TEXT_FIELD_SUBTITLE,
      primaryColor: AppColors.otp_package,
      platform: StringConst.OTP_TEXT_FIELD_PLATFORM,
      image: ImagePath.OTP_TEXT_FIELD,
      portfolioDescription: StringConst.OTP_TEXT_FIELD_DETAIL,
      imageSize: 0.15,
      isPublic: true,
      isLive: true,
      technologyUsed: StringConst.FLUTTER,
      gitHubUrl: StringConst.OTP_TEXT_FIELD_GITHUB_URL,
      webUrl: StringConst.OTP_TEXT_FIELD_WEB_URL,
    ),
    ProjectItemData(
      title: StringConst.LOGIN_CATALOG,
      subtitle: StringConst.LOGIN_CATALOG_SUBTITLE,
      primaryColor: AppColors.login_catalog,
      platform: StringConst.LOGIN_CATALOG_PLATFORM,
      image: ImagePath.LOGIN_CATALOG,
      portfolioDescription: StringConst.LOGIN_CATALOG_DETAIL,
      imageSize: 0.3,
      isPublic: true,
      technologyUsed: StringConst.FLUTTER,
      gitHubUrl: StringConst.LOGIN_CATALOG_GITHUB_URL,
    ),
    ProjectItemData(
      title: StringConst.FOODY_BITE,
      subtitle: StringConst.FOODY_BITE_SUBTITLE,
      primaryColor: AppColors.foodybite,
      platform: StringConst.FOODY_BITE_PLATFORM,
      image: ImagePath.FOODY_BITE,
      portfolioDescription: StringConst.FOODY_BITE_DETAIL,
      imageSize: 0.45,
      isPublic: true,
      technologyUsed: StringConst.FLUTTER,
      gitHubUrl: StringConst.FOODY_BITE_GITHUB_URL,
    ),
    ProjectItemData(
      title: StringConst.AERIUM,
      subtitle: StringConst.AERIUM_SUBTITLE,
      primaryColor: AppColors.aerium_v1,
      platform: StringConst.AERIUM_PLATFORM,
      image: ImagePath.AERIUM,
      portfolioDescription: StringConst.AERIUM_DETAIL,
      imageSize: 0.3,
      isPublic: true,
      isLive: true,
      technologyUsed: StringConst.FLUTTER,
      gitHubUrl: StringConst.AERIUM_GITHUB_URL,
      webUrl: StringConst.AERIUM_WEB_URL,
    ),
  ];

  static List<CertificationData> certificationData = [
    CertificationData(
      title: StringConst.ASSOCIATE_ANDROID_DEV,
      url: StringConst.ASSOCIATE_ANDROID_DEV_URL,
      image: ImagePath.ASSOCIATE_ANDROID_DEV,
      imageSize: 0.325,
      awardedBy: StringConst.GOOGLE,
    ),
    CertificationData(
      title: StringConst.DATA_SCIENCE,
      url: StringConst.DATA_SCIENCE_CERT_URL,
      image: ImagePath.DATA_SCIENCE_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.UDACITY,
    ),
    CertificationData(
      title: StringConst.ANDROID_BASICS,
      url: StringConst.ANDROID_BASICS_CERT_URL,
      image: ImagePath.ANDROID_BASICS_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.UDACITY,
    ),
  ];

  static List<ExperienceData> experienceData = [
    ExperienceData(
      company: StringConst.COMPANY_5,
      position: StringConst.POSITION_5,
      companyUrl: StringConst.COMPANY_5_URL,
      roles: [
        StringConst.COMPANY_5_ROLE_1,
        StringConst.COMPANY_5_ROLE_2,
        StringConst.COMPANY_5_ROLE_3,
      ],
      location: StringConst.LOCATION_5,
      duration: StringConst.DURATION_5,
    ),
    ExperienceData(
      company: StringConst.COMPANY_4,
      position: StringConst.POSITION_4,
      companyUrl: StringConst.COMPANY_4_URL,
      roles: [
        StringConst.COMPANY_4_ROLE_1,
        StringConst.COMPANY_4_ROLE_2,
        StringConst.COMPANY_4_ROLE_3,
        StringConst.COMPANY_4_ROLE_4,
      ],
      location: StringConst.LOCATION_4,
      duration: StringConst.DURATION_4,
    ),
    ExperienceData(
      company: StringConst.COMPANY_3,
      position: StringConst.POSITION_3,
      companyUrl: StringConst.COMPANY_3_URL,
      roles: [
        StringConst.COMPANY_3_ROLE_1,
        StringConst.COMPANY_3_ROLE_2,
        StringConst.COMPANY_3_ROLE_3,
      ],
      location: StringConst.LOCATION_3,
      duration: StringConst.DURATION_3,
    ),
    ExperienceData(
      company: StringConst.COMPANY_2,
      position: StringConst.POSITION_2,
      companyUrl: StringConst.COMPANY_2_URL,
      roles: [
        StringConst.COMPANY_2_ROLE_1,
        StringConst.COMPANY_2_ROLE_2,
        StringConst.COMPANY_2_ROLE_3,
      ],
      location: StringConst.LOCATION_2,
      duration: StringConst.DURATION_2,
    ),
  ];
}
