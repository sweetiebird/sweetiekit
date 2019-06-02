const SweetieKit = require('std:sweetiekit.node');

const {
  UILabel,
  UIView,
  UIFont,
} = SweetieKit;

const font = new UIFont('Arial-BoldMT', 17);

async function make(demoVC) {
  const w = demoVC.view.frame.width;
  const h = demoVC.view.frame.height;
  const labelsView = UIView({ x: 12, y: 80, width: w - 24, height: h - 80 });
  const label = new UILabel({ x: 12, y: 80, width: w - 24, height: 100 });
  label.numberOfLines = 0;
  label.text = 'Lorem ipsum dolor amet cray cronut pok pok veniam kitsch literally. Occupy letterpress mixtape mollit nostrud.';
  label.sizeToFit();
  const label2y = label.frame.y + label.frame.height + 12;
  const label2 = new UILabel({ x: 12, y: label2y, width: w - 24, height: 100 });
  label2.numberOfLines = 0;
  label2.text = 'Pariatur ethical ullamco blue bottle lo-fi. Voluptate health goth plaid, kinfolk mixtape crucifix vaporware kickstarter pop-up fixie chillwave lomo. Kickstarter mumblecore brunch tofu in pok pok.';
  label2.font = font;
  label2.sizeToFit();
  labelsView.addSubview(label);
  labelsView.addSubview(label2);
  return labelsView;
}

module.exports = make;
