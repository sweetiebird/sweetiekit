const SweetieKit = require('std:sweetiekit.node');

const {
  UITableViewCell,
} = SweetieKit;

async function make() {
  const cell = new UITableViewCell();
  cell.textLabel.text = 'Oh hai!';
  cell.textLabel.font = 'Arial-BoldMT';
  return cell;
}

module.exports = make;
