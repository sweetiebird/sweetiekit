//
//  AppDelegate.swift
//
//  Created by Emily Kolar on 4/9/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

import UIKit

extension String: Error {}

extension DispatchQueue {
    class func mainSyncSafe(execute work: () -> Void) {
        if Thread.isMainThread {
            work()
        } else {
            DispatchQueue.main.sync(execute: work)
        }
    }

    class func mainSyncSafe<T>(execute work: () throws -> T) rethrows -> T {
        if Thread.isMainThread {
            return try work()
        } else {
            return try DispatchQueue.main.sync(execute: work)
        }
    }
}

@objc(ScriptGetter)
class ScriptGetter: NSObject {
  @objc
  static func Get(name: String) -> String? {
    guard let bundleURL = Bundle.main.url(forResource: "Scripts", withExtension: "bundle") else { iOSLog0("Scripts bundle not found"); iOSTrap(); return nil; }
    guard let bundle = Bundle(url: bundleURL) else { iOSLog0("Scripts bundle url not found"); iOSTrap(); return nil; }
    guard let scriptURL = bundle.url(forResource: name, withExtension: "js") else { iOSLog0("demo not found"); iOSTrap(); return nil; }
    return scriptURL.path
  }
}

@objc(AppDelegate)
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    @objc static var queue: DispatchQueue! = DispatchQueue(label: "sweetiekit.node", attributes: .concurrent)
  
    typealias FetchCallbackCompletionHandler = (UIBackgroundFetchResult) -> Void;
  typealias FetchCallback = (@escaping FetchCallbackCompletionHandler) -> Void;
    @objc static var fetchCallback: FetchCallback?;

    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
      AppDelegate.fetchCallback?(completionHandler);
    }
  
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        /*
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabVC") as! UITabBarController
        let firstVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "firstVC") as! FirstViewController
        let secondVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "secondVC") as! SecondViewController
        vc.setViewControllers([firstVC, secondVC], animated: false)
        window?.rootViewController = vc;*/
      
       UIApplication.shared.setMinimumBackgroundFetchInterval(UIApplication.backgroundFetchIntervalMinimum)

        iOSLog0("Finished launching\n");
        //embed_start();
        if (false) {
            run_mksnapshot_with_args("mksnapshot\0--turbo_instruction_scheduling\0--embedded_variant\0Default\0--embedded_src\0embedded.S\0--startup_src\0snapshot.cc\0\0");
            iOSLog0("Done embedding");
            iOSTrap();
        } else if (false) {
          hellov8async("node-ios-hello");
        } else if (false) {
//        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabVC") as! UITabBarController
//        let first = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "first") as! FirstViewController
//        vc.setViewControllers([first], animated: false)
//        window?.rootViewController = vc
/*
            if window?.rootViewController is UITabBarController {
                if let firstChild = window?.rootViewController?.children.first {
                     rootViewController = firstChild
                }
            }*/
            registerNodeDLibs()
            chdir(getenv("HOME"))
            chdir("Documents")
            guard let bundleURL = Bundle.main.url(forResource: "Scripts", withExtension: "bundle") else { iOSLog0("Scripts bundle not found"); iOSTrap(); return false; }
            guard let bundle = Bundle(url: bundleURL) else { iOSLog0("Scripts bundle url not found"); iOSTrap(); return false; }
            guard let scriptURL = bundle.url(forResource: "todo", withExtension: "js") else { iOSLog0("demo not found"); iOSTrap(); return false; }

            //iOSLog0(scriptURL.path);
            #if false
            //AppDelegate.queue = DispatchQueue(label: "sweetiekit.node", attributes: .concurrent)
            AppDelegate.queue.async {
              hello_node("node\0--jitless\0\(scriptURL.path)\0\0");
            }
            #elseif true
            hello_node_async("node\0--jitless\0\(scriptURL.path)\0\0");
            #else
          hello_node("""
node\0\
--jitless\0\
-e\0\

{
            ms = {};
            let exports = ms;
            let module = {exports};
            /**
            * Helpers.
            */
            
            var s = 1000;
            var m = s * 60;
            var h = m * 60;
            var d = h * 24;
            var w = d * 7;
            var y = d * 365.25;
            
            /**
            * Parse or format the given `val`.
            *
            * Options:
            *
            *  - `long` verbose formatting [false]
            *
            * @param {String|Number} val
            * @param {Object} [options]
            * @throws {Error} throw an error if val is not a non-empty string or a number
            * @return {String|Number}
            * @api public
            */
            
            ms = exports = module.exports = function(val, options) {
            options = options || {};
            var type = typeof val;
            if (type === 'string' && val.length > 0) {
            return parse(val);
            } else if (type === 'number' && isFinite(val)) {
            return options.long ? fmtLong(val) : fmtShort(val);
            }
            throw new Error(
            'val is not a non-empty string or a valid number. val=' +
            JSON.stringify(val)
            );
            };
            
            /**
            * Parse the given `str` and return milliseconds.
            *
            * @param {String} str
            * @return {Number}
            * @api private
            */
            
            function parse(str) {
            str = String(str);
            if (str.length > 100) {
            return;
            }
            var match = /^(-?(?:\\d+)?\\.?\\d+) *(milliseconds?|msecs?|ms|seconds?|secs?|s|minutes?|mins?|m|hours?|hrs?|h|days?|d|weeks?|w|years?|yrs?|y)?$/i.exec(
            str
            );
            if (!match) {
            return;
            }
            var n = parseFloat(match[1]);
            var type = (match[2] || 'ms').toLowerCase();
            switch (type) {
            case 'years':
            case 'year':
            case 'yrs':
            case 'yr':
            case 'y':
            return n * y;
            case 'weeks':
            case 'week':
            case 'w':
            return n * w;
            case 'days':
            case 'day':
            case 'd':
            return n * d;
            case 'hours':
            case 'hour':
            case 'hrs':
            case 'hr':
            case 'h':
            return n * h;
            case 'minutes':
            case 'minute':
            case 'mins':
            case 'min':
            case 'm':
            return n * m;
            case 'seconds':
            case 'second':
            case 'secs':
            case 'sec':
            case 's':
            return n * s;
            case 'milliseconds':
            case 'millisecond':
            case 'msecs':
            case 'msec':
            case 'ms':
            return n;
            default:
            return undefined;
            }
            }
            
            /**
            * Short format for `ms`.
            *
            * @param {Number} ms
            * @return {String}
            * @api private
            */
            
            function fmtShort(ms) {
            var msAbs = Math.abs(ms);
            if (msAbs >= d) {
            return Math.round(ms / d) + 'd';
            }
            if (msAbs >= h) {
            return Math.round(ms / h) + 'h';
            }
            if (msAbs >= m) {
            return Math.round(ms / m) + 'm';
            }
            if (msAbs >= s) {
            return Math.round(ms / s) + 's';
            }
            return ms + 'ms';
            }
            
            /**
            * Long format for `ms`.
            *
            * @param {Number} ms
            * @return {String}
            * @api private
            */
            
            function fmtLong(ms) {
            var msAbs = Math.abs(ms);
            if (msAbs >= d) {
            return plural(ms, msAbs, d, 'day');
            }
            if (msAbs >= h) {
            return plural(ms, msAbs, h, 'hour');
            }
            if (msAbs >= m) {
            return plural(ms, msAbs, m, 'minute');
            }
            if (msAbs >= s) {
            return plural(ms, msAbs, s, 'second');
            }
            return ms + ' ms';
            }
            
            /**
            * Pluralization helper.
            */
            
            function plural(ms, msAbs, n, name) {
            var isPlural = msAbs >= n * 1.5;
            return Math.round(ms / n) + ' ' + name + (isPlural ? 's' : '');
            }
}

//////////////
// debug 
//////////////
{
    /**
    * Module dependencies.
    */
    
    const tty = require('tty');
    const util = require('util');
    
    /**
    * This is the Node.js implementation of `debug()`.
    */
    debug = {};
    let exports = debug;
    let module = {exports};
    
    exports.init = init;
    exports.log = log;
    exports.formatArgs = formatArgs;
    exports.save = save;
    exports.load = load;
    exports.useColors = useColors;
    
    /**
    * Colors.
    */
    
    exports.colors = [6, 2, 3, 4, 5, 1];
    
    try {
    // Optional dependency (as in, doesn't need to be installed, NOT like optionalDependencies in package.json)
    // eslint-disable-next-line import/no-extraneous-dependencies
    const supportsColor = require('supports-color');
    
    if (supportsColor && (supportsColor.stderr || supportsColor).level >= 2) {
    exports.colors = [
    20,
    21,
    26,
    27,
    32,
    33,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    56,
    57,
    62,
    63,
    68,
    69,
    74,
    75,
    76,
    77,
    78,
    79,
    80,
    81,
    92,
    93,
    98,
    99,
    112,
    113,
    128,
    129,
    134,
    135,
    148,
    149,
    160,
    161,
    162,
    163,
    164,
    165,
    166,
    167,
    168,
    169,
    170,
    171,
    172,
    173,
    178,
    179,
    184,
    185,
    196,
    197,
    198,
    199,
    200,
    201,
    202,
    203,
    204,
    205,
    206,
    207,
    208,
    209,
    214,
    215,
    220,
    221
    ];
    }
    } catch (error) {
    // Swallow - we only care if `supports-color` is available; it doesn't have to be.
    }
    
    /**
    * Build up the default `inspectOpts` object from the environment variables.
    *
    *   $ DEBUG_COLORS=no DEBUG_DEPTH=10 DEBUG_SHOW_HIDDEN=enabled node script.js
    */
    
    exports.inspectOpts = Object.keys(process.env).filter(key => {
    return /^debug_/i.test(key);
    }).reduce((obj, key) => {
    // Camel-case
    const prop = key
    .substring(6)
    .toLowerCase()
    .replace(/_([a-z])/g, (_, k) => {
    return k.toUpperCase();
    });
    
    // Coerce string value into JS value
    let val = process.env[key];
    if (/^(yes|on|true|enabled)$/i.test(val)) {
    val = true;
    } else if (/^(no|off|false|disabled)$/i.test(val)) {
    val = false;
    } else if (val === 'null') {
    val = null;
    } else {
    val = Number(val);
    }
    
    obj[prop] = val;
    return obj;
    }, {});
    
    /**
    * Is stdout a TTY? Colored output is enabled when `true`.
    */
    
    function useColors() {
    return 'colors' in exports.inspectOpts ?
    Boolean(exports.inspectOpts.colors) :
    tty.isatty(process.stderr.fd);
    }
    
    /**
    * Adds ANSI color escape codes if enabled.
    *
    * @api public
    */
    
    function formatArgs(args) {
    const {namespace: name, useColors} = this;
    
    if (useColors) {
    const c = this.color;
    const colorCode = '\\u001B[3' + (c < 8 ? c : '8;5;' + c);
    const prefix = `  ${colorCode};1m${name} \\u001B[0m`;
    
    args[0] = prefix + args[0].split('\\n').join('\\n' + prefix);
    args.push(colorCode + 'm+' + module.exports.humanize(this.diff) + '\\u001B[0m');
    } else {
    args[0] = getDate() + name + ' ' + args[0];
    }
    }
    
    function getDate() {
    if (exports.inspectOpts.hideDate) {
    return '';
    }
    return new Date().toISOString() + ' ';
    }
    
    /**
    * Invokes `util.format()` with the specified arguments and writes to stderr.
    */
    
    function log(...args) {
    return process.stderr.write(util.format(...args) + '\\n');
    }
    
    /**
    * Save `namespaces`.
    *
    * @param {String} namespaces
    * @api private
    */
    function save(namespaces) {
    if (namespaces) {
    process.env.DEBUG = namespaces;
    } else {
    // If you set a process.env field to null or undefined, it gets cast to the
    // string 'null' or 'undefined'. Just delete instead.
    delete process.env.DEBUG;
    }
    }
    
    /**
    * Load `namespaces`.
    *
    * @return {String} returns the previously persisted debug modes
    * @api private
    */
    
    function load() {
    return process.env.DEBUG;
    }
    
    /**
    * Init logic for `debug` instances.
    *
    * Create a new `inspectOpts` object in case `useColors` is set
    * differently for a particular `debug` instance.
    */
    
    function init(debug) {
    debug.inspectOpts = {};
    
    const keys = Object.keys(exports.inspectOpts);
    for (let i = 0; i < keys.length; i++) {
    debug.inspectOpts[keys[i]] = exports.inspectOpts[keys[i]];
    }
    }


            /**
            * This is the common logic for both the Node.js and web browser
            * implementations of `debug()`.
            */
            
            function setup(env) {
            createDebug.debug = createDebug;
            createDebug.default = createDebug;
            createDebug.coerce = coerce;
            createDebug.disable = disable;
            createDebug.enable = enable;
            createDebug.enabled = enabled;
            createDebug.humanize = ms;
            
            Object.keys(env).forEach(key => {
            createDebug[key] = env[key];
            });
            
            /**
            * Active `debug` instances.
            */
            createDebug.instances = [];
            
            /**
            * The currently active debug mode names, and names to skip.
            */
            
            createDebug.names = [];
            createDebug.skips = [];
            
            /**
            * Map of special "%n" handling functions, for the debug "format" argument.
            *
            * Valid key names are a single, lower or upper-case letter, i.e. "n" and "N".
            */
            createDebug.formatters = {};
            
            /**
            * Selects a color for a debug namespace
            * @param {String} namespace The namespace string for the for the debug instance to be colored
            * @return {Number|String} An ANSI color code for the given namespace
            * @api private
            */
            function selectColor(namespace) {
            let hash = 0;
            
            for (let i = 0; i < namespace.length; i++) {
            hash = ((hash << 5) - hash) + namespace.charCodeAt(i);
            hash |= 0; // Convert to 32bit integer
            }
            
            return createDebug.colors[Math.abs(hash) % createDebug.colors.length];
            }
            createDebug.selectColor = selectColor;
            
            /**
            * Create a debugger with the given `namespace`.
            *
            * @param {String} namespace
            * @return {Function}
            * @api public
            */
            function createDebug(namespace) {
            let prevTime;
            
            function debug(...args) {
            // Disabled?
            if (!debug.enabled) {
            return;
            }
            
            const self = debug;
            
            // Set `diff` timestamp
            const curr = Number(new Date());
            const ms = curr - (prevTime || curr);
            self.diff = ms;
            self.prev = prevTime;
            self.curr = curr;
            prevTime = curr;
            
            args[0] = createDebug.coerce(args[0]);
            
            if (typeof args[0] !== 'string') {
            // Anything else let's inspect with %O
            args.unshift('%O');
            }
            
            // Apply any `formatters` transformations
            let index = 0;
            args[0] = args[0].replace(/%([a-zA-Z%])/g, (match, format) => {
            // If we encounter an escaped % then don't increase the array index
            if (match === '%%') {
            return match;
            }
            index++;
            const formatter = createDebug.formatters[format];
            if (typeof formatter === 'function') {
            const val = args[index];
            match = formatter.call(self, val);
            
            // Now we need to remove `args[index]` since it's inlined in the `format`
            args.splice(index, 1);
            index--;
            }
            return match;
            });
            
            // Apply env-specific formatting (colors, etc.)
            createDebug.formatArgs.call(self, args);
            
            const logFn = self.log || createDebug.log;
            logFn.apply(self, args);
            }
            
            debug.namespace = namespace;
            debug.enabled = createDebug.enabled(namespace);
            debug.useColors = createDebug.useColors();
            debug.color = selectColor(namespace);
            debug.destroy = destroy;
            debug.extend = extend;
            // Debug.formatArgs = formatArgs;
            // debug.rawLog = rawLog;
            
            // env-specific initialization logic for debug instances
            if (typeof createDebug.init === 'function') {
            createDebug.init(debug);
            }
            
            createDebug.instances.push(debug);
            
            return debug;
            }
            
            function destroy() {
            const index = createDebug.instances.indexOf(this);
            if (index !== -1) {
            createDebug.instances.splice(index, 1);
            return true;
            }
            return false;
            }
            
            function extend(namespace, delimiter) {
            const newDebug = createDebug(this.namespace + (typeof delimiter === 'undefined' ? ':' : delimiter) + namespace);
            newDebug.log = this.log;
            return newDebug;
            }
            
            /**
            * Enables a debug mode by namespaces. This can include modes
            * separated by a colon and wildcards.
            *
            * @param {String} namespaces
            * @api public
            */
            function enable(namespaces) {
            createDebug.save(namespaces);
            
            createDebug.names = [];
            createDebug.skips = [];
            
            let i;
            const split = (typeof namespaces === 'string' ? namespaces : '').split(/[\\s,]+/);
            const len = split.length;
            
            for (i = 0; i < len; i++) {
            if (!split[i]) {
            // ignore empty strings
            continue;
            }
            
            namespaces = split[i].replace(/\\*/g, '.*?');
            
            if (namespaces[0] === '-') {
            createDebug.skips.push(new RegExp('^' + namespaces.substr(1) + '$'));
            } else {
            createDebug.names.push(new RegExp('^' + namespaces + '$'));
            }
            }
            
            for (i = 0; i < createDebug.instances.length; i++) {
            const instance = createDebug.instances[i];
            instance.enabled = createDebug.enabled(instance.namespace);
            }
            }
            
            /**
            * Disable debug output.
            *
            * @return {String} namespaces
            * @api public
            */
            function disable() {
            const namespaces = [
            ...createDebug.names.map(toNamespace),
            ...createDebug.skips.map(toNamespace).map(namespace => '-' + namespace)
            ].join(',');
            createDebug.enable('');
            return namespaces;
            }
            
            /**
            * Returns true if the given mode name is enabled, false otherwise.
            *
            * @param {String} name
            * @return {Boolean}
            * @api public
            */
            function enabled(name) {
            if (name[name.length - 1] === '*') {
            return true;
            }
            
            let i;
            let len;
            
            for (i = 0, len = createDebug.skips.length; i < len; i++) {
            if (createDebug.skips[i].test(name)) {
            return false;
            }
            }
            
            for (i = 0, len = createDebug.names.length; i < len; i++) {
            if (createDebug.names[i].test(name)) {
            return true;
            }
            }
            
            return false;
            }
            
            /**
            * Convert regexp to namespace
            *
            * @param {RegExp} regxep
            * @return {String} namespace
            * @api private
            */
            function toNamespace(regexp) {
            return regexp.toString()
            .substring(2, regexp.toString().length - 2)
            .replace(/\\.\\*\\?$/, '*');
            }
            
            /**
            * Coerce `val`.
            *
            * @param {Mixed} val
            * @return {Mixed}
            * @api private
            */
            function coerce(val) {
            if (val instanceof Error) {
            return val.stack || val.message;
            }
            return val;
            }
            
            createDebug.enable(createDebug.load());
            
            return createDebug;
            }
            
    
    debug = exports = module.exports = setup(exports);
    
    const {formatters} = module.exports;
    
    /**
    * Map %o to `util.inspect()`, all on a single line.
    */
    
    formatters.o = function (v) {
    this.inspectOpts.colors = this.useColors;
    return util.inspect(v, this.inspectOpts)
    .replace(/\\s*\\n\\s*/g, ' ');
    };
    
    /**
    * Map %O to `util.inspect()`, allowing multiple lines if needed.
    */
    
    formatters.O = function (v) {
    this.inspectOpts.colors = this.useColors;
    return util.inspect(v, this.inspectOpts);
    };
}

/////////////
// follow-redirects
/////////////
{
    follow_redirects = {};
    let exports = follow_redirects;
    let module = {exports};

var url = require("url");
var URL = url.URL;
var http = require("http");
var https = require("https");
var assert = require("assert");
var Writable = require("stream").Writable;
var debug = debug("follow-redirects");

// RFC7231§4.2.1: Of the request methods defined by this specification,
// the GET, HEAD, OPTIONS, and TRACE methods are defined to be safe.
var SAFE_METHODS = { GET: true, HEAD: true, OPTIONS: true, TRACE: true };

// Create handlers that pass events from native requests
var eventHandlers = Object.create(null);
["abort", "aborted", "error", "socket", "timeout"].forEach(function (event) {
  eventHandlers[event] = function (arg) {
    this._redirectable.emit(event, arg);
  };
});

// An HTTP(S) request that can be redirected
function RedirectableRequest(options, responseCallback) {
  // Initialize the request
  Writable.call(this);
  options.headers = options.headers || {};
  this._options = options;
  this._ended = false;
  this._ending = false;
  this._redirectCount = 0;
  this._redirects = [];
  this._requestBodyLength = 0;
  this._requestBodyBuffers = [];

  // Since http.request treats host as an alias of hostname,
  // but the url module interprets host as hostname plus port,
  // eliminate the host property to avoid confusion.
  if (options.host) {
    // Use hostname if set, because it has precedence
    if (!options.hostname) {
      options.hostname = options.host;
    }
    delete options.host;
  }

  // Attach a callback if passed
  if (responseCallback) {
    this.on("response", responseCallback);
  }

  // React to responses of native requests
  var self = this;
  this._onNativeResponse = function (response) {
    self._processResponse(response);
  };

  // Complete the URL object when necessary
  if (!options.pathname && options.path) {
    var searchPos = options.path.indexOf("?");
    if (searchPos < 0) {
      options.pathname = options.path;
    }
    else {
      options.pathname = options.path.substring(0, searchPos);
      options.search = options.path.substring(searchPos);
    }
  }

  // Perform the first request
  this._performRequest();
}
RedirectableRequest.prototype = Object.create(Writable.prototype);

// Writes buffered data to the current native request
RedirectableRequest.prototype.write = function (data, encoding, callback) {
  // Writing is not allowed if end has been called
  if (this._ending) {
    throw new Error("write after end");
  }

  // Validate input and shift parameters if necessary
  if (!(typeof data === "string" || typeof data === "object" && ("length" in data))) {
    throw new Error("data should be a string, Buffer or Uint8Array");
  }
  if (typeof encoding === "function") {
    callback = encoding;
    encoding = null;
  }

  // Ignore empty buffers, since writing them doesn't invoke the callback
  // https://github.com/nodejs/node/issues/22066
  if (data.length === 0) {
    if (callback) {
      callback();
    }
    return;
  }
  // Only write when we don't exceed the maximum body length
  if (this._requestBodyLength + data.length <= this._options.maxBodyLength) {
    this._requestBodyLength += data.length;
    this._requestBodyBuffers.push({ data: data, encoding: encoding });
    this._currentRequest.write(data, encoding, callback);
  }
  // Error when we exceed the maximum body length
  else {
    this.emit("error", new Error("Request body larger than maxBodyLength limit"));
    this.abort();
  }
};

// Ends the current native request
RedirectableRequest.prototype.end = function (data, encoding, callback) {
  // Shift parameters if necessary
  if (typeof data === "function") {
    callback = data;
    data = encoding = null;
  }
  else if (typeof encoding === "function") {
    callback = encoding;
    encoding = null;
  }

  // Write data if needed and end
  if (!data) {
    this._ended = this._ending = true;
    this._currentRequest.end(null, null, callback);
  }
  else {
    var self = this;
    var currentRequest = this._currentRequest;
    this.write(data, encoding, function () {
      self._ended = true;
      currentRequest.end(null, null, callback);
    });
    this._ending = true;
  }
};

// Sets a header value on the current native request
RedirectableRequest.prototype.setHeader = function (name, value) {
  this._options.headers[name] = value;
  this._currentRequest.setHeader(name, value);
};

// Clears a header value on the current native request
RedirectableRequest.prototype.removeHeader = function (name) {
  delete this._options.headers[name];
  this._currentRequest.removeHeader(name);
};

// Global timeout for all underlying requests
RedirectableRequest.prototype.setTimeout = function (msecs, callback) {
  if (callback) {
    this.once("timeout", callback);
  }

  if (this.socket) {
    startTimer(this, msecs);
  }
  else {
    var self = this;
    this._currentRequest.once("socket", function () {
      startTimer(self, msecs);
    });
  }

  this.once("response", clearTimer);
  this.once("error", clearTimer);

  return this;
};

function startTimer(request, msecs) {
  clearTimeout(request._timeout);
  request._timeout = setTimeout(function () {
    request.emit("timeout");
  }, msecs);
}

function clearTimer() {
  clearTimeout(this._timeout);
}

// Proxy all other public ClientRequest methods
[
  "abort", "flushHeaders", "getHeader",
  "setNoDelay", "setSocketKeepAlive",
].forEach(function (method) {
  RedirectableRequest.prototype[method] = function (a, b) {
    return this._currentRequest[method](a, b);
  };
});

// Proxy all public ClientRequest properties
["aborted", "connection", "socket"].forEach(function (property) {
  Object.defineProperty(RedirectableRequest.prototype, property, {
    get: function () { return this._currentRequest[property]; },
  });
});

// Executes the next native request (initial or redirect)
RedirectableRequest.prototype._performRequest = function () {
  // Load the native protocol
  var protocol = this._options.protocol;
  var nativeProtocol = this._options.nativeProtocols[protocol];
  if (!nativeProtocol) {
    this.emit("error", new Error("Unsupported protocol " + protocol));
    return;
  }

  // If specified, use the agent corresponding to the protocol
  // (HTTP and HTTPS use different types of agents)
  if (this._options.agents) {
    var scheme = protocol.substr(0, protocol.length - 1);
    this._options.agent = this._options.agents[scheme];
  }

  // Create the native request
  var request = this._currentRequest =
        nativeProtocol.request(this._options, this._onNativeResponse);
  this._currentUrl = url.format(this._options);

  // Set up event handlers
  request._redirectable = this;
  for (var event in eventHandlers) {
    /* istanbul ignore else */
    if (event) {
      request.on(event, eventHandlers[event]);
    }
  }

  // End a redirected request
  // (The first request must be ended explicitly with RedirectableRequest#end)
  if (this._isRedirect) {
    // Write the request entity and end.
    var i = 0;
    var self = this;
    var buffers = this._requestBodyBuffers;
    (function writeNext(error) {
      // Only write if this request has not been redirected yet
      /* istanbul ignore else */
      if (request === self._currentRequest) {
        // Report any write errors
        /* istanbul ignore if */
        if (error) {
          self.emit("error", error);
        }
        // Write the next buffer if there are still left
        else if (i < buffers.length) {
          var buffer = buffers[i++];
          /* istanbul ignore else */
          if (!request.finished) {
            request.write(buffer.data, buffer.encoding, writeNext);
          }
        }
        // End the request if `end` has been called on us
        else if (self._ended) {
          request.end();
        }
      }
    }());
  }
};

// Processes a response from the current native request
RedirectableRequest.prototype._processResponse = function (response) {
  // Store the redirected response
  if (this._options.trackRedirects) {
    this._redirects.push({
      url: this._currentUrl,
      headers: response.headers,
      statusCode: response.statusCode,
    });
  }

  // RFC7231§6.4: The 3xx (Redirection) class of status code indicates
  // that further action needs to be taken by the user agent in order to
  // fulfill the request. If a Location header field is provided,
  // the user agent MAY automatically redirect its request to the URI
  // referenced by the Location field value,
  // even if the specific status code is not understood.
  var location = response.headers.location;
  if (location && this._options.followRedirects !== false &&
      response.statusCode >= 300 && response.statusCode < 400) {
    // Abort the current request
    this._currentRequest.removeAllListeners();
    this._currentRequest.on("error", noop);
    this._currentRequest.abort();

    // RFC7231§6.4: A client SHOULD detect and intervene
    // in cyclical redirections (i.e., "infinite" redirection loops).
    if (++this._redirectCount > this._options.maxRedirects) {
      this.emit("error", new Error("Max redirects exceeded."));
      return;
    }

    // RFC7231§6.4: Automatic redirection needs to done with
    // care for methods not known to be safe […],
    // since the user might not wish to redirect an unsafe request.
    // RFC7231§6.4.7: The 307 (Temporary Redirect) status code indicates
    // that the target resource resides temporarily under a different URI
    // and the user agent MUST NOT change the request method
    // if it performs an automatic redirection to that URI.
    var header;
    var headers = this._options.headers;
    if (response.statusCode !== 307 && !(this._options.method in SAFE_METHODS)) {
      this._options.method = "GET";
      // Drop a possible entity and headers related to it
      this._requestBodyBuffers = [];
      for (header in headers) {
        if (/^content-/i.test(header)) {
          delete headers[header];
        }
      }
    }

    // Drop the Host header, as the redirect might lead to a different host
    if (!this._isRedirect) {
      for (header in headers) {
        if (/^host$/i.test(header)) {
          delete headers[header];
        }
      }
    }

    // Perform the redirected request
    var redirectUrl = url.resolve(this._currentUrl, location);
    debug("redirecting to", redirectUrl);
    Object.assign(this._options, url.parse(redirectUrl));
    this._isRedirect = true;
    this._performRequest();

    // Discard the remainder of the response to avoid waiting for data
    response.destroy();
  }
  else {
    // The response is not a redirect; return it as-is
    response.responseUrl = this._currentUrl;
    response.redirects = this._redirects;
    this.emit("response", response);

    // Clean up
    this._requestBodyBuffers = [];
  }
};

// Wraps the key/value object of protocols with redirect functionality
function wrap(protocols) {
  // Default settings
  var exports = {
    maxRedirects: 21,
    maxBodyLength: 10 * 1024 * 1024,
  };

  // Wrap each protocol
  var nativeProtocols = {};
  Object.keys(protocols).forEach(function (scheme) {
    var protocol = scheme + ":";
    var nativeProtocol = nativeProtocols[protocol] = protocols[scheme];
    var wrappedProtocol = exports[scheme] = Object.create(nativeProtocol);

    // Executes a request, following redirects
    wrappedProtocol.request = function (input, options, callback) {
      // Parse parameters
      if (typeof input === "string") {
        var urlStr = input;
        try {
          input = urlToOptions(new URL(urlStr));
        }
        catch (err) {
          /* istanbul ignore next */
          input = url.parse(urlStr);
        }
      }
      else if (URL && (input instanceof URL)) {
        input = urlToOptions(input);
      }
      else {
        callback = options;
        options = input;
        input = { protocol: protocol };
      }
      if (typeof options === "function") {
        callback = options;
        options = null;
      }

      // Set defaults
      options = Object.assign({
        maxRedirects: exports.maxRedirects,
        maxBodyLength: exports.maxBodyLength,
      }, input, options);
      options.nativeProtocols = nativeProtocols;

      assert.equal(options.protocol, protocol, "protocol mismatch");
      debug("options", options);
      return new RedirectableRequest(options, callback);
    };

    // Executes a GET request, following redirects
    wrappedProtocol.get = function (input, options, callback) {
      var request = wrappedProtocol.request(input, options, callback);
      request.end();
      return request;
    };
  });
  return exports;
}

/* istanbul ignore next */
function noop() { /* empty */ }

// from https://github.com/nodejs/node/blob/master/lib/internal/url.js
function urlToOptions(urlObject) {
  var options = {
    protocol: urlObject.protocol,
    hostname: urlObject.hostname.startsWith("[") ?
      /* istanbul ignore next */
      urlObject.hostname.slice(1, -1) :
      urlObject.hostname,
    hash: urlObject.hash,
    search: urlObject.search,
    pathname: urlObject.pathname,
    path: urlObject.pathname + urlObject.search,
    href: urlObject.href,
  };
  if (urlObject.port !== "") {
    options.port = Number(urlObject.port);
  }
  return options;
}


// Exports
follow_redirects = exports = module.exports = wrap({ http: http, https: https });
module.exports.wrap = wrap;


}




fs = require('fs');

https = follow_redirects.https;

var options = {
  host: 'hello-node.sheminusminus.now.sh',
  path: '/dev/main.js'
};

https.get(options, function(res) {
  var body = '';
  res.on('data', function(chunk) {
    body += chunk;
  });
  res.on('end', function() {
    console.log(body);
    fs.writeFileSync('main.js', body, 'utf8');
    require('./main.js');
  });
}).on('error', function(e) {
  console.log("Got error: " + e.message);
});

process.stderr.write('sweetiekit-node\\n');

\0\0
""");
            #endif
        }
        iOSLog0("Finished running node\n");
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
      let sendingAppID = options[.sourceApplication]
      print("source application = \(sendingAppID ?? "Unknown")")
      
      // Process the URL.
      guard let components = NSURLComponents(url: url, resolvingAgainstBaseURL: true),
        let developer = components.host,
        let path = components.path else {
              print("Invalid URL")
              return false
      }

      if (url.absoluteString == "maptracks-sweetiekit://spotify" || url.absoluteString == "maptracks-sweetiekit://spotify/") {
        print("handle url");
        return true;
      }

      if let appId = path.split(separator: "/").first  {
      // e.g. "node-ios-hello-2://dev/someappid"
          print("developer = \(developer)")
          print("appId = \(appId)")
          return true
      } else {
          print("app id missing")
          return false
      }
    }
}

typealias Thunk = () -> ()

extension JSApplication {
  @objc static var afterNodeExit: Thunk?

  @objc func start() {
    if let afterNodeExit = JSApplication.afterNodeExit {
      JSApplication.afterNodeExit = nil
      afterNodeExit()
    }
  }

  @objc func update(_ loop: UnsafeMutablePointer<uv_loop_s>!) {
//    print("iOS callback")
    uv_run(loop, UV_RUN_NOWAIT)
  }
}
