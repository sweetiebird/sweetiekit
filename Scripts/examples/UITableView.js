const SweetieKit = require('std:sweetiekit.node');

const enums = require('./enums');

const { UITableViewScrollPosition } = enums;

const {
  UITableViewCell,
  UITableView,
  UITableViewManager,
  UIBarButtonItem,
  NSUserDefaults,
} = SweetieKit;

let todos = [];
let defaults;
let mgr;
let table;

const boldFont = new UIFont('Arial-BoldMT', 17);
const regFont = new UIFont('Arial', 17);

function setupDefaults() {
  defaults = new NSUserDefaults();

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

  table.scrollToRowAt(
    { section: 0, row: todos.length - 1 },
    UITableViewScrollPosition.Top,
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
  const cell = new UITableViewCell();
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
  const cell = tableView.cellForRowAt({ section, row });
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
  mgr = new UITableViewManager(getRows, getCell);
  mgr.didSelectRowAt = handleCellSelected;
  table.dataSource = mgr;
  table.delegate = mgr;
}

async function make(nav, demoVC) {
  setupDefaults();
  table = new UITableView();
  demoVC.view.addSubview(table);
  setupConstraints(demoVC);
  addBarItem(nav, demoVC);
  setTableManager();
  nav.isToolbarHidden = false;
  nav.pushViewController(demoVC);
}

module.exports = make;
