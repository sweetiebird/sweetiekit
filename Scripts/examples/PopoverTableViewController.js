const SweetieKit = require('std:sweetiekit.node');
const colors = require('./colors');

const {
  UITableViewController,
  UITableViewDataSource,
  UITableViewDelegate,
  UIFont,
  UIPopoverPresentationControllerDelegate,
} = SweetieKit;

ArrayChoiceTableViewController = class ArrayChoiceTableViewController {
  constructor(choices = [], onSelect) {
    if (!ArrayChoiceTableViewController.font) {
      ArrayChoiceTableViewController.font = UIFont('Arial', 17);
    }
    this.choices = choices;
    this.onSelect = onSelect;
    this.api = UITableViewController();
    this.api.tableView.delegate = UITableViewDelegate({
      tableViewDidSelectRowAtIndexPath: (tableView, { section, row }) => {
        if (this.onSelect) {
          this.onSelect(row);
        }
      },
    });
    this.api.tableView.dataSource = UITableViewDataSource({
      tableViewNumberOfRowsInSection: () => this.choices.length,
      tableViewCellForRowAtIndexPath: (tableView, { section, row }) => {
        const cell = UITableViewCell.alloc().initWithStyleReuseIdentifier(UITableViewCellStyleDefault,
          `ArrayChoiceTableViewController_${this.api.selfAddress}_${section},${row}`);
        try {
          let choice = this.choices[row];
          if (typeof choice === 'function') {
            choice = choice(row);
          }
          if (choice != null) {
            if (typeof choice === 'string') {
              choice = {
                text: choice,
                font: ArrayChoiceTableViewController.font,
              };
            }
            if (typeof choice === 'object') {
              let { text, font, backgroundColor } = choice;
              font = font || ArrayChoiceTableViewController.font;
              if (text == null) {
                text = '';
              }
              cell.textLabel.text = text;
              cell.textLabel.font = font;
              if (backgroundColor) {
                cell.contentView.backgroundColor = backgroundColor;
              }
            }
          }
        } catch (err) {
          console.warn(err.stack);
        }
        return cell;
      },
    });
  }
};

PopoverTableViewController_action = function PopoverTableViewController_action(sender, nav, demoVC) {
  const choices = [{
    text: "red",
    backgroundColor: colors.fitbodPink,
  }, {
    text: "blue",
    backgroundColor: RGB(87, 174, 176),
  }];
  for (let i = 0; i < 1000; i++) {
    const r = Math.floor(Math.random() * 256);
    const g = Math.floor(Math.random() * 256);
    const b = Math.floor(Math.random() * 256);
    choices.push({
      text: `RGB(${r},${g},${b})`,
      backgroundColor: RGB(r, g, b),
    });
  }
  const chooser = new ArrayChoiceTableViewController(choices, (choice) => {
    const result = choices[choice];
    if (result && result.backgroundColor) {
      sender.backgroundColor = result.backgroundColor;
    }
  });
  const vc = chooser.api;
  vc.modalPresentationStyle = UIModalPresentationPopover;
  vc.preferredContentSize = CGSizeMake(1, 1);
  vc.tableView.viewDidAppear = () => {
    vc.preferredContentSize = CGSizeMake(300, vc.tableView.contentSize.height);
  };

  const ppc = vc.popoverPresentationController;
  ppc.sourceView = sender;
  ppc.sourceRect = sender.bounds;
  ppc.permittedArrowDirections = UIPopoverArrowDirectionUp;
  ppc.delegate = UIPopoverPresentationControllerDelegate({
    // ensure the popover shows in portrait mode
    // https://www.ralfebert.de/ios-examples/uikit/choicepopover/
    adaptivePresentationStyleForPresentationController: () => {
      return UIModalPresentationNone;
    },
  });

  // show the popover.
  demoVC.presentViewControllerAnimatedCompletion(vc, true, () => {});

  return chooser;
};

PopoverTableViewController_make = function PopoverTableViewController_make(nav, demoVC) {

  nav.pushViewControllerAnimated(demoVC, true);

  const view = demoVC.view;
  const button = UIButton(CGRectMake(12, 80, view.frame.width - 24, 50));
  view.addSubview(button);

  button.setTitleForState('👋 Hello Button', UIControlStateNormal);
  button.addTargetActionForControlEvents((sender) => {
    PopoverTableViewController_vc = PopoverTableViewController_action(sender, nav, demoVC);
  }, UIControlEventTouchUpInside);
  button.backgroundColor = RGB(87, 174, 176);
  button.layer.cornerRadius = 4;
  button.layer.shadowRadius = 12;
  button.layer.shadowColor = RGB(87, 174, 176);
  button.layer.shadowOffset = CGSizeMake(0, 12);
};

function make(...args) {
  return PopoverTableViewController_make(...args);
}

module.exports = make;
