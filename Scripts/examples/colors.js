module.exports.fitbodPink = RGB(238, 118, 103);
module.exports.fitbodDarkGrey = RGB(24, 26, 27);
module.exports.fitbodMedGrey = RGB(29, 31, 32);
module.exports.fitbodMedGrey = RGB(59, 66, 70);
module.exports.fitbodLightGrey = RGB(59, 66, 70);
module.exports.black = UIColor.black;
module.exports.white = UIColor.white;
module.exports.clear = UIColor.clear;


module.exports.theme = {
  dark: {
    controlBackgroundColor: RGB(26, 31, 53),

    backgroundColor: RGB(20, 24, 42),
    backgroundDarkColor: RGB(17, 19, 36),
    textColor: RGB(245, 247, 252),
    tintColor: RGB(245, 247, 252),
    trimColor: RGB(245, 247, 252),
    foregroundColor: RGB(255, 255, 255),
    foregroundDarkColor: RGB(255, 255, 255),

    controlForegroundColor: RGB(39, 72, 255),
    activeColor: RGB(241, 77, 27),
    inactiveColor: RGB(184, 194, 216),
  },

  light: {
    controlBackgroundColor: RGB(255, 255, 255),

    backgroundColor: RGB(245, 247, 252),
    backgroundDarkColor: RGB(233, 237, 244),
    textColor: RGB(20, 24, 42),
    tintColor: RGB(20, 24, 42),
    trimColor: RGB(20, 24, 42),
    foregroundColor: RGB(26, 31, 53),
    foregroundDarkColor: RGB(20, 24, 42),

    controlForegroundColor: RGB(39, 72, 255),
    activeColor: RGB(241, 77, 27),
    inactiveColor: RGB(184, 194, 216),
  },
};

module.exports.currentTheme = 'dark';

module.exports.getTheme = (which = module.exports.currentTheme) => {
  return module.exports.theme[which];
};
