const SweetieKit = require('std:sweetiekit.node');

const {
  UIView,
} = SweetieKit;

let colletion;
let mgr;
let frame;

function getItems() {
  return 1000;
}

let cells = {};

function getCell(collectionView, { section, row }) {
  let cell = cells[`${section}:${row}`];
  if (cell) {
    return cell;
  }
  console.log('getCell', collectionView, { section, row });
  cell = cells[`${section}:${row}`] = new UICollectionViewCell(frame);
  cell.backgroundColor = {red: Math.random(), green: Math.random(), blue: Math.random()};
  const label = UILabel(frame);
  label.numberOfLines = 0;
  label.text = 'Lorem ipsum dolor amet cray cronut pok pok veniam kitsch literally. Occupy letterpress mixtape mollit nostrud.';
  label.sizeToFit();
  cell.addSubview(label);
  return cell;
}

function handleCellSelected(collectionView, { section, row }) {
  console.log('handleCellSelected', collectionView, { section, row });
}

function setCollectionManager() {
  mgr = new UICollectionViewManager(getItems, getCell);
  mgr.didSelectItemAt = handleCellSelected;
  collection.dataSource = mgr;
  collection.delegate = mgr;
}

async function make(nav, demoVC) {
  //setupDefaults();
  collection = new UICollectionView(frame = demoVC.view.frame);
  demoVC.view.addSubview(collection);
  //setupConstraints(demoVC);
  //addBarItem(nav, demoVC);
  setCollectionManager();
  //nav.isToolbarHidden = false;
  nav.pushViewController(demoVC);
}

module.exports = make;
