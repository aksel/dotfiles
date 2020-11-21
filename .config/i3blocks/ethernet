#!/bin/node

`use strict`

const { exec } = require('child_process');

exec('nmcli -t -f TYPE,STATE device | grep ethernet:c', (err, stdout, stderr) => {
  if (err) {
    return;
  }

  // Output matches to ethernet:c, which means it is connected.
  if (stdout.length) {
    console.log("<span font_desc='FontAwesome'></span> Connected");
  }
});
