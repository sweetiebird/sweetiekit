const SweetieKit = require('std:sweetiekit.node');

const {
  UITableViewCell,
  UIFont,
} = SweetieKit;

const font = new UIFont('Arial-BoldMT', 17);

async function make() {
  const cell = new UITableViewCell();
  cell.textLabel.text = 'Oh hai!';
  cell.textLabel.font = font;
  return cell;
}

module.exports = make;
