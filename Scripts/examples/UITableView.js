const SweetieKit = require('std:sweetiekit.node');

const {
  UITableViewCell,
  UITableView,
  UITableViewManager,
} = SweetieKit;

const getNumberOfRowsInSection = (tableView, section) => {
  return 1;
};

const getCellForRowAt = (tableView, indexPath) => {
  const cell = new UITableViewCell();
  cell.text = `Row ${indexPath.row}`;
  cell.textLabel.font = 'Arial-BoldMT';
  return cell;
};

async function make() {
  const table = new UITableView();
  const mgr = new UITableViewManager(getNumberOfRowsInSection, getCellForRowAt);
  table.dataSource = mgr;
  table.delegate = mgr;
  return table;
}

module.exports = make;
