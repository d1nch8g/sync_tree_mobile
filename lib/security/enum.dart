enum PinEnum {
  copyPrivate,
  changePrivate,
  generatePrivate,
  setPin,
  securitySettings,
  changePubName,
  saveChanges,
  viewLicenses,
}

var pinAccordance = <PinEnum, String>{
  PinEnum.copyPrivate: "copyPrivate",
  PinEnum.changePrivate: "changePrivate",
  PinEnum.generatePrivate: "generatePrivate",
  PinEnum.setPin: "setPin",
  PinEnum.securitySettings: "securitySetting",
  PinEnum.changePubName: "changePrivate",
  PinEnum.saveChanges: "saveChanges",
  PinEnum.viewLicenses: "viewLicenses",
};

var pinDefaults = <PinEnum, bool>{
  PinEnum.copyPrivate: true,
  PinEnum.changePrivate: true,
  PinEnum.generatePrivate: true,
  PinEnum.setPin: true,
  PinEnum.securitySettings: true,
  PinEnum.changePubName: true,
  PinEnum.saveChanges: true,
  PinEnum.viewLicenses: false,
};
