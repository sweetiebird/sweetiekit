const SweetieKit = process._linkedBinding('sweetiekit');

const colors = require('./colors');

const {
  UIView,
  AVAudioPlayer,
  AVAudioSession,
  UIButton,
  NSBundle,
  NSURL,
} = SweetieKit;

const { AVAudioSessionCategory } = UIKit;

async function make(nav, demoVC) {
  const w = demoVC.view.frame.width;
  const h = demoVC.view.frame.height;
  bgFrame = { x: 0, y: 0, width: w, height: h };
  bgView = UIView(bgFrame);

  playBtn = UIButton({
    x: 12,
    y: 100,
    width: w - 24,
    height: 50,
  });

  playBtn.backgroundColor = colors.white;
  playBtn.showsTouchWhenHighlighted = true;
  playBtn.setTitleForState('PLAY️', UIControlStateNormal);
  playBtn.setTitleColorForState(colors.black, UIControlStateNormal);

  const sound = NSBundle.main().pathForResourceOfType('sunflower', 'mp3');
  const url = NSURL.initFileURLWithPath(sound);
  console.log(sound, url);

  try {
    session = AVAudioSession.sharedInstance();
    session.setCategoryError(AVAudioSessionCategoryPlayback);
    audioPlayer = AVAudioPlayer.alloc().initWithContentsOfURLError(url);
  } catch (err) {
    console.log('error initializing audio player', err);
  }

  console.log(audioPlayer);

  playBtn.addTargetActionForControlEvents(() => {
    console.log('button press');
    console.log(audioPlayer);
    var success = audioPlayer.prepareToPlay();
    console.log(success);
    audioPlayer.play();
  }, UIControlEventTouchUpInside);

  demoVC.view.addSubview(playBtn);

  nav.pushViewControllerAnimated(demoVC, true);
}

module.exports = make;
