const {app, BrowserWindow} = require('electron');

let win;

function createWindow() {
  win = new BrowserWindow({
    widht: 600,
    height: 600,
    backgroundColor: '#fff',
    icon: `file://${__dirname}/dist/assets/logo.png`
  });


  win.loadURL(`file://${__dirname}/dist/index.html`);

  // Uncomment below to open DevTools
  // win.webContents.openDevTools();

  win.on('closed', function () {
    win = null;
  });
}

// create window on electron initialization
app.on('ready', createWindow);

// quit when all windows are closed
app.on('window-all-closed', function () {
  if (process.platform !== 'darwin') {
    app.quit();
  }
});
