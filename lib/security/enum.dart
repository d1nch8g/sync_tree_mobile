enum PinEnum {
  copyPrivate,
  changePrivate,
  generatePrivate,
  setPin,
  securitySettings,
  changePubName,
  sendChanges,
  viewLicenses,
}

var pinAccordance = <PinEnum, String>{
  PinEnum.copyPrivate: "copyPrivate",
  PinEnum.changePrivate: "changePrivate",
  PinEnum.generatePrivate: "generatePrivate",
  PinEnum.setPin: "setPin",
  PinEnum.securitySettings: "securitySetting",
  PinEnum.changePubName: "changePrivate",
  PinEnum.sendChanges: "sendChanges",
  PinEnum.viewLicenses: "viewLicenses",
};

var pinDefaults = <PinEnum, bool>{
  PinEnum.copyPrivate: true,
  PinEnum.changePrivate: true,
  PinEnum.generatePrivate: true,
  PinEnum.setPin: true,
  PinEnum.securitySettings: true,
  PinEnum.changePubName: true,
  PinEnum.sendChanges: true,
  PinEnum.viewLicenses: false,
};

var pinSettingNames = <PinEnum, String>{
  PinEnum.copyPrivate: "Copy private key",
  PinEnum.changePrivate: "Change private key",
  PinEnum.generatePrivate: "Generate new private key",
  PinEnum.changePubName: "Change public name",
  PinEnum.sendChanges: "Upload changes",
};
