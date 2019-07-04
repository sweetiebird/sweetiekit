const SweetieKit = require('std:sweetiekit.node');

const enums = require('./enums');

const {
  UITableViewCell,
  UITableView,
  UIBarButtonItem,
  NSUserDefaults,
} = SweetieKit;

let todos = [];
let defaults;
let mgr;
let table;

const boldFont = UIFont('Arial-BoldMT', 17);
const regFont = UIFont('Arial', 17);

function setupDefaults() {
  defaults = NSUserDefaults.standardUserDefaults;

  const existingTodos = defaults.stringForKey('TODOS');
  if (existingTodos) {
    const todosObj = JSON.parse(existingTodos);
    if (todosObj) {
      todos = todosObj;
    }
  } else {
    const strTodos = JSON.stringify(todos);
    defaults.setValueForKey(strTodos, 'TODOS');
  }
}

function setupConstraints(demoVC) {
  table.translatesAutoresizingMaskIntoConstraints = false;

  table
    .leadingAnchor
    .constraintEqualToAnchor(demoVC.view.leadingAnchor, 0)
    .isActive = true;
  table
    .trailingAnchor
    .constraintEqualToAnchor(demoVC.view.trailingAnchor, 0)
    .isActive = true;
  table
    .topAnchor
    .constraintEqualToAnchor(demoVC.view.topAnchor, 0)
    .isActive = true;
  table
    .bottomAnchor
    .constraintEqualToAnchor(demoVC.view.bottomAnchor, 0)
    .isActive = true;
}

function addNewTodo() {
  const d = new Date();
  const dateStr = `${d.toLocaleDateString()} ${d.toLocaleTimeString()}`;

  const newTodo = {
    text: dateStr,
    isDone: false,
  };

  todos.push(newTodo);

  table.reloadData();

  table.scrollToRowAtIndexPathAtScrollPositionAnimated(
    { section: 0, row: todos.length - 1 },
    UITableViewScrollPositionTop,
    true,
  );

  const todosStr = JSON.stringify(todos);
  defaults.setValueForKey(todosStr, 'TODOS');
}

function done(nav) {
  nav.isToolbarHidden = true;
}

function addBarItem(nav, demoVC) {
  const addBarItem = new UIBarButtonItem('Add', addNewTodo);
  const doneBarItem = new UIBarButtonItem('Done', () => {
    done(nav);
  });
  demoVC.toolbarItems = [addBarItem, doneBarItem];
}

function getRows() {
  return todos.length;
}

function getCell(tableView, { section, row }) {
  const cell = UITableViewCell.alloc().initWithStyleReuseIdentifier(UITableViewCellStyleDefault, "id");
  const todo = todos[row];
  if (todo && todo.text) {
    cell.textLabel.text = todo.text;
    if (!todo.isDone) {
      cell.textLabel.font = boldFont;
    } else {
      cell.textLabel.font = regFont;
    }
  }
  return cell;
}

function handleCellSelected(tableView, { section, row }) {
  const cell = tableView.cellForRowAtIndexPath({ section, row });
  if (cell) {
    cell.isSelected = false;
  }
  if (todos[row]) {
    todos[row].isDone = !todos[row].isDone;
    const todosStr = JSON.stringify(todos);
    defaults.setValueForKey(todosStr, 'TODOS');
    tableView.reloadData();
  }
}

function setTableManager() {
  table.dataSource = UITableViewDataSource({
    tableViewNumberOfRowsInSection: getRows,
    tableViewCellForRowAtIndexPath: getCell,
  });
  table.delegate = UITableViewDelegate({
    tableViewDidSelectRowAtIndexPath: handleCellSelected,
  });
}

async function make(nav, demoVC) {
  setupDefaults();
  table = new UITableView();
  demoVC.view.addSubview(table);
  setupConstraints(demoVC);
  addBarItem(nav, demoVC);
  setTableManager();
  nav.isToolbarHidden = false;
  nav.pushViewControllerAnimated(demoVC, true);
}

module.exports = make;
