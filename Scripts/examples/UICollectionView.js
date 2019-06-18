const SweetieKit = require('std:sweetiekit.node');

const {
  UIView,
} = SweetieKit;

cells = {};

global.prepareColumnFlowLayout = function prepareColumnFlowLayout(self, cellsPerRow) {
  let collectionView = self.collectionView;
  if (!collectionView) {
    return;
  }
  let marginsAndInsets = self.sectionInset.left + self.sectionInset.right + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + self.minimumInteritemSpacing * (cellsPerRow - 1);
  let itemWidth = Math.floor((collectionView.bounds.width - marginsAndInsets) / (cellsPerRow));
  cells = {};
  self.itemSize = CGSizeMake(itemWidth, 2*itemWidth);
  return self;
};

global.makeColumnFlowLayout = function makeColumnFlowLayout(cellsPerRow, minimumInteritemSpacing = 0, minimumLineSpacing = 0, sectionInset = UIEdgeInsetsZero) {
  let self = UICollectionViewFlowLayout();

  self.minimumInteritemSpacing = minimumInteritemSpacing;
  self.minimumLineSpacing = minimumLineSpacing;
  self.sectionInset = sectionInset;

  prepareColumnFlowLayout(self, cellsPerRow);
  return self;
};

function getItems() {
  return 1000;
}

global.getCell = function getCell({ section, row }, construct) {
  let cell = cells[`${section}:${row}`];
  if (cell) {
    return cell;
  }
  if (construct) {
    console.log('getCell', { section, row });
    cell = cells[`${section}:${row}`] = new UICollectionViewCell(frame);
    cell.layer.cornerRadius = 10;
    cell.layer.masksToBounds = true;
    cell.backgroundColor = {red: Math.random(), green: Math.random(), blue: Math.random()};
    const label = UILabel(frame);
    label.numberOfLines = 0;
    label.text = 'Lorem ipsum dolor amet cray cronut pok pok veniam kitsch literally. Occupy letterpress mixtape mollit nostrud.';
    label.sizeToFit();
    cell.contentView.addSubview(label);
    label.pinToSuperviewWithInsets(UIEdgeInsetsMake(20, 20, 20, 20));
    return cell;
  }
};

function handleCellSelected(collectionView, path) {
  const cell = getCell(path);
  console.log('handleCellSelected', collectionView, path, cell);
  if (cell) {
    cell.layer.borderColor = UIColor.clear;
    cell.layer.borderWidth = 1;
    UIView.animateWithDurationAnimations(0.5, () => {
      cell.layer.borderColor = UIColor.white;
    });
  }
}

function handleCellDeselected(collectionView, path) {
  const cell = getCell(path);
  console.log('handleCellDeselected', collectionView, path, cell);
  if (cell) {
    UIView.animateWithDurationAnimationsCompletion(0.5, () => {
      cell.layer.borderColor = UIColor.clear;
    }, () => {
      cell.layer.borderWidth = 0;
    });
  }
}

function handleCellHighlighted(collectionView, path) {
  const cell = getCell(path);
  console.log('handleCellHighlighted', collectionView, path, cell);
  if (cell) {
    cell.backgroundColor = ColorWithAlpha(cell.backgroundColor, 0.5);
  }
}

function handleCellUnhighlighted(collectionView, path) {
  const cell = getCell(path);
  console.log('handleCellUnhighlighted', collectionView, path, cell);
  if (cell) {
    cell.backgroundColor = ColorWithAlpha(cell.backgroundColor, 1.0);
  }
}

function setCollectionManager() {
  mgr = new UICollectionViewManager(getItems, (collectionView, indexPath) => {
    return getCell(indexPath, true);
  });
  mgr.didSelectItemAt = handleCellSelected;
  mgr.didDeselectItemAt = handleCellDeselected;
  mgr.didHighlightItemAt = handleCellHighlighted;
  mgr.didUnhighlightItemAt = handleCellUnhighlighted;
  collection.dataSource = mgr;
  collection.delegate = mgr;
}

async function make(nav, demoVC) {
  layout = makeColumnFlowLayout(2, 20, 20, UIEdgeInsetsMake(20, 20, 20, 20));
  collection = new UICollectionView(frame = demoVC.view.frame, layout);
  setCollectionManager();
  collection.viewWillAppear = () => {
    prepareColumnFlowLayout(layout, 2);
  };
  demoVC.view.addSubview(collection);
  collection.pinToSuperview();
  nav.pushViewController(demoVC);
}

module.exports = make;
