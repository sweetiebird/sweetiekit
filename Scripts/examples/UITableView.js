const SweetieKit = process._linkedBinding('sweetiekit');

const enums = require('./enums');

const {
  UITableViewCell,
  UITableView,
  UIBarButtonItem,
  NSUserDefaults,
} = SweetieKit;

let todos = [];
let defaults;
let table;

const boldFont = UIFont('Arial-BoldMT', 17);
const regFont = UIFont('Arial', 17);

getTodos = function getTodos() {
  return todos;
};

getTodo = function getTodo(index) {
  return getTodos()[index];
};

saveTodos = function saveTodos(todos = getTodos(), defaults = NSUserDefaults.standardUserDefaults) {
  const todosStr = JSON.stringify(todos);
  defaults.setValueForKey(todosStr, 'TODOS');
  return todos;
};

removeTodo = function removeTodo(index, todos = getTodos()) {
  if (index >= 0 && index < todos.length) {
    todos.splice(index, 1);
  }
};

moveTodo = function moveTodo(srcIndex, dstIndex, todos = getTodos()) {
  const todo = todos[srcIndex];
  removeTodo(srcIndex);
  if (todo) {
    if (dstIndex < 0) {
      dstIndex = 0;
    }
    if (dstIndex > todos.length) {
      dstIndex = todos.length;
    }
    todos.splice(dstIndex, 0, todo);
  }
};

function setupDefaults() {
  defaults = NSUserDefaults.standardUserDefaults;

  const existingTodos = defaults.stringForKey('TODOS');
  if (existingTodos) {
    const todosObj = JSON.parse(existingTodos);
    if (todosObj) {
      todos = todosObj;
    }
  } else {
    saveTodos();
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

  saveTodos();
}

function done(nav) {
  nav.isToolbarHidden = true;
}

function addBarItem(nav, demoVC) {
  const addBarItem = new UIBarButtonItem('Add', addNewTodo);
  const doneBarItem = new UIBarButtonItem('Done', () => {
    done(nav);
  });
  const editBarItem = new UIBarButtonItem('Edit', () => {
    if (table) {
      table.isEditing = !table.isEditing;
    }
  });
  demoVC.toolbarItems = [addBarItem, doneBarItem, editBarItem];
}

function getRows() {
  return todos.length;
}

function getCell(tableView, { section, row }) {
  const cell = UITableViewCell.alloc().initWithStyleReuseIdentifier(UITableViewCellStyleDefault, "id");
  const todo = getTodo(row);
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
    saveTodos();
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
  table.delegate.tableViewTitleForDeleteConfirmationButtonForRowAtIndexPath = () =>
    "Delete?";
  table.dataSource.tableViewCommitEditingStyleForRowAtIndexPath = (tableView, style, path) => {
    if (style === UITableViewCellEditingStyleDelete) {
      removeTodo(path.row);
      saveTodos();
      table.reloadData();
    //} else if (style === UITableViewCellEditingStyleInsert) {
    } else {
      console.warn('tableViewCommitEditingStyleForRowAtIndexPath: unknown style', style, path);
    }
  };
  table.dataSource.tableViewMoveRowAtIndexPathToIndexPath = (tableView, src, dst) => {
    moveTodo(src.row, dst.row);
    saveTodos();
    table.reloadData();
  };
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
