const SweetieKit = require('std:sweetiekit.node');

const NSTextAlignment = require('./enums').NSTextAlignment;

const {
  UIPickerView,
  UIPickerViewManager,
  UILabel,
} = SweetieKit;

let mgr;
let picker;
let label;

const items = [
  'A',
  'B',
  'C',
  'D',
];

function getComponents(pv) {
  return 1;
}

function getRows(pv, component) {
  return items.length;
}

function handleRowSelected(pv, row, component) {
  label.text = items[row];
}

function titleForRow(pv, row) {
  return items[row];
}

function setPickerManager() {
  mgr = new UIPickerViewManager(getComponents, getRows);
  mgr.didSelectRow = handleRowSelected;
  mgr.titleForRow = titleForRow;
  picker.dataSource = mgr;
  picker.delegate = mgr;
}

async function make(nav, demoVC) {
  const frame = {
    x: 0,
    y: demoVC.view.frame.height / 3,
    width: demoVC.view.frame.width,
    height: 200,
  };
  picker = new UIPickerView(frame);
  setPickerManager();
  label = UILabel({
    x: 12,
    y: 60,
    width: demoVC.view.frame.width - 24,
    height: 20,
  });
  label.textAlignment = NSTextAlignment.center;

  demoVC.view.addSubview(label);

  return picker;
}

module.exports = make;
